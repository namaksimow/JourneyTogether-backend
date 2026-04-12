# JoruneyTogether Backend

Стартовоe backend приложение на Java 21 + Spring Boot.

## Requirements

- Java 21
- Docker + Docker Compose

## Быстрый старт

```bash
git clone <repo-url>
cd MutualTravelWallet-backend
cp .env.example .env
docker compose up -d postgres
./mvnw spring-boot:run
```

## URL

- Health check: `http://localhost:8080/api/health`
- Swagger UI: `http://localhost:8080/swagger-ui.html`
- OpenAPI JSON: `http://localhost:8080/v3/api-docs`

## Настройки локальной ДБ

- Host: `localhost`
- Port: `5432`
- DB: `mutualtravelwallet`
- User: `postgres`
- Password: `postgres`

Либо для замены переменных можно использовать следующее:

- `DB_URL`
- `DB_USERNAME`
- `DB_PASSWORD`

## Stop

```bash
# stop app: Ctrl+C
docker compose down
```
