class Review {
  final String id;
  final String reviewerName;
  final double rating;
  final String comment;
  final DateTime date;

  const Review({
    required this.id,
    required this.reviewerName,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

class TutorProfile {
  final String id;
  final String name;
  final List<String> subjects;
  final String classRange;
  final String location;
  final String salaryRange;
  final bool isVerified;
  final double rating;
  final String imageUrl;
  final String bio;
  final List<Review> reviews;

  const TutorProfile({
    required this.id,
    required this.name,
    required this.subjects,
    required this.classRange,
    required this.location,
    required this.salaryRange,
    required this.isVerified,
    required this.rating,
    required this.imageUrl,
    this.bio = '',
    this.reviews = const [],
  });


  String get hourlyRate {

    final match = RegExp(r'(\d+)').firstMatch(salaryRange);
    if (match != null) {
      final val = int.parse(match.group(0)!);
      return (val / 10).toStringAsFixed(0); // Dummy conversion
    }
    return '500';
  }
}
