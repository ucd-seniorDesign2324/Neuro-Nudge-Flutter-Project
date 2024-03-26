import 'dart:io';

class ICalHelper {
  // Import iCal data from a file and convert it to a list of ICalEvent objects
  static Future<List<ICalEvent>> importICal(String filePath) async {
    final file = File(filePath);
    final contents = await file.readAsString();

    List<ICalEvent> events = [];
    // Split the content by BEGIN:VEVENT and END:VEVENT to isolate each event
    var rawEvents = contents.split('BEGIN:VEVENT');
    for (var rawEvent in rawEvents) {
      if (rawEvent.contains('END:VEVENT')) {
        var eventData = rawEvent.split('\n').where((line) => line.isNotEmpty).toList();
        Map<String, dynamic> eventMap = {};
        for (var line in eventData) {
          var keyVal = line.split(':');
          if (keyVal.length > 1) {
            eventMap[keyVal[0]] = keyVal.sublist(1).join(':'); // Join back in case value contains ':'
          }
        }
        if (eventMap.isNotEmpty) {
          events.add(ICalEvent.fromMap(eventMap));
        }
      }
    }
    return events;
  }

  // Export a list of ICalEvent objects to an iCal formatted String
  static String exportICal(List<ICalEvent> events) {
    StringBuffer iCalContent = StringBuffer();
    iCalContent.writeln('BEGIN:VCALENDAR');
    iCalContent.writeln('VERSION:2.0');
    iCalContent.writeln('PRODID:NeuroNudgeCalendar');
    for (var event in events) {
      iCalContent.writeln('BEGIN:VEVENT');
      iCalContent.writeln('UID:${event.uid}');
      iCalContent.writeln('DTSTART:${_formatDateTime(event.start)}');
      iCalContent.writeln('DTEND:${_formatDateTime(event.end)}');
      iCalContent.writeln('SUMMARY:${event.summary}');
      if (event.description != null) {
        iCalContent.writeln('DESCRIPTION:${event.description}');
      }
      if (event.location != null) {
        iCalContent.writeln('LOCATION:${event.location}');
      }
      // Add more fields as necessary
      iCalContent.writeln('END:VEVENT');
    }
    iCalContent.writeln('END:VCALENDAR');
    return iCalContent.toString();
  }

  // Helper method to format DateTime for iCal
  static String _formatDateTime(DateTime dateTime) {
    return dateTime.toUtc().toString().replaceAll('-', '').replaceAll(':', '').split('.').first + 'Z';
  }
}
