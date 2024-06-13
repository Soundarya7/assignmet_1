import 'package:assignmet_1/Colors/coustcolors.dart';
import 'package:assignmet_1/Providers/calendarnotifier.dart';
import 'package:assignmet_1/models/propertystate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';


class BookVenueScreen extends  ConsumerStatefulWidget{
   final Propertystate property;
  const BookVenueScreen({super.key, required this.property});

  @override
  ConsumerState<BookVenueScreen> createState() => _BookVenueScreenState();
}

class _BookVenueScreenState extends ConsumerState<BookVenueScreen> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ref.watch(authprovider.notifier).tryAutoLogin(),
    //ref.read(propertyprovider.notifier).getProperties();
    //PropertyNotifier().getProperties();
     ref.read(calendarProvider.notifier).fetchBookedDates(context,widget.property,ref);
  }
  @override
  Widget build(BuildContext context) {
    final calendarState = ref.watch(calendarProvider);
    final calendarNotifier = ref.read(calendarProvider.notifier);
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;

   return Scaffold(
    backgroundColor: CoustColors.colrFill,
      appBar: AppBar(
        title: Text('Manage Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2020, 1, 1),
            lastDay: DateTime(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            },
            eventLoader: (day) {
              return calendarState.bookedDates[day] ?? [];
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isNotEmpty) {
                  return _buildEventsMarker(date, events);
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Implement block date range functionality
            },
            child: Text('Block selected date range'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement show events functionality
            },
            child: Text('Show events'),
          ),
        ],
      ),
    );
  }
  
  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}