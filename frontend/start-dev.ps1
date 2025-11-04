# Script para iniciar el servidor de desarrollo de Next.js
Set-Location $PSScriptRoot

Write-Host "🚀 Iniciando servidor de desarrollo de Next.js..." -ForegroundColor Green

# Verificar que Next.js esté instalado
if (Test-Path "node_modules\next") {
    Write-Host "✅ Next.js encontrado" -ForegroundColor Green
    # Ejecutar Next.js directamente
    node node_modules\next\dist\bin\next dev
} else {
    Write-Host "❌ Next.js no encontrado. Instalando dependencias..." -ForegroundColor Yellow
    pnpm install
    Write-Host "✅ Dependencias instaladas. Iniciando servidor..." -ForegroundColor Green
    node node_modules\next\dist\bin\next dev
}

