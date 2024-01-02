// ignore_for_file: use_build_context_synchronously
import 'package:education/preferences/preferences.dart';
import 'package:education/providers/user_provider.dart';
import 'package:education/screen/calendar_screen.dart';
import 'package:education/screen/home_screen.dart';
import 'package:education/screen/links_screen.dart';
import 'package:education/screen/loader_screen.dart';
import 'package:education/widgets/custom_bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';

class RoutingScreen extends StatefulWidget {
  const RoutingScreen({Key? key}) : super(key: key);
  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {
  Service service = Service();
  Preferences preferences = Preferences();
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const CalendarScreen(),
    const LinksScreen(),
  ];
  int selectedIndex = 0;
  bool loader = true;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    void getUserInfo() async {
      String id = await preferences.returnValue();
      Map<dynamic, dynamic> userData = await service.getUser(id);
      Map<dynamic, dynamic> coursesData = await service.getCourses(id);
      Map<dynamic, dynamic> ratingsData = await service.getRatings(id);
      Map<dynamic, dynamic> scheduleData = await service.getSchedule(id);
      Map<dynamic, dynamic> calendarData = await service.getCalendar(id);

      context.read<UserProvider>().setCourses(coursesData);
      context.read<UserProvider>().setRatings(ratingsData);
      context.read<UserProvider>().setUser(userData);
      context.read<UserProvider>().setSchedule(scheduleData);
      context.read<UserProvider>().setCalendar(calendarData);
      setState(() => loader = false);
    }

    getUserInfo();
    return Scaffold(
      body: loader
          ? const LoaderScreen()
          : _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: CustomBottomNavigator(
          onItemTapped: onItemTapped, selectedIndex: selectedIndex),
    );
  }
}
