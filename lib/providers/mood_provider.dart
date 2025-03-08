import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/mood_entry.dart';

class MoodProvider extends ChangeNotifier {
  List<MoodEntry> _moodEntries = [];

  List<MoodEntry> get moodEntries => _moodEntries;

  void addMood(String mood, String note) {
    final entry = MoodEntry(mood: mood, note: note, date: DateTime.now());
    _moodEntries.add(entry);
    saveToStorage();
    notifyListeners();
  }

  Future<void> saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _moodEntries.map((e) => e.toMap()).toList();
    prefs.setString('moodEntries', jsonEncode(data));
  }

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('moodEntries');
    if (data != null) {
      _moodEntries = (jsonDecode(data) as List)
          .map((e) => MoodEntry.fromMap(e))
          .toList();
      notifyListeners();
    }
  }
}
