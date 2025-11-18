# Update contract addresses in Vercel
# ⚠️ IMPORTANTE: Este script actualiza las direcciones de contratos en Vercel
# La dirección correcta del Core Contract es: 0x0bB2643aCE44Bbb4Fdcc3a4fC50eECbe3Ab4a76B
# La dirección antigua (0x46Ca523e51783a378fBa0D06d05929652D04B19E) causa errores "Only core"

Write-Host "🚀 Actualizando direcciones de contratos en Vercel..." -ForegroundColor Cyan
Write-Host "⚠️  Asegúrate de que los contratos secundarios tengan configurado el coreContract correctamente`n" -ForegroundColor Yellow

Push-Location frontend

$contracts = @{
    "NEXT_PUBLIC_CORE_CONTRACT_ADDRESS" = "0x0bB2643aCE44Bbb4Fdcc3a4fC50eECbe3Ab4a76B"
    "NEXT_PUBLIC_AI_ORACLE_ADDRESS" = "0xcc10a98Aa285E7bD16be1Ef8420315725C3dB66c"
    "NEXT_PUBLIC_INSURANCE_POOL_ADDRESS" = "0xD30B71e1Af743cD93b3b1d7d314822Bc4cd860dA"
    "NEXT_PUBLIC_REPUTATION_STAKING_ADDRESS" = "0x5935C4002Bf11eCD4525d60Ef7e2B949421E15E7"
    "NEXT_PUBLIC_DAO_GOVERNANCE_ADDRESS" = "0xC2eD64e39cD7A6Ab9448f14E1f965E1D1e819123"
    "NEXT_PUBLIC_BINARY_MARKET_ADDRESS" = "0xA62769c5C4D3f9EB64964241cB1F145bB0294F7E"
    "NEXT_PUBLIC_CONDITIONAL_MARKET_ADDRESS" = "0xd0FBDB61F04Cee610bF53eD1Bef4Bd2356EffF1b"
    "NEXT_PUBLIC_SUBJECTIVE_MARKET_ADDRESS" = "0xE933FB3bc9BfD23c0061E38a88b81702345E65d3"
    "NEXT_PUBLIC_OMNI_ROUTER_ADDRESS" = "0x11C1124384e463d99Ba84348280e318FbeE544d0"
    "NEXT_PUBLIC_DATA_STREAMS_INTEGRATION_ADDRESS" = "0x1758d4da0bAd4DB90Dfd56Be259C19cabDcF03fd"
}

$envs = @("production", "preview", "development")

foreach ($key in $contracts.Keys) {
    Write-Host "Updating $key..." -ForegroundColor Cyan
    $value = $contracts[$key]
    
    # Advertencia especial para CORE_CONTRACT_ADDRESS
    if ($key -eq "NEXT_PUBLIC_CORE_CONTRACT_ADDRESS") {
        Write-Host "  ⚠️  Dirección correcta: $value" -ForegroundColor Yellow
        Write-Host "  ⚠️  Dirección antigua (causa errores): 0x46Ca523e51783a378fBa0D06d05929652D04B19E" -ForegroundColor Red
    }
    
    foreach ($env in $envs) {
        Write-Host "  [$env] " -NoNewline
        vercel env rm $key $env --yes 2>&1 | Out-Null
        Write-Output $value | vercel env add $key $env 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "OK" -ForegroundColor Green
        } else {
            Write-Host "FAILED" -ForegroundColor Red
        }
    }
}

Pop-Location
Write-Host "`n✅ ¡Actualización completada!" -ForegroundColor Green
Write-Host "`n📋 Próximos pasos:" -ForegroundColor Yellow
Write-Host "  1. Reinicia el servidor de desarrollo o redeploy en Vercel" -ForegroundColor White
Write-Host "  2. Verifica que el error 'Only core' haya desaparecido" -ForegroundColor White
Write-Host "  3. Si el error persiste, verifica que los contratos secundarios tengan configurado el coreContract" -ForegroundColor White
Write-Host "`n💡 Si necesitas usar la dirección antigua (0x46Ca...), ejecuta setCoreContract() en cada contrato secundario" -ForegroundColor Cyan

