# 🪟 Configuración para Windows

## ✅ Compatibilidad con Windows

**¡SÍ! Puedes desarrollar y desplegar completamente en Windows nativo.**

Todo el stack es multiplataforma y funciona perfectamente en Windows:

- ✅ **Hardhat**: Funciona en Windows (usa Node.js)
- ✅ **Node.js/TypeScript**: Multiplataforma
- ✅ **Next.js**: Multiplataforma
- ✅ **pnpm**: Multiplataforma
- ✅ **Express Backend**: Multiplataforma

## 📋 Requisitos para Windows

### Opción 1: Desarrollo Local (Recomendado)

1. **Node.js 18+** (descarga desde nodejs.org)
2. **pnpm** (instalar con `npm install -g pnpm`)
3. **Git** (descarga desde git-scm.com)
4. **PostgreSQL** (opciones):
   - **Docker Desktop** (recomendado) - Instala PostgreSQL en contenedor
   - **PostgreSQL nativo** - Descarga desde postgresql.org
   - **Supabase local** - Alternativa
   - **Cloud SQL** - Usa servicio en la nube (no requiere instalación local)

### Opción 2: Docker (Opcional pero Recomendado)

Si prefieres un entorno más consistente:

```bash
# Instalar Docker Desktop para Windows
# https://www.docker.com/products/docker-desktop

# Luego puedes usar docker-compose para PostgreSQL
```

## 🚀 Setup en Windows

### 1. Instalar Node.js y pnpm

```powershell
# Instalar Node.js desde nodejs.org
# Luego instalar pnpm globalmente
npm install -g pnpm
```

### 2. Instalar PostgreSQL (Elige una opción)

#### Opción A: Docker (Más Fácil)

1. Instalar Docker Desktop
2. Crear `docker-compose.yml`:

```yaml
version: '3.8'
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_USER: metapredict
      POSTGRES_PASSWORD: password
      POSTGRES_DB: metapredict
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

3. Ejecutar:
```powershell
docker-compose up -d
```

#### Opción B: PostgreSQL Nativo

1. Descargar desde postgresql.org
2. Instalar con contraseña por defecto
3. Crear base de datos:
```sql
CREATE DATABASE metapredict;
```

#### Opción C: Cloud (Sin Instalación Local)

Usa servicios cloud como:
- **Supabase** (gratis tier)
- **Railway** (gratis tier)
- **Neon** (gratis tier)
- **Vercel Postgres**

### 3. Configurar Variables de Entorno

```powershell
# En PowerShell, crear .env en cada workspace
# backend/.env
DATABASE_URL=postgresql://user:password@localhost:5432/metapredict
```

### 4. Instalar Dependencias

```powershell
# En la raíz del proyecto
pnpm install
```

### 5. Iniciar Desarrollo

```powershell
# Backend (Terminal 1)
cd backend
pnpm run dev

# Frontend (Terminal 2)
cd frontend
pnpm run dev

# Smart Contracts (cuando necesites)
cd smart-contracts
pnpm run compile
```

## 🔧 Solución de Problemas en Windows

### Error: bcrypto compilation failed

**No es crítico**: bcrypto tiene fallback a JavaScript puro. Si quieres compilarlo:

1. Instalar Visual Studio Build Tools:
   - Descargar: https://visualstudio.microsoft.com/downloads/
   - Instalar "Desktop development with C++"

O simplemente ignorar el error - funciona sin compilación nativa.

### Error: PostgreSQL connection

**Solución 1**: Usar Docker
```powershell
docker-compose up -d
```

**Solución 2**: Verificar que PostgreSQL esté corriendo
```powershell
# Verificar servicio
Get-Service postgresql*
```

**Solución 3**: Usar servicio cloud (Supabase, Railway, etc.)

### Error: Path too long

Si tienes problemas con rutas largas en Windows:

1. Habilitar long paths en Windows:
```powershell
# Ejecutar como Administrador
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

2. O usar Git Bash en lugar de PowerShell

## 📦 Deployment desde Windows

### Smart Contracts (opBNB)

**Funciona perfectamente en Windows:**

```powershell
cd smart-contracts
pnpm run deploy:testnet
```

Hardhat funciona igual en Windows, Linux y macOS.

### Backend/Frontend

**Deploy a servicios cloud desde Windows:**

#### Opción 1: Vercel (Recomendado para Frontend)

```powershell
# Instalar Vercel CLI
npm install -g vercel

# Deploy
cd frontend
vercel deploy --prod
```

#### Opción 2: Railway (Backend + DB)

```powershell
# Instalar Railway CLI
npm install -g @railway/cli

# Deploy
cd backend
railway up
```

#### Opción 3: Docker + Cloud

Puedes crear imágenes Docker desde Windows y deployar a:
- AWS ECS
- Google Cloud Run
- Azure Container Instances

## 🆚 WSL vs Windows Nativo

### ¿Cuándo usar WSL?

**NO es necesario** para este proyecto, pero WSL puede ser útil si:

- ✅ Prefieres entorno Linux
- ✅ Necesitas herramientas específicas de Linux
- ✅ Quieres evitar problemas de compatibilidad

### ¿Cuándo usar Windows Nativo?

**Funciona perfectamente** para:
- ✅ Desarrollo con Hardhat
- ✅ Node.js/TypeScript
- ✅ Next.js
- ✅ Deployment a servicios cloud

## ✅ Checklist Windows

- [ ] Node.js 18+ instalado
- [ ] pnpm instalado (`npm install -g pnpm`)
- [ ] Git instalado
- [ ] PostgreSQL configurado (Docker o nativo)
- [ ] Variables de entorno configuradas
- [ ] Dependencias instaladas (`pnpm install`)
- [ ] Backend funcionando (`pnpm run dev` en backend)
- [ ] Frontend funcionando (`pnpm run dev` en frontend)

## 🎯 Recomendación Final

**Para el hackathon, Windows nativo es suficiente:**

1. ✅ Todo funciona en Windows
2. ✅ Hardhat deployment funciona igual
3. ✅ Puedes deployar a Vercel/Railway desde Windows
4. ✅ No necesitas WSL ni Linux

**Solo necesitas:**
- Docker Desktop (para PostgreSQL local) O
- Usar servicio cloud (Supabase/Railway) para PostgreSQL

---

**¡Puedes desarrollar y desplegar completamente en Windows! 🪟**

