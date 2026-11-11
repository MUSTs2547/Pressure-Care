import 'package:flutter/material.dart';

// ============================================================
// Page 4 — การบันทึกผล (Placeholder — ข้อมูลยังไม่มี)
// ============================================================

class Page4Record extends StatelessWidget {
  const Page4Record({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การบันทึกผล'),
        backgroundColor: const Color(0xFFF3E5F5),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.assignment_turned_in_rounded,
                size: 80,
                color: Colors.purple.shade200,
              ),
              const SizedBox(height: 24),
              const Text(
                'การบันทึกผล',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7B1FA2),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'บันทึกอาการและติดตามผลการดูแลผู้ป่วย',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF5FC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFCE93D8)),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.construction_rounded,
                      size: 40,
                      color: Color(0xFF8E24AA),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'กำลังจัดทำเนื้อหา',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7B1FA2),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ระบบบันทึกและติดตามผลการดูแลกำลังอยู่ระหว่างการพัฒนา\n'
                      'กรุณากลับมาตรวจสอบในภายหลัง',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
