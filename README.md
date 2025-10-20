# SDP Platform API

> Psikolojik ve medikal ölçek geliştirme platformu - Ruby on Rails 8 API

## 🚀 Hızlı Başlangıç

```bash
git clone https://github.com/aybukeet/sdp_platform_api.git
cd sdp_platform_api
bundle install
rails db:create db:migrate
rails server
```

API: `http://localhost:3000/api/v1`

## ✨ Özellikler

- 10 model ile kapsamlı veritabanı
- RESTful API (25 endpoint)
- UUID primary keys
- PostgreSQL + JSONB
- Otomatik ID generation (SDP-YYYY-XXXX)

## 🛠️ Teknoloji

Ruby 3.4.7 • Rails 8.0.3 • PostgreSQL • API-only

## 📦 Modeller

**Core:** User, Scale, Survey, Response, Analysis  
**Relations:** ScaleItem, SurveyScale, AnalysisResponse  
**Support:** Report, CreditTransaction

```
User → Scales, Surveys, Analyses
Scale → ScaleItems, Surveys (through SurveyScale)
Survey → Responses, Scales
Response → Analyses (through AnalysisResponse)
Analysis → Report
```

## 🌐 API Endpoints

```
/api/v1/users      - User CRUD
/api/v1/scales     - Scale CRUD
/api/v1/surveys    - Survey CRUD
/api/v1/responses  - Response CRUD
/api/v1/analyses   - Analysis CRUD
```

### Örnek

```bash
# Tüm users
curl http://localhost:3000/api/v1/users

# Yeni scale
curl -X POST http://localhost:3000/api/v1/scales \
  -H "Content-Type: application/json" \
  -d '{"scale": {"title": "Anxiety Scale", "version": "1.0.0", ...}}'
```
