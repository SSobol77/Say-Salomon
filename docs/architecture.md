# 🌊 Say-Salomon-AI Architecture Overview

<br>

## 🌍 Purpose

Say-Salomon is a multi-language integration layer for [Eden AI](https://www.edenai.co/), designed to provide developers with an easy, unified way to use AI services such as:

- 🗣 Text To Speech
- 🎧 Speech To Text
- 🌐 Automatic Translation
- ✍️ Text Generation
- ✅ Spell Check

The system supports multiple languages including:
- Python, Java, JavaScript, Ruby, Rust, C++, Julia, Dart

<br>

---

<br>

## 📁 Project Structure

```
Say-Salomon-AI/
├── LICENSE
├── README.md
├── examples/           # Usage examples
├── src/                # Core wrappers for each language
├── tests/              # Unit tests
├── .github/workflows/  # CI/CD config
└── docs/               # Architecture and documentation
```
<br>

---

<br>

## 🧠 Core Concept

Each language-specific file in `src/` implements the same logical interface, calling Eden AI REST endpoints using the corresponding native HTTP client:

| Language    | Library            | Async Support | JSON Parsing     |
|-------------|--------------------|----------------|------------------|
| Python      | requests           | Yes (sync)     | `json`           |
| Java        | OkHttp + Gson      | No             | `JsonObject`     |
| JavaScript  | node-fetch         | Yes (async)    | `JSON.parse()`   |
| Ruby        | Net::HTTP          | No             | `JSON`           |
| Rust        | reqwest + serde    | Yes (async)    | `serde_json`     |
| C++         | libcurl + jsoncpp  | No             | `Json::Value`    |
| Julia       | HTTP.jl + JSON3    | No             | `JSON3.read()`   |
| Dart        | http               | Yes (async)    | `jsonDecode()`   |

---

## 🔄 Eden AI API Integration

All language wrappers access the following Eden AI endpoints:

- `POST /v2/audio/text_to_speech`
- `POST /v2/audio/text_to_speech_async`
- `POST /v2/audio/speech_to_text_async`
- `POST /v2/translation/automatic_translation`
- `POST /v2/text/generation`
- `POST /v2/text/spell_check`

All responses are expected in `application/json`.

<br>

---

<br>

## 🧪 Testing & CI

The `tests/` directory contains language-specific unit tests. These are automatically executed via GitHub Actions defined in `.github/workflows/test.yml`.

CI supports:
- 🧪 Compilation and runtime validation
- 🧪 Language version pinning
- 🧪 Parallel test execution

<br>

---

<br>

## 🔐 Security Note

Each implementation requires replacing:
```plaintext
🔑 Your_API_Key
```
with your personal Eden AI API key. Ensure this key is:
- Never committed to version control
- Stored securely in CI secrets for testing

<br>

---

<br>

## 📦 Future Extensions

Planned enhancements:
- ✅ Provider configuration via arguments
- 📊 Benchmark comparisons between providers
- 🧰 CLI interface for Say-Salomon
- 🌐 Web interface / Flutter plugin

---

<br>

## 👤 Author

**Siergej Sobolewski**  
📧 s.sobolewski@hotmail.com  
🔗 https://github.com/SSobol77/Say-Salomon-AI

Licensed under GPL-3.0
