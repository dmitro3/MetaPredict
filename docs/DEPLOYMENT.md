# 🚀 Guía de Deployment

## Prerrequisitos

- Node.js 18+
- npm 9+
- Git
- Cuenta en opBNB testnet/mainnet
- API keys de sponsors

## Configuración Inicial

### 1. Clonar Repositorio

```bash
git clone https://github.com/tu-team/metapredict-ai.git
cd metapredict-ai
```

### 2. Instalar Dependencias

```bash
pnpm install
```

### 3. Configurar Variables de Entorno

Copia `.env.example` a `.env` y completa:

```bash
# Network
NEXT_PUBLIC_CHAIN_ID=5611  # opBNB Testnet
NEXT_PUBLIC_RPC_URL=https://opbnb-testnet-nodereal.io

# Smart Contracts (se llenarán después del deploy)
NEXT_PUBLIC_TRUTH_CHAIN_ADDRESS=
NEXT_PUBLIC_REPUTATION_DAO_ADDRESS=
# ...

# Chainlink
CHAINLINK_FUNCTIONS_ROUTER=
CHAINLINK_CCIP_ROUTER=
LINK_TOKEN_ADDRESS=

# Thirdweb
NEXT_PUBLIC_THIRDWEB_CLIENT_ID=

# API Keys
OPENAI_API_KEY=
ANTHROPIC_API_KEY=
# ...
```

## Deployment a Testnet

### 1. Obtener Fondos de Testnet

- **opBNB Testnet Faucet**: https://testnet-faucet.bnb.ch
- Solicita: tBNB, tLINK, tUSDC

### 2. Compilar Smart Contracts

```bash
cd smart-contracts
pnpm run compile
```

### 3. Deploy a Testnet

```bash
pnpm run deploy:testnet
```

Esto deployará:
- InsurancePool
- TruthChain
- ReputationDAO
- ConditionalMarket
- SubjectiveMarket
- OmniRouter

### 4. Verificar Contratos

```bash
pnpm exec hardhat verify --network opbnb-testnet <CONTRACT_ADDRESS> <CONSTRUCTOR_ARGS>
```

### 5. Actualizar Variables de Entorno

Copia las direcciones del deploy a `.env`:

```bash
NEXT_PUBLIC_TRUTH_CHAIN_ADDRESS=0x...
NEXT_PUBLIC_REPUTATION_DAO_ADDRESS=0x...
# ...
```

## Deployment a Mainnet

### 1. Preparación

- ✅ Smart contracts auditados (CertiK)
- ✅ Tests completos pasando
- ✅ Variables de entorno configuradas
- ✅ Fondos suficientes en mainnet

### 2. Deploy

```bash
cd smart-contracts
pnpm run deploy:mainnet
```

### 3. Verificación

```bash
pnpm exec hardhat verify --network opbnb-mainnet <CONTRACT_ADDRESS> <CONSTRUCTOR_ARGS>
```

## Backend Deployment

### 1. Configurar Base de Datos

```bash
cd backend
pnpm exec prisma migrate dev
pnpm exec prisma generate
```

### 2. Ejecutar Backend

**Desarrollo:**
```bash
pnpm run dev
```

**Producción:**
```bash
pnpm run build
pnpm start
```

### 3. Deploy a Vercel/Railway

```bash
# Vercel
vercel deploy

# Railway
railway up
```

## Frontend Deployment

### 1. Build

```bash
cd frontend
pnpm run build
```

### 2. Deploy a Vercel

```bash
vercel deploy --prod
```

O conectar GitHub a Vercel para CI/CD automático.

## Configuración de Chainlink

### 1. Functions Subscription

1. Ir a Chainlink Functions dashboard
2. Crear subscription
3. Fundear con LINK
4. Configurar DON

### 2. CCIP Setup

1. Crear CCIP lane (opBNB ↔ Polygon)
2. Fundear con LINK
3. Configurar router addresses

### 3. Automation

1. Registrar contratos en Automation Registry
2. Configurar upkeep triggers

## Post-Deployment

### Checklist

- [ ] Contratos verificados en explorer
- [ ] Frontend conectado a contratos
- [ ] Backend API funcionando
- [ ] PWA instalable en móvil
- [ ] Tests pasando
- [ ] Monitoring configurado
- [ ] Documentación actualizada

### Monitoring

- **Smart Contracts**: opBNB Scan
- **Backend**: Winston logs
- **Frontend**: Vercel Analytics

## Troubleshooting

### Error: Insufficient funds
- Verificar balance en wallet
- Solicitar más desde faucet

### Error: Contract not verified
- Verificar constructor args
- Reintentar verificación

### Error: PWA not working
- Verificar `manifest.json`
- Comprobar service worker

## Seguridad Post-Deployment

1. **Multisig**: Configurar para admin functions
2. **Rate Limiting**: Activar en backend
3. **Monitoring**: Alertas configuradas
4. **Backups**: Base de datos respaldada

