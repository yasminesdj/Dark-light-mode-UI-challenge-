import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor:
          isDarkMode ? Color.fromARGB(255, 21, 21, 21) : Colors.white,
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
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 60),
            Container(
              width: 100, // Custom length of the switch
              child: Transform.scale(
                scale: 2.2, // Increase the size of the switch
                child: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                  activeColor: Colors.white, // Thumb color in dark mode
                  activeTrackColor: Colors.blue, // Track color in dark mode
                  inactiveThumbColor: Colors.white, // Thumb color in light mode
                  inactiveTrackColor:
                      Colors.grey.shade400, // Track color in light mode
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
