# MCP Server with Qdrant

이 프로젝트는 Qdrant 벡터 데이터베이스와 MCP(Model Control Protocol) 서버를 통합하여 코드 스니펫을 저장하고 검색할 수 있는 시스템입니다.

## 기능

- 코드 스니펫 저장 및 관리
- 자연어 기반 코드 검색
- 시맨틱 검색을 통한 관련 코드 조회
- SSE(Server-Sent Events) 전송 방식 지원

## 시스템 구성

- **Qdrant**: 벡터 데이터베이스 서버 (포트: 6333, 6334)
- **MCP Server**: 코드 스니펫 관리 서버 (포트: 8000)
- **임베딩 모델**: (default)sentence-transformers/all-MiniLM-L6-v2

## MCP Tools

[QDRANT MCP 서버](https://github.com/qdrant/mcp-server-qdrant)는 다음과 같은 도구들을 제공합니다:

### 1. qdrant-store

- **기능**: Qdrant 데이터베이스에 정보를 저장
- **입력**:
  - `information` (string): 저장할 정보
  - `metadata` (JSON): 선택적 메타데이터
- **반환**: 저장 확인 메시지

### 2. qdrant-find

- **기능**: Qdrant 데이터베이스에서 관련 정보를 검색
- **입력**:
  - `query` (string): 검색에 사용할 쿼리
- **반환**: Qdrant 데이터베이스에 저장된 정보를 개별 메시지로 반환

## 시작하기

### 필수 조건

- Docker
- Docker Compose

### 설치 및 실행

#### 1. 저장소 클론

```bash
git clone <repository-url>
cd <repository-name>
```

#### 2. 서비스 시작

```bash
docker-compose up -d
```

#### 3. 서비스 상태 확인

```bash
docker-compose ps
```

### 서비스 접근

- Qdrant UI: http://localhost:6333/dashboard
- MCP Server: http://localhost:8000
- cursor 등 ai ide 에 설정 시, 아래 json 형식으로 추가 가능

```json
    "qdrant": {
      "url": "http://localhost:8000/sse"
    },
```

## 환경 변수

### Qdrant

- `RUST_LOG`: 로깅 레벨 (기본값: info)

### MCP Server

- `QDRANT_URL`: Qdrant 서버 주소
- `COLLECTION_NAME`: 컬렉션 이름
- `EMBEDDING_MODEL`: 임베딩 모델
- `TOOL_STORE_DESCRIPTION`: 저장 도구 설명
- `TOOL_FIND_DESCRIPTION`: 검색 도구 설명

## 데이터 저장

데이터는 `./qdrant_storage` 디렉토리에 영구적으로 저장됩니다.

## 서비스 관리

### 로그 확인

```bash
docker-compose logs -f
```

### 서비스 중지

```bash
docker-compose down
```

## 주의사항

- 데이터 백업을 위해 `qdrant_storage` 디렉토리를 주기적으로 백업하세요.
- 프로덕션 환경에서는 적절한 보안 설정을 추가하세요.
