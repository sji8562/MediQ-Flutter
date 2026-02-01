import 'package:go_router/go_router.dart';
import 'package:mediq_webapp/features/onboarding/onboarding_page.dart';
import 'package:mediq_webapp/features/user_info/user_info_page.dart';
// import '../features/questionnaire/questionnaire_page.dart';
// import '../features/review/review_page.dart';
// import '../features/submit/submit_complete_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: <RouteBase>[
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/user-info',
      builder: (context, state) => const UserInfoPage(),
    ),
    // GoRoute(
    //   path: '/questionnaire',
    //   builder: (context, state) => const QuestionnairePage(),
    // ),
    // GoRoute(
    //   path: '/review',
    //   builder: (context, state) => const ReviewPage(),
    // ),
    // GoRoute(
    //   path: '/complete',
    //   builder: (context, state) => const SubmitCompletePage(),
    // ),
  ],
);
