import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/booking_provider.dart';
import '../../domain/models/availability_slot.dart';

class ManageAvailabilityScreen extends ConsumerWidget {
  const ManageAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slots = ref.watch(availabilityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Availability', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: slots.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_today_outlined, size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text('No slots added yet', style: TextStyle(color: Colors.grey.shade500)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: slots.length,
              itemBuilder: (context, index) {
                final slot = slots[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.access_time_rounded, color: Theme.of(context).primaryColor),
                    ),
                    title: Text(slot.dayOfWeek, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${slot.startTime} - ${slot.endTime}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => ref.read(availabilityProvider.notifier).removeSlot(slot.id),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddSlotDialog(context, ref),
        label: const Text('Add Slot'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  void _showAddSlotDialog(BuildContext context, WidgetRef ref) {
    String selectedDay = 'Monday';
    TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 11, minute: 0);

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Availability Slot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedDay,
                decoration: const InputDecoration(labelText: 'Day'),
                items: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
                    .map((day) => DropdownMenuItem(value: day, child: Text(day)))
                    .toList(),
                onChanged: (val) => setState(() => selectedDay = val!),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text('Start Time: ${startTime.format(context)}'),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final time = await showTimePicker(context: context, initialTime: startTime);
                  if (time != null) setState(() => startTime = time);
                },
              ),
              ListTile(
                title: Text('End Time: ${endTime.format(context)}'),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final time = await showTimePicker(context: context, initialTime: endTime);
                  if (time != null) setState(() => endTime = time);
                },
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                final newSlot = AvailabilitySlot(
                  id: DateTime.now().toString(),
                  dayOfWeek: selectedDay,
                  startTime: startTime.format(context),
                  endTime: endTime.format(context),
                );
                ref.read(availabilityProvider.notifier).addSlot(newSlot);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
