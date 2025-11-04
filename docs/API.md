# 📡 API Documentation

## Base URL

**Development**: `http://localhost:3001/api`
**Production**: `https://api.metapredict.ai/api`

## Authentication

La mayoría de endpoints requieren autenticación mediante JWT o firma Web3.

### Headers

```
Authorization: Bearer <JWT_TOKEN>
```

## Endpoints

### Markets

#### `GET /markets`

Obtener todos los mercados.

**Response:**
```json
{
  "markets": [
    {
      "id": "uuid",
      "description": "Will BTC exceed $100K?",
      "category": "crypto",
      "outcome": "binary",
      "deadline": "2025-12-31T00:00:00Z",
      "volume": 125000,
      "yesPercentage": 65,
      "status": "active"
    }
  ]
}
```

#### `GET /markets/:id`

Obtener mercado por ID.

#### `POST /markets`

Crear nuevo mercado.

**Request:**
```json
{
  "description": "Will X happen?",
  "category": "sports",
  "outcome": "binary",
  "deadline": "2025-12-31T00:00:00Z"
}
```

#### `POST /markets/:id/bet`

Colocar apuesta.

**Request:**
```json
{
  "amount": 100,
  "outcome": true
}
```

### Oracle

#### `POST /oracle/resolve/:marketId`

Solicitar resolución de mercado.

#### `GET /oracle/status`

Estadísticas del oracle.

**Response:**
```json
{
  "status": {
    "activeMarkets": 10,
    "pendingResolutions": 2,
    "totalResolved": 150,
    "insurancePoolBalance": 50000
  }
}
```

#### `POST /oracle/dispute`

Presentar disputa.

**Request:**
```json
{
  "marketId": "uuid",
  "reason": "Oracle incorrect"
}
```

### Reputation

#### `GET /reputation/:userId`

Obtener reputación de usuario.

**Response:**
```json
{
  "reputation": {
    "userId": "uuid",
    "stake": 1000,
    "accuracy": 75,
    "disputesWon": 5,
    "slashesIncurred": 0,
    "isMember": true
  }
}
```

#### `POST /reputation/join`

Unirse al DAO de reputación.

**Request:**
```json
{
  "stakeAmount": 100
}
```

#### `GET /reputation/leaderboard`

Leaderboard de reputación.

### Aggregation

#### `POST /aggregation/compare`

Comparar precios entre plataformas.

**Request:**
```json
{
  "marketDescription": "Will X happen?"
}
```

**Response:**
```json
{
  "comparison": {
    "bestOdds": 0.65,
    "bestPlatform": "polymarket",
    "savings": 0.03,
    "routeCost": 0.0005,
    "comparisons": [
      {
        "platform": "polymarket",
        "odds": 0.65,
        "cost": 0.0005
      }
    ]
  }
}
```

#### `POST /aggregation/execute`

Ejecutar mejor ruta.

**Request:**
```json
{
  "marketDescription": "Will X happen?",
  "betAmount": 100,
  "isYes": true
}
```

### Users

#### `GET /users/:id`

Obtener usuario por ID.

#### `POST /users`

Crear usuario (email login).

**Request:**
```json
{
  "email": "user@example.com",
  "walletAddress": "0x..."
}
```

## Error Responses

Todas las respuestas de error siguen este formato:

```json
{
  "error": "Error message",
  "code": "ERROR_CODE"
}
```

### Códigos de Error

- `400`: Bad Request
- `401`: Unauthorized
- `404`: Not Found
- `500`: Internal Server Error

## Rate Limiting

- **Default**: 100 requests/minuto
- **Authenticated**: 1000 requests/minuto

