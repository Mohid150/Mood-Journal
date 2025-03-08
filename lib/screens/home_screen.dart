import 'package:flutter/material.dart';
import 'mood_entry_screen.dart';
import 'calendar_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD), // Soft blue background
      appBar: AppBar(
        title: Text(
          "Mood Journal",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87, // Dark text for contrast
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // No shadow for a clean look
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStyledButton(
              text: "Log Mood",
              icon: Icons.edit_note,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoodEntryScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildStyledButton(
              text: "View Calendar",
              icon: Icons.calendar_today,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF64B5F6), // Calming blue button
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded buttons
        ),
        elevation: 5, // Light shadow effect
      ),
    );
  }
}
