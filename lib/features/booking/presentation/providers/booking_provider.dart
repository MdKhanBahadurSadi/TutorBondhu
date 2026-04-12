import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/availability_slot.dart';

class AvailabilityNotifier extends Notifier<List<AvailabilitySlot>> {
  @override
  List<AvailabilitySlot> build() {
    // Initial fake data
    return [
      AvailabilitySlot(id: '1', dayOfWeek: 'Monday', startTime: '10:00 AM', endTime: '11:00 AM'),
      AvailabilitySlot(id: '2', dayOfWeek: 'Monday', startTime: '02:00 PM', endTime: '03:00 PM'),
      AvailabilitySlot(id: '3', dayOfWeek: 'Wednesday', startTime: '11:00 AM', endTime: '12:00 PM'),
      AvailabilitySlot(id: '4', dayOfWeek: 'Friday', startTime: '04:00 PM', endTime: '05:00 PM'),
    ];
  }

  void addSlot(AvailabilitySlot slot) {
    state = [...state, slot];
  }

  void removeSlot(String id) {
    state = state.where((slot) => slot.id != id).toList();
  }

  void toggleBooking(String id) {
    state = state.map((slot) {
      if (slot.id == id) {
        slot.isBooked = !slot.isBooked;
      }
      return slot;
    }).toList();
  }
}

final availabilityProvider = NotifierProvider<AvailabilityNotifier, List<AvailabilitySlot>>(() {
  return AvailabilityNotifier();
});
