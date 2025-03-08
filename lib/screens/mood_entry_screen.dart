import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mood_provider.dart';

class MoodEntryScreen extends StatefulWidget {
  @override
  _MoodEntryScreenState createState() => _MoodEntryScreenState();
}

class _MoodEntryScreenState extends State<MoodEntryScreen> {
  String selectedMood = "Happy";
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD), // Soft blue background
      appBar: AppBar(
        title: Text(
          "Log Mood",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Select Your Mood",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: DropdownButton<String>(
                value: selectedMood,
                isExpanded: true,
                underline: SizedBox(),
                items: ["Happy", "Sad", "Neutral"]
                    .map((mood) => DropdownMenuItem(
                  value: mood,
                  child: Text(
                    mood,
                    style: TextStyle(fontSize: 16),
                  ),
                ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedMood = newValue!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Write a Note",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            TextField(
              controller: noteController,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "How are you feeling today?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Provider.of<MoodProvider>(context, listen: false)
                    .addMood(selectedMood, noteController.text);
                Navigator.pop(context);
              },
              child: Text("Save Mood"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF64B5F6),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
