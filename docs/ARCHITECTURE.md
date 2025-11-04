# 🏗️ Arquitectura de MetaPredict.ai

## Visión General

MetaPredict.ai es una plataforma completa de mercados de predicción que combina 5 tracks ganadores en una super-app unificada:

1. **TruthChain**: Oracle AI multi-LLM con seguro (Track 1)
2. **HonestBet DAO**: Reputación cross-protocol con staking (Track 2)
3. **ZeroPay Markets**: UX sin gas con login por email (Track 3)
4. **ConditionalDAO**: Mercados condicionales y subjetivos (Track 4)
5. **OmniMarket**: Agregador de liquidez cross-chain (Track 5)

## Stack Tecnológico

### Smart Contracts
- **Solidity 0.8.20**: Lenguaje de contratos
- **Hardhat**: Framework de desarrollo
- **Chainlink**: Functions, Automation, CCIP
- **OpenZeppelin**: Contratos base seguros

### Backend
- **Node.js + TypeScript**: Runtime y tipos
- **Express**: Framework web
- **Prisma**: ORM para base de datos
- **PostgreSQL**: Base de datos relacional
- **Winston**: Logging

### Frontend
- **Next.js 14**: Framework React con App Router
- **TypeScript**: Tipado estático
- **Tailwind CSS**: Estilos utilitarios
- **Framer Motion**: Animaciones
- **Thirdweb SDK**: Integración de wallet
- **PWA**: Progressive Web App

## Arquitectura de Componentes

### Smart Contracts

```
smart-contracts/
├── oracle/
│   ├── TruthChain.sol          # Oracle multi-LLM
│   └── InsurancePool.sol       # Pool de seguros ERC-4626
├── reputation/
│   └── ReputationDAO.sol        # Sistema de reputación
├── markets/
│   ├── ConditionalMarket.sol   # Mercados condicionales
│   └── SubjectiveMarket.sol    # Mercados subjetivos
└── aggregation/
    └── OmniRouter.sol          # Agregador cross-chain
```

### Backend

```
backend/
├── api/
│   ├── routes/                 # Endpoints REST
│   ├── services/               # Lógica de negocio
│   └── middleware/             # Autenticación, validación
├── database/
│   ├── schema/                 # Schemas Zod
│   └── migrations/             # Migraciones Prisma
└── config/                     # Configuración
```

### Frontend

```
frontend/
├── app/                        # Pages Next.js 14
├── components/                 # Componentes React
├── hooks/                      # Custom hooks
├── services/                   # Servicios API
└── store/                      # Estado global
```

## Flujos Principales

### 1. Creación de Mercado

```
Usuario → Frontend → Backend API → Smart Contract (TruthChain)
                                      ↓
                                 Chainlink Functions
                                      ↓
                                 Multi-LLM Oracle
                                      ↓
                                 Resolución
```

### 2. Apuesta Sin Gas

```
Usuario → Thirdweb Wallet → Embedded Wallet
                              ↓
                         Biconomy Paymaster
                              ↓
                         Smart Contract (gasless)
```

### 3. Agregación Cross-Chain

```
Usuario → OmniRouter → Query Platforms
                          ↓
                    Compare Prices
                          ↓
                    Chainlink CCIP
                          ↓
                    Execute Best Route
```

## Seguridad

- **Access Control**: Roles y permisos
- **Rate Limiting**: Protección contra spam
- **Input Validation**: Zod schemas
- **Smart Contract Audits**: CertiK
- **Emergency Pause**: Circuit breakers

## Escalabilidad

- **opBNB L2**: 4000 TPS
- **Gasless Transactions**: Biconomy
- **Cross-Chain**: Chainlink CCIP
- **Database Indexing**: Prisma optimizations

## Integraciones

- **Chainlink**: Functions, Automation, CCIP
- **Pyth**: Price feeds
- **SEDA**: Custom oracles
- **Thirdweb**: Wallet infrastructure
- **Azuro**: Sports liquidity
- **Google Cloud**: LLM compute

