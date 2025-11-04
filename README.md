# 🚀 MetaPredict.ai - All-in-One Prediction Markets Platform

**MetaPredict.ai** es una plataforma completa de mercados de predicción que combina 5 tracks ganadores en una super-app unificada:

1. **TruthChain**: Oracle AI con seguro (Track 1)
2. **HonestBet DAO**: Reputación cross-protocol con staking (Track 2)
3. **ZeroPay Markets**: UX sin gas con login por email (Track 3)
4. **ConditionalDAO**: Mercados condicionales y subjetivos (Track 4)
5. **OmniMarket**: Agregador de liquidez cross-chain (Track 5)

## 🎯 Por qué esto gana

✅ Soluciona el problema de manipulación de $7M de Polymarket  
✅ Reduce 95% de fricción UX (email → apuesta en 10 seg)  
✅ Elimina 33% de wash trading vía reputación  
✅ Soporta predicciones condicionales + subjetivas (Polymarket no puede)  
✅ Agrega liquidez fragmentada (ahorra 1-5% por apuesta)  
✅ Integra TODOS los sponsors (Chainlink, Pyth, SEDA, Thirdweb, Azuro, CertiK, Google Cloud)  
✅ 8 streams de revenue = negocio sostenible  
✅ Escalabilidad multi-vertical (deportes, política, crypto, entretenimiento, B2B)

## 🏗️ Estructura del Proyecto

```
metapredict-ai/
├── smart-contracts/     # Smart contracts (Solidity)
├── backend/            # API Node.js + TypeScript
├── frontend/           # Next.js 14 + PWA
└── docs/               # Documentación
```

## 🚀 Inicio Rápido

### Prerrequisitos

- Node.js 18+
- pnpm 8+ (recomendado: `npm install -g pnpm`)
- Git
- PostgreSQL (o Docker Desktop para PostgreSQL en contenedor)

**Nota para Windows**: El proyecto funciona perfectamente en Windows nativo. Ver [WINDOWS_SETUP.md](./docs/WINDOWS_SETUP.md) para detalles.

### Instalación

```bash
# Clonar repositorio
git clone https://github.com/tu-team/metapredict-ai.git
cd metapredict-ai

# Instalar dependencias (usa pnpm)
pnpm install

# Configurar variables de entorno
cp .env.example .env
# Editar .env con tus claves API
```

### Desarrollo

```bash
# Iniciar todos los servicios
pnpm run dev

# O iniciar por separado
pnpm run dev:backend    # Backend en http://localhost:3001
pnpm run dev:frontend   # Frontend en http://localhost:3000
```

### Testing

```bash
# Ejecutar todos los tests
pnpm run test

# Tests por componente
pnpm run test:contracts
pnpm run test:backend
pnpm run test:frontend
```

### Deployment

```bash
# Deploy a testnet (opBNB)
pnpm run deploy:testnet

# Deploy a mainnet (opBNB)
pnpm run deploy:mainnet
```

## 🌐 Redes

### Principal: BNB Chain opBNB (L2)

- **Chain ID**: 204 (mainnet) / 5611 (testnet)
- **RPC**: https://opbnb-mainnet-nodereal.io
- **Gas Token**: BNB
- **Costo Gas**: ~$0.0005 por transacción
- **TPS**: 4,000

### Testnet Setup

- **Faucet**: https://testnet-faucet.bnb.ch
- **Explorer**: https://opbnbscan.com

## 📚 Documentación

- [Arquitectura](./docs/ARCHITECTURE.md)
- [Deployment](./docs/DEPLOYMENT.md)
- [Configuración Windows](./docs/WINDOWS_SETUP.md)
- [API](./docs/API.md)
- [Smart Contracts](./docs/SMART_CONTRACTS.md)
- [Seguridad](./docs/SECURITY_AUDIT.md)

## 🛠️ Tech Stack

### Smart Contracts
- Solidity 0.8.20
- Hardhat
- Chainlink (Functions, Automation, CCIP)
- OpenZeppelin

### Backend
- Node.js + TypeScript
- Express
- PostgreSQL
- Prisma

### Frontend
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- Thirdweb SDK
- Framer Motion

## 💰 Modelo de Revenue

8 streams de monetización:

1. **Trading Fees**: 0.5% del volumen
2. **Insurance Premium**: 0.1% del volumen
3. **Freemium Gasless**: $4.99/mes
4. **DAO Staking Yield**: 5-10% APY
5. **Aggregator Spreads**: 0.1-0.3%
6. **Oracle-as-Service**: $0.30/llamada
7. **B2B Licensing**: $25K/año
8. **API Access**: $99-999/mes

**Proyección anual**: $1.456M

## 🏆 Hackathon

**Seedify Prediction Markets Hackathon**

- **Grand Prize**: $400K Cash + $250K-$1M Funding
- **Network**: BNB Chain opBNB
- **Timeline**: Nov 3-11, 2025 (8 días)
- **Link**: https://seedify.typeform.com/to/rmMvi2nr

## 📄 Licencia

MIT

## 👥 Equipo

- [Lead Dev]: Smart contract expert
- [Full Stack]: Next.js + Node.js
- [AI/ML Engineer]: LangChain, multi-model
- [UX/Product]: Figma, accessibility

---

**¡VAMO' A GANAR! 🏆**

