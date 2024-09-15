import 'package:flutter/material.dart';

import '../widgets/pressable_button.dart';

class ChooseMode extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;

  const ChooseMode({super.key, required this.onThemeChanged});

  @override
  _ChooseModeState createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {
  String _selectedTheme = 'Light'; // Default pilihan tema

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF01AED6),
              Color(0xFF0087A7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icons/lightstick.png',
              height: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'Kamu tim mana?',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sisi gelap atau terang, ayo pilih di sini!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 15),
            PressableButton(
              label: 'Mau pilih!',
              gradient: const LinearGradient(
                colors: [Color(0xFF5DB466), Color(0xFF088C15)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              width: 160,
              height: 40,
              onPressed: () {
                _showBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFF5F5F5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Garis di atas (drag handle)
                  Center(
                    child: Container(
                      width: 25,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ganti tampilan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pilih yang nyaman di mata ajaa.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Option 1: Dark mode
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                            leading: Image.asset(
                              'assets/images/icons/moon.png',
                              height: 24,
                            ),
                            title: const Text('Dark'),
                            trailing: Radio<String>(
                              value: 'Dark',
                              groupValue: _selectedTheme,
                              activeColor: const Color(0xFF5DB466),
                              onChanged: (String? value) {
                                setModalState(() {
                                  _selectedTheme = value!;
                                });
                                setState(() {
                                  _selectedTheme = value!;
                                  widget.onThemeChanged(ThemeMode.dark); // Update theme
                                });
                              },
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 0.5,
                          color: Colors.grey[300],
                        ),
                        // Option 2: Light mode
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                            leading: Image.asset(
                              'assets/images/icons/sun.png',
                              height: 24,
                            ),
                            title: const Text('Light'),
                            trailing: Radio<String>(
                              value: 'Light',
                              groupValue: _selectedTheme,
                              activeColor: const Color(0xFF5DB466),
                              onChanged: (String? value) {
                                setModalState(() {
                                  _selectedTheme = value!;
                                });
                                setState(() {
                                  _selectedTheme = value!;
                                  widget.onThemeChanged(ThemeMode.light); // Update theme
                                });
                              },
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 0.5,
                          color: Colors.grey[300],
                        ),
                        // Option 3: System mode
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                            leading: Image.asset(
                              'assets/images/icons/vector.png',
                              height: 24,
                            ),
                            title: const Text('Sesuai pengaturan perangkat'),
                            subtitle: const Text(
                              'Tampilan bakal berubah sesuai pengaturan perangkat kamu.',
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                            trailing: Radio<String>(
                              value: 'System',
                              groupValue: _selectedTheme,
                              activeColor: const Color(0xFF5DB466),
                              onChanged: (String? value) {
                                setModalState(() {
                                  _selectedTheme = value!;
                                });
                                setState(() {
                                  _selectedTheme = value!;
                                  widget.onThemeChanged(ThemeMode.system); // Update theme
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}