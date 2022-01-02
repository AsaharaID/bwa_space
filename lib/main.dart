// ignore_for_file: prefer_const_constructors
import 'package:bwa_space/pages/category_page.dart';
import 'package:bwa_space/pages/detail_page.dart';
import 'package:bwa_space/pages/home_page.dart';
import 'package:bwa_space/pages/onboarding_page.dart';
import 'package:bwa_space/pages/profile_page.dart';
import 'package:bwa_space/pages/search_page.dart';
import 'package:bwa_space/pages/search_result_page.dart';
import 'package:bwa_space/pages/sign_in_page.dart';
import 'package:bwa_space/pages/splash_page.dart';
import 'package:bwa_space/pages/wishlist_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/sign_in': (context) => SignInPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/search-result': (context) => SearchResultPage(),
        '/category' : (context) => CategoryPage(),
        '/wishlist' : (context) => WishlistPage(),
        '/profile' : (context) => ProfilePage(),
        '/detail' : (context) => DetailPage(),
      },
    );
  }
}
