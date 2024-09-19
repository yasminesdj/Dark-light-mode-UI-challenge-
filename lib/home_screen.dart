import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
              size: 100,
              color: isDarkMode ? Colors.yellow : Colors.orange,
            ),
            SizedBox(height: 20),
            Text(
              isDarkMode ? 'Dark Mode' : 'Light Mode',
              style: TextStyle(fontSize: 24),
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
