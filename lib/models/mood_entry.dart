class MoodEntry {
  final String mood;
  final String note;
  final DateTime date;

  MoodEntry({required this.mood, required this.note, required this.date});

  Map<String, dynamic> toMap() {
    return {'mood': mood, 'note': note, 'date': date.toIso8601String()};
  }

  factory MoodEntry.fromMap(Map<String, dynamic> map) {
    return MoodEntry(
      mood: map['mood'],
      note: map['note'],
      date: DateTime.parse(map['date']),
    );
  }
}
