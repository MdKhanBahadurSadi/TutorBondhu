import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_bondhu/core/utils/tutor_filters.dart';
import 'package:tutor_bondhu/features/home/domain/models/tutor_profile.dart';

void main() {
  group('TutorFilters Unit Tests', () {
    final mockTutors = [
      const TutorProfile(
        id: '1',
        name: 'John Doe',
        subjects: ['Math', 'Physics'],
        classRange: '9-10',
        location: 'Dhaka',
        salaryRange: '5000',
        isVerified: true,
        rating: 4.5,
        imageUrl: '',
      ),
      const TutorProfile(
        id: '2',
        name: 'Jane Smith',
        subjects: ['English'],
        classRange: '11-12',
        location: 'Chittagong',
        salaryRange: '6000',
        isVerified: false,
        rating: 4.0,
        imageUrl: '',
      ),
    ];

    test('Filter by name should return correct results', () {
      final result = TutorFilters.filter(
        tutors: mockTutors,
        query: 'John',
        selectedCategory: 'All',
      );
      expect(result.length, 1);
      expect(result.first.name, 'John Doe');
    });

    test('Filter by subject should return correct results', () {
      final result = TutorFilters.filter(
        tutors: mockTutors,
        query: 'English',
        selectedCategory: 'All',
      );
      expect(result.length, 1);
      expect(result.first.name, 'Jane Smith');
    });

    test('Filter by category should return correct results', () {
      final result = TutorFilters.filter(
        tutors: mockTutors,
        query: '',
        selectedCategory: 'Math',
      );
      expect(result.length, 1);
      expect(result.first.subjects, contains('Math'));
    });

    test('Filter with no matches should return empty list', () {
      final result = TutorFilters.filter(
        tutors: mockTutors,
        query: 'Biology',
        selectedCategory: 'All',
      );
      expect(result, isEmpty);
    });
  });
}
