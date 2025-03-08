import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/mood_provider.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final moodEntries = Provider.of<MoodProvider>(context).moodEntries;

    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      appBar: AppBar(
        title: Text(
          "Mood Calendar",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Calendar View
          Container(
            padding: EdgeInsets.all(16),
            child: TableCalendar(
              focusedDay: _selectedDate,
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: moodEntries.length,
              itemBuilder: (context, index) {
                final entry = moodEntries[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: _getMoodIcon(entry.mood),
                    title: Text(
                      "${entry.date.toLocal().toString().split(' ')[0]} - ${entry.mood}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(entry.note),
                    tileColor: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to return different mood icons
  Widget _getMoodIcon(String mood) {
    switch (mood) {
      case "Happy":
        return Icon(Icons.sentiment_very_satisfied, color: Colors.green);
      case "Sad":
        return Icon(Icons.sentiment_dissatisfied, color: Colors.blue);
      case "Neutral":
        return Icon(Icons.sentiment_neutral, color: Colors.grey);
      default:
        return Icon(Icons.sentiment_satisfied, color: Colors.orange);
    }
  }
}
