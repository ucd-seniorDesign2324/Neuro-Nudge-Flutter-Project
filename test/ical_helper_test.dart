import 'package:test/test.dart';
import 'path_to_your_ical_event_class.dart';
import 'path_to_your_ical_helper_class.dart';

void main() {
  group('ICalEvent and ICalHelper Tests', () {
    // Test for parsing iCal data into ICalEvent objects
    test('Import iCal data and create ICalEvent objects', () async {
      // Mock iCal data as a string (you could also read from a file)
      String mockICalData = '''
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Your Company//Your Product//EN
BEGIN:VEVENT
UID:123456789@example.com
DTSTART:20240325T140000Z
DTEND:20240325T150000Z
SUMMARY:Test Event
DESCRIPTION:This is a test description.
LOCATION:Test Location
END:VEVENT
END:VCALENDAR
''';

      // Call ICalHelper.importICal method with mock data
      List<ICalEvent> events = await ICalHelper.importICal(mockICalData);

      // Assertions to validate the parsed data
      expect(events.isNotEmpty, true);
      expect(events.first.summary, 'Test Event');

    });

    // Test for exporting ICalEvent objects to iCal format
    test('Export ICalEvent objects to iCal data', () {
      // Create a mock ICalEvent object
      ICalEvent event = ICalEvent(
        uid: '123456789@example.com',
        start: DateTime.utc(2024, 3, 25, 14, 0),
        end: DateTime.utc(2024, 3, 25, 15, 0),
        summary: 'Test Event',
        description: 'This is a test description.',
        location: 'Test Location',
      );

      // Call ICalHelper.exportICal method with the mock event
      String exportedData = ICalHelper.exportICal([event]);

      // Assertions to validate the exported data
      expect(exportedData.contains('BEGIN:VCALENDAR'), true);
      expect(exportedData.contains('SUMMARY:Test Event'), true);
    });
  });
}
