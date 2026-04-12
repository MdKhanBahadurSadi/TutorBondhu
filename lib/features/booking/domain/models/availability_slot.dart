class AvailabilitySlot {
  final String id;
  final String dayOfWeek; // e.g., 'Monday'
  final String startTime; // e.g., '10:00 AM'
  final String endTime;   // e.g., '11:00 AM'
  bool isBooked;

  AvailabilitySlot({
    required this.id,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    this.isBooked = false,
  });
}
