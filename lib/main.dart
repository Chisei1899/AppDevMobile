import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TranslationScreen(),
    );
  }
}

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  String originalText = "";
  String translatedTextTagalog = "";
  String translatedTextKorean = "";

  // Function to convert text to speech
  Future<void> _speak(String text, String languageCode) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  // Function to translate text
  Future<void> _translateText(String text) async {
    try {
      // Translate to Tagalog
      final translationTagalog = await translator.translate(text, to: 'tl');
      // Translate to Korean
      final translationKorean = await translator.translate(text, to: 'ko');

      setState(() {
        translatedTextTagalog = translationTagalog.text;
        translatedTextKorean = translationKorean.text;
      });

      // Dictate translated text
      await _speak(translatedTextTagalog, 'tl-PH'); // Tagalog
      await _speak(translatedTextKorean, 'ko-KR'); // Korean
    } catch (e) {
      print("Translation error: $e");
      setState(() {
        translatedTextTagalog = "Translation failed";
        translatedTextKorean = "Translation failed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Translation & TTS")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text input field
            TextField(
              decoration: InputDecoration(
                labelText: "Enter text to translate",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  originalText = value;
                });
              },
            ),
            SizedBox(height: 20),
            // Display original text
            Text(
              "Original: $originalText",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            // Display translated text (Tagalog)
            Text(
              "Tagalog: $translatedTextTagalog",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            // Display translated text (Korean)
            Text(
              "Korean: $translatedTextKorean",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // Button to trigger translation and TTS
            ElevatedButton(
              onPressed: () {
                if (originalText.isNotEmpty) {
                  _translateText(originalText);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter some text to translate")),
                  );
                }
              },
              child: Text("Translate & Speak"),
            ),
          ],
        ),
      ),
    );
  }
}
