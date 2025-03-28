![SDKssn](https://github.com/user-attachments/assets/95d4372d-029f-4161-a784-c2a1bd2da8c8)

# 🌊 Say-Salomon for Eden AI

<br>

**Say-Salomon** is a cross-language integration layer for [Eden AI](https://www.edenai.co/), enabling powerful AI features in applications written in **Python, Java, C++, JavaScript, Ruby, Rust, Julia, and Dart (Flutter)**.

> 🎯 Goal: Simplify Eden AI usage to a single line of code — in any language.

---

<br>

## 🧠 Features

- 🗣️ Text To Speech  
- ⏱️ Text To Speech Async  
- 🎧 Speech To Text Async  
- 🌍 Automatic Translation  
- ✍️ Text Generation  
- ✅ Spell Check  

---

<br>

## 📁 Project Structure

```
Say-Salomon-AI/
├── src/          # Language-specific wrappers
├── examples/     # Code examples
├── tests/        # Unit tests
├── docs/         # Architecture documentation
├── .github/      # CI/CD with GitHub Actions
├── README.md
└── LICENSE
```

---

<br>

## 💻 Supported Languages

| Language    | File         | Status       |
|-------------|--------------|--------------|
| Python      | `say.py`     | ✅ Complete   |
| Java        | `say.java`   | ✅ Complete   |
| C++         | `say.cpp`    | ✅ Complete   |
| JavaScript  | `say.js`     | ✅ Complete   |
| Ruby        | `say.ruby`   | ✅ Complete   |
| Rust        | `say.rs`     | ✅ Complete   |
| Julia       | `say.jl`     | ✅ New        |
| Dart        | `say.dart`   | ✅ New        |

---

## 🔥 Quick Start

### Python

```bash
pip install requests
python examples/example.py
```

### Dart (Flutter/FlutterFlow)

```bash
dart pub add http
dart run examples/example.dart
```

### Julia

```bash
julia examples/example.jl
```

---

## 🌐 Example (Dart)

```dart
final say = SaySalomon('🔑 Your_API_Key');
final audio = await say.textToSpeech("Hello world");
print("Audio URL: $audio");
```

---

## 🔄 Eden AI API Integration

Say-Salomon wraps the following endpoints:

- `/v2/audio/text_to_speech`
- `/v2/audio/text_to_speech_async`
- `/v2/audio/speech_to_text_async`
- `/v2/translation/automatic_translation`
- `/v2/text/generation`
- `/v2/text/spell_check`

All responses are in JSON format.

---

## 🧪 Testing

- Each language has its own test in `tests/`
- CI/CD is managed via GitHub Actions
- See [`test.yml`](.github/workflows/test.yml)

---

## 🛡 Security

Remember to replace `🔑 Your_API_Key` with your real API key. Never commit your key to public repositories.

---

## 📄 License

This project is licensed under **GPL-3.0**  
📜 See [LICENSE](LICENSE)

---

## 👤 Author

**Siergej Sobolewski**  
📧 [s.sobolewski@hotmail.com](mailto:s.sobolewski@hotmail.com)  
🔗 [GitHub: SSobol77](https://github.com/SSobol77/Say-Salomon-AI)

---

> Say-Salomon — a universal bridge between your code and artificial intelligence.
