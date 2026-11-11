import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player_win/video_player_win.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    WindowsVideoPlayer.registerWith();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pressure Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4FC3F7),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pressure Care',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              'เลือกหมวดที่ต้องการ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _MenuCard(
                    icon: Icons.menu_book_rounded,
                    title: '1. ความรู้เรื่องแผลกดทับ',
                    subtitle: 'สาเหตุ ปัจจัยเสี่ยง และการป้องกัน',
                    color: const Color(0xFFE3F2FD),
                    iconColor: const Color(0xFF1565C0),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Page1Knowledge()),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.ondemand_video_rounded,
                    title: '2. วิดีโอสาธิต',
                    subtitle: 'การจัดท่าและการดูแลแผล',
                    color: const Color(0xFFE8F5E9),
                    iconColor: const Color(0xFF2E7D32),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Page2Video()),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.restaurant_rounded,
                    title: '3. โภชนาการ',
                    subtitle: 'อาหารและสารอาหารที่เหมาะสม',
                    color: const Color(0xFFFFF3E0),
                    iconColor: const Color(0xFFE65100),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Page3Nutrition()),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.assignment_turned_in_rounded,
                    title: '4. การบันทึกผล',
                    subtitle: 'บันทึกอาการและติดตามผลการดูแล',
                    color: const Color(0xFFF3E5F5),
                    iconColor: const Color(0xFF7B1FA2),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Page4Record()),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(icon, size: 44, color: iconColor),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: iconColor.withValues(alpha: 0.75),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: iconColor, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
