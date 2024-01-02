import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

import '../providers/user_provider.dart';

/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<String>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(exampleObject);

final Map<DateTime, List<String>> exampleObject = {
  DateTime.utc(2023, 12, 1): [
    '{"rol": "ciencias", "hora": "10:00 PM", "curso": "Matematica", "profesor": "Cesar Alvarez"}',
    '{"rol": "matematicas", "hora": "10:00 PM", "curso": "Ciencias","profesor": "Cesar Alvarez"}'
  ],
  DateTime.utc(2023, 12, 5): [
    '{"rol": "general", "hora": "10:00 PM", "curso": "Ingles","profesor": "Cesar Alvarez"}',
    '{"rol": "pensamiento", "hora": "10:00 PM", "curso": "Filosofia","profesor": "Cesar Alvarez"}'
  ],
  DateTime.utc(2023, 12, 9): [
    '{"rol": "general", "hora": "10:00 PM", "curso": "Comunicación","profesor": "Cesar Alvarez"}',
    '{"rol": "arte", "hora": "10:00 PM", "curso": "Musica","profesor": "Cesar Alvarez"}'
  ],
  DateTime.utc(2023, 12, 13): [
    '{"rol": "lectura", "hora": "10:00 PM", "curso": "Deporte","profesor": "Cesar Alvarez"}',
    '{"rol": "ciencias", "hora": "10:00 PM", "curso": "Arte","profesor": "Cesar Alvarez"}',
    '{"rol": "general", "hora": "12:00 PM", "curso": "Quimica","profesor": "Julio Alvarez"}'
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
