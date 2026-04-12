import '../../features/home/domain/models/tutor_profile.dart';

/// Utility class for filtering tutor profiles.
class TutorFilters {
  /// Filters a list of [tutors] based on [query] and [selectedCategory].
  static List<TutorProfile> filter({
    required List<TutorProfile> tutors,
    required String query,
    required String selectedCategory,
  }) {
    final lowerQuery = query.toLowerCase();
    return tutors.where((tutor) {
      final nameMatch = tutor.name.toLowerCase().contains(lowerQuery);
      final subjectMatch =
          tutor.subjects.any((s) => s.toLowerCase().contains(lowerQuery));
      final locationMatch = tutor.location.toLowerCase().contains(lowerQuery);

      bool categoryMatch = selectedCategory == 'All' ||
          tutor.subjects.contains(selectedCategory);

      return (nameMatch || subjectMatch || locationMatch) && categoryMatch;
    }).toList();
  }
}
