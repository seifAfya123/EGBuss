import 'package:flutter/material.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/screens/shared/about_us.dart';
import 'package:testapp/presentation/screens/shared/available_trips_screen.dart';
import 'package:testapp/presentation/screens/shared/contact_us.dart';
import 'package:testapp/presentation/screens/shared/edit_profile_screen.dart';
import 'package:testapp/presentation/screens/shared/home_screen.dart';
import 'package:testapp/presentation/screens/shared/login_screen.dart';

import 'package:testapp/presentation/screens/shared/notification_details_screen.dart';
import 'package:testapp/presentation/screens/shared/notifications.dart';
import 'package:testapp/presentation/screens/shared/old_tickets_screen.dart';
import 'package:testapp/presentation/screens/shared/privacy_and_policy.dart';

import 'package:testapp/presentation/screens/shared/profile_screen.dart';
import 'package:testapp/presentation/screens/shared/register_screen.dart';
import 'package:testapp/presentation/screens/shared/seat_reservation_screen.dart';
import 'package:testapp/presentation/screens/shared/select_trip_screen.dart';
import 'package:testapp/presentation/screens/shared/splash_screen.dart';
import 'package:testapp/presentation/screens/shared/tickets_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutNamesDart.rSplashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutNamesDart.rLoginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // case RoutNamesDart.rHomeScreen:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutNamesDart.rRegisterScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RoutNamesDart.rProfileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RoutNamesDart.rEditProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case RoutNamesDart.rSeatReservation:
        return MaterialPageRoute(builder: (_) => SeatReservation());
      case RoutNamesDart.rAvailableTripsScreen:
        return MaterialPageRoute(builder: (_) => AvailableTripsScreen());

      case RoutNamesDart.rHomeScreen:
        return MaterialPageRoute(builder: (_) => SelectTripScreen());
      case RoutNamesDart.rprivacyPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyAndPolicy());
      case RoutNamesDart.rAboutUsScreen:
        return MaterialPageRoute(builder: (_) => AboutUs());
      case RoutNamesDart.rContactUsScreen:
        return MaterialPageRoute(builder: (_) => ContactUs());
      case RoutNamesDart.rNotificationsScreen:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());
      case RoutNamesDart.rNotificationDetailsScreen:
        return MaterialPageRoute(builder: (_) => NotificationDetailsScreen());
      case RoutNamesDart.rOldTicketsScreen:
        return MaterialPageRoute(builder: (_) => OldTicketsScreen());
      case RoutNamesDart.rMyTicketsScreen:
        return MaterialPageRoute(builder: (_) => TicketsScreen());
      // case RoutNamesDart.rAddItemSceen:
      //   String arguments = settings.arguments as String;
      //   return MaterialPageRoute(
      //       builder: (_) => SellItemScreen(code: arguments));
      default:
        return null;
    }
  }
}
