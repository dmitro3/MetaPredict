# Actualizar variables de entorno en Vercel y desplegar
# Nuevas direcciones después del redespliegue completo

Write-Host "🚀 Actualizando variables de entorno en Vercel..." -ForegroundColor Cyan
Write-Host "⚠️  Nuevas direcciones después del redespliegue completo`n" -ForegroundColor Yellow

$contracts = @{
    "NEXT_PUBLIC_CORE_CONTRACT_ADDRESS" = "0x5eaa77CC135b82c254F1144c48f4d179964fA0b1"
    "NEXT_PUBLIC_BINARY_MARKET_ADDRESS" = "0x41A5CFeEf9C7fc50e68E13bAbB11b3B8872a0b6d"
    "NEXT_PUBLIC_CONDITIONAL_MARKET_ADDRESS" = "0x41C2b1FB595Ad18cb111c3a3Fc1B2d6307e43741"
    "NEXT_PUBLIC_SUBJECTIVE_MARKET_ADDRESS" = "0xAE88cE8f797FCBD36b0Ae78f80FDb11774d766f8"
    "NEXT_PUBLIC_AI_ORACLE_ADDRESS" = "0xcc10a98Aa285E7bD16be1Ef8420315725C3dB66c"
    "NEXT_PUBLIC_INSURANCE_POOL_ADDRESS" = "0xD30B71e1Af743cD93b3b1d7d314822Bc4cd860dA"
    "NEXT_PUBLIC_REPUTATION_STAKING_ADDRESS" = "0x5935C4002Bf11eCD4525d60Ef7e2B949421E15E7"
    "NEXT_PUBLIC_DAO_GOVERNANCE_ADDRESS" = "0xC2eD64e39cD7A6Ab9448f14E1f965E1D1e819123"
    "NEXT_PUBLIC_OMNI_ROUTER_ADDRESS" = "0x11C1124384e463d99Ba84348280e318FbeE544d0"
    "NEXT_PUBLIC_DATA_STREAMS_INTEGRATION_ADDRESS" = "0x1758d4da0bAd4DB90Dfd56Be259C19cabDcF03fd"
}

$envs = @("production", "preview", "development")

foreach ($key in $contracts.Keys) {
    $value = $contracts[$key]
    
    # Advertencia especial para CORE_CONTRACT_ADDRESS
    if ($key -eq "NEXT_PUBLIC_CORE_CONTRACT_ADDRESS") {
        Write-Host "`n  ⚠️  NUEVA dirección del Core: $value" -ForegroundColor Green
        Write-Host "  ⚠️  Dirección antigua (ya no funciona): 0x0bB2643aCE44Bbb4Fdcc3a4fC50eECbe3Ab4a76B" -ForegroundColor Red
    }
    
    foreach ($env in $envs) {
        Write-Host "  [$env] $key " -NoNewline
        # Eliminar variable existente (ignorar errores si no existe)
        vercel env rm $key $env --yes 2>&1 | Out-Null
        # Agregar nueva variable
        Write-Output $value | vercel env add $key $env 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ OK" -ForegroundColor Green
        } else {
            Write-Host "❌ FAILED" -ForegroundColor Red
        }
    }
}

Write-Host "`n✅ Variables de entorno actualizadas!" -ForegroundColor Green
Write-Host "`n🚀 Desplegando a Vercel..." -ForegroundColor Cyan

# Cambiar al directorio frontend y desplegar
Set-Location frontend
vercel --prod

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nDespliegue completado exitosamente!" -ForegroundColor Green
    Write-Host "`nProximos pasos:" -ForegroundColor Yellow
    Write-Host "  1. Verifica que el error 'Only core' haya desaparecido" -ForegroundColor White
    Write-Host "  2. Prueba crear un mercado y apostar" -ForegroundColor White
} else {
    Write-Host "`nError en el despliegue. Revisa los mensajes anteriores." -ForegroundColor Red
}

Set-Location ..

