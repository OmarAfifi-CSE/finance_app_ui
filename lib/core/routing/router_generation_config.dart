import 'package:finance_app_ui/core/features/auth/reset_password_screen.dart';
import 'package:finance_app_ui/core/features/auth/forget_password_screen.dart';
import 'package:finance_app_ui/core/features/auth/login_screen.dart';
import 'package:finance_app_ui/core/features/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/password_changed_screen.dart';
import '../features/auth/register_screen.dart';
import '../features/auth/verify_otp/otp_verification_screen.dart';
import 'app_routes.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onboardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onboardingScreen,
        name: AppRoutes.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordScreen,
        name: AppRoutes.forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.resetPasswordScreen,
        name: AppRoutes.resetPasswordScreen,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.passwordChangedScreen,
        name: AppRoutes.passwordChangedScreen,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpVerificationScreen,
        name: AppRoutes.otpVerificationScreen,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
    ],
  );
}
