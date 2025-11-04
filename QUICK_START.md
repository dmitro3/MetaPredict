# 🚀 Inicio Rápido - MetaPredict.ai

## ⚡ Setup en 5 Minutos

### 1. Instalar Dependencias

```bash
# Instalar dependencias de todos los workspaces (usa pnpm)
pnpm install

# O instalar por separado:
cd smart-contracts && pnpm install
cd ../backend && pnpm install
cd ../frontend && pnpm install
```

**Nota**: Este proyecto usa `pnpm` como gestor de paquetes. Si no lo tienes instalado:
```bash
npm install -g pnpm
```

**¿Usas Windows?** Lee [WINDOWS_SETUP.md](./docs/WINDOWS_SETUP.md) para la guía completa.

### 2. Configurar Variables de Entorno

Crea archivos `.env` en cada workspace:

**Root `.env`** (opcional):
```bash
# Copia las variables necesarias del .env.example
```

**Backend `.env`**:
```bash
PORT=3001
DATABASE_URL=postgresql://user:password@localhost:5432/metapredict
NEXT_PUBLIC_API_URL=http://localhost:3001
```

**Frontend `.env.local`**:
```bash
NEXT_PUBLIC_CHAIN_ID=5611
NEXT_PUBLIC_RPC_URL=https://opbnb-testnet-nodereal.io
NEXT_PUBLIC_THIRDWEB_CLIENT_ID=your_client_id
```

### 3. Iniciar Desarrollo

**Opción A: Todo junto** (recomendado):
```bash
pnpm run dev
```

**Opción B: Por separado**:
```bash
# Terminal 1: Backend
cd backend && pnpm run dev

# Terminal 2: Frontend
cd frontend && pnpm run dev
```

### 4. Acceder a la Aplicación

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:3001/api
- **Health Check**: http://localhost:3001/health

## 📋 Checklist de Setup

### Smart Contracts
- [ ] Instalar dependencias: `cd smart-contracts && pnpm install`
- [ ] Configurar Hardhat: `hardhat.config.ts`
- [ ] Obtener fondos de testnet (opBNB faucet)
- [ ] Compilar: `pnpm run compile`
- [ ] Deploy a testnet: `pnpm run deploy:testnet`

### Backend
- [ ] Instalar dependencias: `cd backend && pnpm install`
- [ ] Configurar base de datos PostgreSQL
- [ ] Ejecutar migraciones: `pnpm exec prisma migrate dev`
- [ ] Iniciar servidor: `pnpm run dev`

### Frontend
- [ ] Instalar dependencias: `cd frontend && pnpm install`
- [ ] Configurar Thirdweb Client ID
- [ ] Iniciar dev server: `pnpm run dev`
- [ ] Verificar PWA: Instalar en móvil

## 🔧 Configuración Adicional

### Chainlink Functions

1. Crear subscription en Chainlink Functions
2. Fundear con LINK
3. Configurar DON
4. Actualizar variables de entorno

### Thirdweb

1. Crear proyecto en Thirdweb Dashboard
2. Obtener Client ID
3. Configurar redes (opBNB testnet/mainnet)
4. Activar email login

### Base de Datos

1. Instalar PostgreSQL
2. Crear base de datos
3. Ejecutar `npx prisma migrate dev`
4. Generar Prisma Client: `npx prisma generate`

## 🐛 Troubleshooting

### Error: Module not found
```bash
# Limpiar node_modules y reinstalar
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

### Error: Cannot connect to database
- Verificar que PostgreSQL esté corriendo
- Verificar `DATABASE_URL` en `.env`
- Verificar permisos de usuario

### Error: PWA not working
- Verificar `manifest.json` en `/public`
- Verificar service worker
- Probar en HTTPS (PWA requiere HTTPS)

### Error: Smart contract compilation
```bash
# Limpiar cache y recompilar
cd smart-contracts
rm -rf cache artifacts
pnpm run compile
```

## 📚 Próximos Pasos

1. **Lee la documentación completa**:
   - [ARCHITECTURE.md](./docs/ARCHITECTURE.md)
   - [DEPLOYMENT.md](./docs/DEPLOYMENT.md)
   - [API.md](./docs/API.md)

2. **Configura integraciones**:
   - Chainlink Functions
   - Pyth Network
   - SEDA
   - Azuro

3. **Deploy a testnet**:
   - Deploy smart contracts
   - Verificar en explorer
   - Conectar frontend

4. **Testing**:
   - Tests unitarios
   - Tests de integración
   - Tests E2E

## 🎯 Para el Hackathon

### Checklist Pre-Submission

- [ ] Todos los tests pasando
- [ ] Demo funcionando end-to-end
- [ ] Video demo grabado (5 min)
- [ ] README actualizado
- [ ] Documentación completa
- [ ] Código público en GitHub
- [ ] Deploy a testnet verificado
- [ ] Integraciones de sponsors funcionando

### Demo Flow

1. **Email Login** → Thirdweb wallet
2. **Crear Mercado** → TruthChain
3. **Colocar Apuesta** → Gasless
4. **Resolución** → Multi-LLM Oracle
5. **Reputación** → ReputationDAO
6. **Agregación** → OmniRouter

---

**¡Listo para construir! 🚀**

Para más ayuda, consulta la [documentación completa](./docs/).

