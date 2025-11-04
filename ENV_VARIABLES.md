# Variables de Entorno - MetaPredict.ai

## Frontend (Next.js)

Crear archivo `.env.local` en `frontend/`:

```env
# Thirdweb Client ID
NEXT_PUBLIC_THIRDWEB_CLIENT_ID=your_thirdweb_client_id_here

# Contract Addresses (opBNB Testnet)
NEXT_PUBLIC_PREDICTION_MARKET_ADDRESS=0x0000000000000000000000000000000000000000
NEXT_PUBLIC_AI_ORACLE_ADDRESS=0x0000000000000000000000000000000000000000
NEXT_PUBLIC_INSURANCE_POOL_ADDRESS=0x0000000000000000000000000000000000000000

# RPC URLs
NEXT_PUBLIC_OPBNB_TESTNET_RPC=https://opbnb-testnet-rpc.bnbchain.org

# WalletConnect
NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID=your_walletconnect_project_id_here

# Backend API
NEXT_PUBLIC_API_URL=http://localhost:3001
```

## Backend (Express)

Crear archivo `.env` en `backend/`:

```env
# Server Configuration
PORT=3001
NODE_ENV=development

# LLM API Keys (NEVER expose to frontend!)
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GOOGLE_API_KEY=...

# Chainlink Functions
CHAINLINK_ROUTER_ADDRESS=0x...
CHAINLINK_SUBSCRIPTION_ID=123
CHAINLINK_DON_ID=0x...
CHAINLINK_SIGNATURE_SECRET=your_secret_here

# Pyth Network
PYTH_HERMES_URL=https://hermes.pyth.network

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/metapredict
```

## Smart Contracts (Hardhat/Foundry)

Crear archivo `.env` en `smart-contracts/`:

```env
# Private Keys (NEVER commit real keys!)
PRIVATE_KEY=your_private_key_here

# RPC URLs
RPC_URL=https://opbnb-mainnet-rpc.bnbchain.org
RPC_URL_TESTNET=https://opbnb-testnet-rpc.bnbchain.org

# Explorer API
BSCSCAN_API_KEY=your_bscscan_api_key_here

# Chainlink Functions
CHAINLINK_FUNCTIONS_ROUTER=0x...
CHAINLINK_FUNCTIONS_SUBSCRIPTION_ID=123
CHAINLINK_FUNCTIONS_DON_ID=0x...

# Pyth Oracle
PYTH_ORACLE_ADDRESS=0x...

# Venus Protocol (opBNB)
VENUS_VUSDC_ADDRESS=0x...
```

## Notas de Seguridad

1. **NUNCA** commitear archivos `.env` con valores reales
2. Las variables `NEXT_PUBLIC_*` son públicas (expuestas al navegador)
3. Las API keys deben estar solo en el backend
4. Usar diferentes keys para testnet y mainnet
5. Rotar keys regularmente

