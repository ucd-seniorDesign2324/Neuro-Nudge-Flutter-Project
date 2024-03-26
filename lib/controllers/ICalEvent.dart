class ICalEvent {
  String uid;
  String summary;
  DateTime start;
  DateTime end;
  String description;
  String location;
  String organizer;
  List<String> attendees = [];
  String recurrenceRule;
  Map<String, dynamic> customProperties = {}; // For any additional properties not explicitly defined

  ICalEvent({
    this.uid,
    this.summary,
    this.start,
    this.end,
    this.description,
    this.location,
    this.organizer,
    this.recurrenceRule,
  });

  // Add an attendee to the event
  void addAttendee(String attendee) {
    attendees.add(attendee);
  }

  // Set a custom property
  void setCustomProperty(String key, dynamic value) {
    customProperties[key] = value;
  }

  // Factory constructor to create an ICalEvent from a map of iCal properties
  factory ICalEvent.fromMap(Map<String, dynamic> data) {
    var event = ICalEvent(
      uid: data['UID'] as String,
      summary: data['SUMMARY'] as String,
      start: DateTime.parse(data['DTSTART'] as String),
      end: DateTime.parse(data['DTEND'] as String),
      description: data['DESCRIPTION'] as String,
      location: data['LOCATION'] as String,
      organizer: data['ORGANIZER'] as String,
      recurrenceRule: data['RRULE'] as String,
    );

    if (data.containsKey('ATTENDEE')) {
      var attendees = data['ATTENDEE'];
      if (attendees is List<String>) {
        event.attendees = attendees;
      } else if (attendees is String) {
        event.attendees.add(attendees);
      }
    }

    // Handle any additional custom properties
    data.forEach((key, value) {
      if (!event._standardProperties.contains(key)) {
        event.setCustomProperty(key, value);
      }
    });

    return event;
  }

  // A list of standard iCal event properties to help distinguish custom properties
  List<String> get _standardProperties => [
        'UID', 'SUMMARY', 'DTSTART', 'DTEND', 'DESCRIPTION', 'LOCATION', 'ORGANIZER', 'RRULE', 'ATTENDEE'
      ];
}
