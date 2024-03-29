// ignore_for_file: library_private_types_in_public_api

import 'dart:collection';
import 'package:education/helpers/helpers.dart';
import 'package:education/providers/user_provider.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_calendar_widget.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:education/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import './utils.dart';
import 'dart:convert';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScrennState createState() => _CalendarScrennState();
}

class _CalendarScrennState extends State<CalendarScreen> {
  late Map<DateTime, List<String>> kEvents;
  late DateTime kToday;
  Map<String, dynamic> calendarData = {};
  Map<DateTime, List<String>> exampleObjectI = {};
  Helpers helper = Helpers();

  static int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    kToday = DateTime.now();

    kEvents = LinkedHashMap<DateTime, List<String>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(exampleObjectI);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final ValueNotifier<List<String>> _selectedEvents = ValueNotifier([]);
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  void dispose() {
    _selectedEvents.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  List<String> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<String> _getEventsForDays(Set<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
    });

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      calendarData = context.watch<UserProvider>().calendar["data"];
      exampleObjectI = helper.convertJson(calendarData);
      kEvents = LinkedHashMap<DateTime, List<String>>(
        equals: isSameDay,
        hashCode: getHashCode,
      )..addAll(exampleObjectI);
    });

    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(
        title: "Calendario",
        beforeWidget: RoutingScreen(),
        leadingActive: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TableCalendar<String>(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              headerStyle: const HeaderStyle(
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  titleTextStyle:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800)),
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                markerDecoration: BoxDecoration(
                    color: Colors.blue[700], shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue[300],
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue[200],
                  shape: BoxShape.circle,
                ),
              ),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day) {
                // Use values from Set to mark multiple days as selected
                return _selectedDays.contains(day);
              },
              onDaySelected: _onDaySelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(255.0))),
              onPressed: () {
                setState(() {
                  _selectedDays.clear();
                  _selectedEvents.value = [];
                });
              },
              child: const Text(
                'Eliminar selección',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(bottom: 15, top: 15, left: 30, right: 30),
            child: const Text(
              "Tus clases de hoy",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
            ),
          ),
          calendarData.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30.0),
                  child: NoDataWidget(
                      message:
                          "No tienes un horario registrado, comunícate con tus profesores si crees que se trata de un error."),
                )
              : Expanded(
                  child: ValueListenableBuilder<List<String>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return value.isEmpty
                          ? NoDataWidget(
                              message:
                                  "Elige una fecha para visualizar las materias programadas para ese día.")
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                String data = value[index];
                                Map<String, dynamic> dataObject =
                                    json.decode(data);

                                return CardCalendarWidget(
                                    title: dataObject["curso"],
                                    time: dataObject["hora"],
                                    teacher: dataObject["profesor"],
                                    rol: dataObject["rol"]);
                              },
                            );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
