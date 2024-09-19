import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isDarkMode ? 'assets/images/moon.png' : 'assets/images/sun.png',
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              isDarkMode ? 'Dark Mode' : 'Light Mode',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Gilroy', // Set Gilroy font
                fontWeight: FontWeight.w600, // Semi Bold (weight 600)
              ),
            ),
            SizedBox(height: 20),
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
