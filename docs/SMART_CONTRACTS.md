# 🔐 Smart Contracts Documentation

## Contratos Principales

### TruthChain.sol

Oracle multi-LLM con seguro.

**Funciones Principales:**

- `createMarket(uint256 _marketId, string memory _description, uint256 _deadline)`: Crear mercado
- `requestResolution(uint256 _marketId)`: Solicitar resolución vía Chainlink Functions
- `fileDispute(uint256 _marketId, string memory _reason)`: Presentar disputa
- `fulfillRequest(bytes32 requestId, bytes memory response, bytes memory err)`: Callback de Chainlink

**Lógica de Consenso:**

- 5 LLMs: OpenAI, Anthropic, Google, Together AI, Hugging Face
- Si 80%+ acuerdo: Resolver
- Si 60-80%: Flag para revisión humana
- Si <60%: Pago de seguro automático

### InsurancePool.sol

Pool de seguros ERC-4626.

**Funciones:**

- `deposit(uint256 assets, address receiver)`: Depositar USDC
- `claimInsurance(address recipient, uint256 amount)`: Reclamar seguro
- `getPoolBalance()`: Obtener balance del pool

**Fuentes de Fondos:**

- 0.1% del volumen de mercado
- Yield via Venus Protocol (5-8% APY)

### ReputationDAO.sol

Sistema de reputación cross-protocol.

**Funciones:**

- `joinDAO(uint256 _stakeAmount)`: Unirse con stake
- `updateReputation(address _user, bool _wasCorrect, uint256 _marketSize, uint256 _confidence)`: Actualizar reputación
- `portReputationCrossChain(uint256 _destinationChainId)`: Portar reputación via CCIP

**Fórmula de Slashing:**

```
Slash = Base Stake × (Market Size / $1M) × (1 - Reputation%) × Confidence%
```

### ConditionalMarket.sol

Mercados condicionales (IF-THEN).

**Funciones:**

- `createConditionalMarket(uint256 _parentMarketId, uint256 _parentOutcome, string memory _description, uint256 _deadline)`: Crear mercado condicional
- `buyConditionalPosition(uint256 _marketId, uint256 _outcome, uint256 _amount)`: Comprar posición
- `resolveConditional(uint256 _marketId, uint256 _outcome)`: Resolver mercado

### SubjectiveMarket.sol

Mercados subjetivos con votación DAO.

**Funciones:**

- `createSubjectiveMarket(string memory _description, uint256 _deadline)`: Crear mercado subjetivo
- `submitVote(uint256 _marketId, uint256 _score, uint256 _stake)`: Votar (votación cuadrática)
- `resolveSubjective(uint256 _marketId)`: Resolver (mediana)

**Votación Cuadrática:**

Influencia = sqrt(stake)

### OmniRouter.sol

Agregador cross-chain.

**Funciones:**

- `getPriceComparison(string memory _marketDescription)`: Comparar precios
- `executeBestRoute(string memory _marketDescription, uint256 _betAmount, bool _isYes)`: Ejecutar mejor ruta
- `getPortfolio(address _user)`: Obtener portfolio

## Seguridad

### Access Control

- `DEFAULT_ADMIN_ROLE`: Admin functions
- `RESOLVER_ROLE`: Resolver mercados
- `CLAIMER_ROLE`: Reclamar seguros

### Emergency Pause

Todos los contratos incluyen `EmergencyPause` para detener en caso de vulnerabilidad.

### Rate Limiting

Protección contra spam y ataques Sybil.

## Testing

Ejecutar tests:

```bash
cd smart-contracts
npm run test
```

Coverage objetivo: 80%+

## Auditoría

Contratos auditados por CertiK antes de mainnet deployment.

