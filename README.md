# 🎯 SDP Platform API

<div align="center">

![Ruby](https://img.shields.io/badge/Ruby-3.4.7-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Rails-8.0.3-D30001?style=for-the-badge&logo=rubyonrails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![RSpec](https://img.shields.io/badge/RSpec-Testing-red?style=for-the-badge&logo=ruby&logoColor=white)

**🚀 Modern Ölçek ve Anket Yönetim Platformu Backend API'si**

_Psikolojik testler, anketler ve ölçekleri yönetmek için güçlü RESTful API_

[Özellikler](#-özellikler) • [Hızlı Başlangıç](#-hızlı-başlangıç) • [API Dokümantasyonu](#-api-endpoints) • [Modeller](#-veritabanı-modelleri)

</div>

---

## 📖 Proje Hakkında

SDP Platform API, ölçek ve anket oluşturma, yönetme ve analiz etme için geliştirilmiş **production-ready** bir RESTful API'dir. Modern Ruby on Rails 8 ile inşa edilmiş, güvenli ve ölçeklenebilir bir backend çözümü sunar.

📚 Bu proje, Yazılım Geliştirme ve Test dersi ödevi kapsamında geliştirilmiştir.
Senaryo: Kullanıcı, yeni bir ölçek (anket) oluşturur. Backend API bunu kaydeder, frontend formu aracılığıyla kullanıcıya gösterilir.
Geliştirme Süreci:

✅ TDD yaklaşımı ile RSpec testleri yazıldı (Red → Green → Refactor)
✅ RESTful API endpoint'leri oluşturuldu
✅ Postman ile API doğrulaması yapıldı (201 Created)
✅ Frontend entegrasyonu tamamlandı
✅ %100 test coverage hedeflendi

### ✨ Özellikler

- 🗄️ **10 Model ile Kapsamlı Veritabanı** - User, Scale, Survey, Response, Analysis ve daha fazlası
- 🔗 **25+ RESTful API Endpoint** - Tam CRUD desteği
- 🆔 **UUID Primary Keys** - Güvenli ve tahmin edilemez ID'ler
- 🔢 **Otomatik ID Generation** - `SDP-YYYY-XXXX` formatında unique identifier'lar
- 📊 **PostgreSQL + JSONB** - Esnek metadata desteği
- 🔐 **JWT Authentication** - Devise ile güvenli kimlik doğrulama
- 👮 **Authorization** - Pundit ile rol tabanlı erişim kontrolü
- 🌐 **CORS Ready** - Frontend entegrasyonu için hazır
- 🧪 **RSpec Tests** - Comprehensive test coverage
- 📚 **API Docs** - Rswag ile Swagger dokümantasyonu

---

## 🚀 Hızlı Başlangıç

### Gereksinimler

- Ruby 3.4.7
- Rails 8.0.3
- PostgreSQL 14+
- Bundler 2.0+

### Kurulum

```bash
# Repository'yi klonla
git clone https://github.com/aybukeet/sdp_platform_api.git
cd sdp_platform_api

# Bağımlılıkları yükle
bundle install

# Veritabanını oluştur ve migrate et
rails db:create db:migrate

# (Opsiyonel) Seed data yükle
rails db:seed

# Sunucuyu başlat
rails server
```

### ✅ API Çalışıyor!

API şu adreste çalışacak: **`http://localhost:3000/api/v1`**

Hızlı test:

```bash
curl http://localhost:3000/api/v1/scales
```

---

## 🛠️ Teknoloji Stack

| Teknoloji      | Versiyon | Amaç                     |
| -------------- | -------- | ------------------------ |
| **Ruby**       | 3.4.7    | Programming Language     |
| **Rails**      | 8.0.3    | Web Framework (API-only) |
| **PostgreSQL** | 14+      | Primary Database         |
| **Devise**     | Latest   | Authentication           |
| **Devise JWT** | Latest   | Token-based Auth         |
| **Pundit**     | Latest   | Authorization            |
| **RSpec**      | Latest   | Testing Framework        |
| **Rswag**      | Latest   | API Documentation        |
| **rack-cors**  | Latest   | Cross-Origin Support     |

---

## 📦 Veritabanı Modelleri

<div align="center">

### **Core Models**

| Model           | Açıklama                          |
| --------------- | --------------------------------- |
| 👤 **User**     | Kullanıcı hesapları ve profilleri |
| 📋 **Scale**    | Psikolojik ölçekler ve testler    |
| 📝 **Survey**   | Anket şablonları                  |
| 💬 **Response** | Kullanıcı cevapları               |
| 📊 **Analysis** | Analiz sonuçları                  |

### **Relation Models**

| Model                   | Açıklama                     |
| ----------------------- | ---------------------------- |
| 🔢 **ScaleItem**        | Ölçek soruları ve maddeleri  |
| 🔗 **SurveyScale**      | Survey-Scale ilişkileri      |
| 📈 **AnalysisResponse** | Analysis-Response ilişkileri |

### **Support Models**

| Model                    | Açıklama            |
| ------------------------ | ------------------- |
| 📄 **Report**            | PDF/Excel raporları |
| 💳 **CreditTransaction** | Kredi işlemleri     |

</div>

### 🔄 İlişki Diyagramı

```
User ──┬──> Scales
       ├──> Surveys
       └──> Analyses

Scale ──┬──> ScaleItems
        └──> Surveys (through SurveyScale)

Survey ──┬──> Responses
         └──> Scales (through SurveyScale)

Response ──> Analyses (through AnalysisResponse)

Analysis ──> Report
```

---

## 🌐 API Endpoints

### 🔑 Base URL

```
http://localhost:3000/api/v1
```

### 📚 Endpoints Listesi

| Method        | Endpoint       | Açıklama                  |
| ------------- | -------------- | ------------------------- |
| **Users**     |
| GET           | `/users`       | Tüm kullanıcıları listele |
| GET           | `/users/:id`   | Tek kullanıcı detayı      |
| POST          | `/users`       | Yeni kullanıcı oluştur    |
| PUT           | `/users/:id`   | Kullanıcı güncelle        |
| DELETE        | `/users/:id`   | Kullanıcı sil             |
| **Scales**    |
| GET           | `/scales`      | Tüm ölçekleri listele     |
| GET           | `/scales/:id`  | Tek ölçek detayı          |
| POST          | `/scales`      | Yeni ölçek oluştur        |
| PUT           | `/scales/:id`  | Ölçek güncelle            |
| DELETE        | `/scales/:id`  | Ölçek sil                 |
| **Surveys**   |
| GET           | `/surveys`     | Tüm anketleri listele     |
| GET           | `/surveys/:id` | Tek anket detayı          |
| POST          | `/surveys`     | Yeni anket oluştur        |
| PUT           | `/surveys/:id` | Anket güncelle            |
| DELETE        | `/surveys/:id` | Anket sil                 |
| **Responses** |
| GET           | `/responses`   | Tüm cevapları listele     |
| POST          | `/responses`   | Yeni cevap kaydet         |
| **Analyses**  |
| GET           | `/analyses`    | Tüm analizleri listele    |
| POST          | `/analyses`    | Yeni analiz oluştur       |

---

## 💡 Kullanım Örnekleri

### 📋 Tüm Ölçekleri Listele

```bash
curl http://localhost:3000/api/v1/scales
```

**Response:**

```json
{
  "success": true,
  "message": "Success",
  "data": [
    {
      "id": "279c798d-810c-4698-aef8-623bc565801a",
      "unique_identifier": "SDP-2025-0001",
      "title": "Depression Scale",
      "description": "Measures depression levels",
      "version": "1.0.0",
      "language": "en",
      "category": "Psychology",
      "status": "published"
    }
  ]
}
```

### ➕ Yeni Ölçek Oluştur

```bash
curl -X POST http://localhost:3000/api/v1/scales \
  -H "Content-Type: application/json" \
  -d '{
    "scale": {
      "title": "Anxiety Scale",
      "description": "Measures anxiety levels",
      "version": "1.0.0",
      "language": "en",
      "category": "Psychology",
      "status": "draft",
      "user_id": "your-user-uuid-here"
    }
  }'
```

### 🔍 Tek Ölçek Detayı

```bash
curl http://localhost:3000/api/v1/scales/279c798d-810c-4698-aef8-623bc565801a
```

### ✏️ Ölçek Güncelle

```bash
curl -X PUT http://localhost:3000/api/v1/scales/279c798d-810c-4698-aef8-623bc565801a \
  -H "Content-Type: application/json" \
  -d '{
    "scale": {
      "title": "Updated Title",
      "status": "published"
    }
  }'
```

---

## 🧪 Test

### Test Suite Çalıştırma

```bash
# Tüm testleri çalıştır
bundle exec rspec

# Tek bir test dosyası
bundle exec rspec spec/requests/scales_spec.rb

# Coverage raporu
bundle exec rspec --format documentation
```

### Test Örneği

```ruby
# spec/requests/scales_spec.rb
RSpec.describe "Scales API", type: :request do
  describe "POST /api/v1/scales" do
    it "yeni bir ölçek oluşturur" do
      post "/api/v1/scales", params: {
        scale: {
          title: "Test Ölçeği",
          description: "Bu bir testtir",
          version: "1.0.0"
        }
      }

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["data"]["title"]).to eq("Test Ölçeği")
    end
  end
end
```

---

## 🔧 Yapılandırma

### CORS Ayarları

Frontend entegrasyonu için CORS yapılandırması:

```ruby
# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3001', 'http://localhost:3001'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
```

### Environment Variables

`.env` dosyası oluştur:

```env
DATABASE_URL=postgresql://localhost/sdp_platform_development
DEVISE_JWT_SECRET_KEY=your-secret-key-here
RAILS_ENV=development
```

---

## 📚 API Dokümantasyonu

Swagger UI dokümantasyonuna erişmek için:

```
http://localhost:3000/api-docs
```

---

## 👤 İletişim

**Proje Linki:** [https://github.com/aybukeet/sdp_platform_api](https://github.com/aybukeet/sdp_platform_api)

---

<div align="center">

**⭐ Projeyi beğendiyseniz yıldız vermeyi unutmayın!**

Made with ❤️ by Aybuke

</div>
