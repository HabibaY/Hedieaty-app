import 'package:flutter/material.dart';
import 'views/create_edit_event_screen.dart';
import 'views/create_edit_gift_screen.dart';
import 'views/event_list_screen.dart';
import 'views/friend_gift_list_screen.dart';
import 'views/gift_list_screen.dart';
import 'views/home_screen.dart';
import 'views/sign_in_screen.dart'; // Updated import for sign-in
import 'views/profile_page_screen.dart';
import 'views/pledged_gifts_screen.dart';
import 'views/sign_up_screen.dart'; // Updated import for sign-up

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor:
            Colors.purple[50], // Set light purple background color
      ),
      home: const WelcomeScreen(), // Set WelcomeScreen as the entry point
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => SignInScreen(), // Changed to SignInScreen
        '/register': (context) => SignUpScreen(), // Changed to SignUpScreen
        '/profile': (context) => ProfilePageScreen(),
        '/createEvent': (context) => CreateEditEventScreen(),
        '/editEvent': (context) => CreateEditEventScreen(),
        '/eventList': (context) => EventListScreen(),
        '/giftList': (context) => GiftListScreen(),
        '/friendGiftList': (context) => FriendGiftListScreen(),
        '/pledgedGifts': (context) => PledgedGiftsScreen(),
        '/createGift': (context) => CreateEditGiftScreen(),
        '/editGift': (context) => CreateEditGiftScreen()
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full Background Image
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/app2.jpg'), // Full background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Translucent Overlay to improve text visibility
          Container(
            height: MediaQuery.of(context).size.height,
            color:
                Colors.black.withOpacity(0.3), // Dark overlay with 30% opacity
          ),
          // Welcome Header Text at the top
          Positioned(
            top: 80, // Move the text closer to the top
            left: 24,
            right: 24,
            child: const Text(
              'Welcome to Hedeiaty app!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Centered Text and Button moved to the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Introductory Text
                const Text(
                  'All the fun starts here! Want to feel the happy vibe? Create an account and you are all set to go!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Use white for better contrast
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Get Started Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/home'); // Navigate to SignUpScreen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.purpleAccent, // Updated button color to purple
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // Already have an account link
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Already have an account? Sign In here!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16), // Use white for better readability
                  ),
                ),
                const SizedBox(height: 40), // Add padding at the bottom
              ],
            ),
          ),
        ],
      ),
    );
  }
}
