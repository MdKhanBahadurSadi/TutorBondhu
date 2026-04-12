import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/booking/presentation/screens/manage_availability_screen.dart';

import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/tutor_details_screen.dart';
import '../../features/payment/presentation/screens/payment_screen.dart';
import '../../features/home/domain/models/tutor_profile.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/tutor-details',
      builder: (context, state) {
        final tutor = state.extra as TutorProfile;
        return TutorDetailsScreen(tutor: tutor);
      },
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        final recipient = state.extra;
        return ChatScreen(recipient: recipient);
      },
    ),
    GoRoute(
      path: '/manage-availability',
      builder: (context, state) => const ManageAvailabilityScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
  ],
);
