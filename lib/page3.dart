import 'package:flutter/material.dart';

// ============================================================
// Asset Arrays — รูปภาพโภชนาการทั้งหมดเก็บแบบ Array
// ============================================================

/// รายการอาหารโปรตีนจากสัตว์ (Animal Protein)
const List<Map<String, String>> kAnimalProteinFoods = [
  {
    'name': 'เนื้อปลา',
    'asset': 'Asset/JPG/nutrition/fish.jpg',
    'desc':
        'เช่น ปลาทู ปลานิล ปลากะพง และปลาทะเล เป็นแหล่งโปรตีนที่ย่อยง่าย โดยปลาบางชนิดยังมีกรดไขมันโอเมกา 3 ซึ่งมีประโยชน์ต่อสุขภาพหัวใจและหลอดเลือด',
  },
  {
    'name': 'เนื้อไก่',
    'asset': 'Asset/JPG/nutrition/chicken.jpg',
    'desc':
        'เป็นแหล่งโปรตีนที่มีไขมันค่อนข้างต่ำเมื่อเลือกบริโภคส่วนอกไก่และไม่รับประทานหนัง เหมาะสำหรับการเสริมสร้างและรักษามวลกล้ามเนื้อ',
  },
  {
    'name': 'เนื้อหมู',
    'asset': 'Asset/JPG/nutrition/pork.jpg',
    'desc':
        'เป็นแหล่งโปรตีนที่มีกรดอะมิโนจำเป็น รวมถึงวิตามินบี 1 และแร่ธาตุที่มีประโยชน์ต่อการทำงานของร่างกาย โดยควรเลือกเนื้อหมูส่วนที่ไม่ติดมัน',
  },
  {
    'name': 'ไข่ไก่',
    'asset': 'Asset/JPG/nutrition/egg.jpg',
    'desc':
        'เป็นแหล่งโปรตีนที่มีคุณภาพดี ประกอบด้วยกรดอะมิโนจำเป็นหลายชนิด รวมถึงวิตามินและแร่ธาตุที่มีความสำคัญต่อร่างกาย',
  },
  {
    'name': 'นมและผลิตภัณฑ์จากนม',
    'asset': 'Asset/JPG/nutrition/milk.png',
    'desc':
        'เช่น นมสด โยเกิร์ต และชีส เป็นแหล่งโปรตีนที่มีคุณภาพดี อีกทั้งยังมีแคลเซียมที่ช่วยเสริมสร้างกระดูกและฟัน',
  },
  {
    'name': 'อาหารทะเล',
    'asset': 'Asset/JPG/nutrition/seafood.jpg',
    'desc':
        'เช่น กุ้ง ปลาหมึก และหอย เป็นแหล่งโปรตีนที่มีคุณภาพดี และมีแร่ธาตุบางชนิด เช่น สังกะสีและไอโอดีน',
  },
];

/// รายการอาหารโปรตีนจากพืช (Plant Protein)
const List<Map<String, String>> kPlantProteinFoods = [
  {
    'name': 'ถั่วเหลือง',
    'asset': 'Asset/JPG/nutrition/soybean.jpg',
    'desc':
        'เป็นแหล่งโปรตีนจากพืชที่มีกรดอะมิโนจำเป็นค่อนข้างครบถ้วน สามารถนำมาแปรรูปเป็นเต้าหู้ นมถั่วเหลือง และผลิตภัณฑ์อาหารอื่นๆ',
  },
  {
    'name': 'ถั่วเขียว',
    'asset': 'Asset/JPG/nutrition/mung_bean.jpg',
    'desc':
        'เป็นแหล่งโปรตีนจากพืชที่สามารถนำมาประกอบอาหารได้หลากหลาย เช่น ถั่วเขียวต้มน้ำตาลและขนมจากถั่วเขียว',
  },
  {
    'name': 'ถั่วแดงและถั่วดำ',
    'asset': 'Asset/JPG/nutrition/red_black_beans.png',
    'desc':
        'เป็นแหล่งโปรตีนที่มีใยอาหารและแร่ธาตุ ช่วยเพิ่มความหลากหลายของสารอาหารในมื้ออาหาร',
  },
  {
    'name': 'เต้าหู้',
    'asset': 'Asset/JPG/nutrition/tofu.jpg',
    'desc':
        'เป็นผลิตภัณฑ์ที่ทำจากถั่วเหลือง มีโปรตีนและสามารถนำมาประกอบอาหารได้หลายประเภท เช่น แกงจืดเต้าหู้ ผัดเต้าหู้ และเต้าหู้ทรงเครื่อง',
  },
  {
    'name': 'ถั่วลิสงและถั่วต่างๆ',
    'asset': 'Asset/JPG/nutrition/peanuts.png',
    'desc':
        'ให้โปรตีนและไขมันไม่อิ่มตัว รวมถึงแร่ธาตุบางชนิด แต่ควรบริโภคในปริมาณที่เหมาะสมเนื่องจากมีพลังงานค่อนข้างสูง',
  },
];

// ============================================================
// Page 3 — โภชนาการ (Nutrition)
// ============================================================

class Page3Nutrition extends StatelessWidget {
  const Page3Nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โภชนาการสำหรับผู้ป่วย'),
        backgroundColor: const Color(0xFFFFF3E0),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ==================== ความสำคัญของโปรตีน ====================
          _buildSectionHeader('ความสำคัญของโปรตีนต่อการซ่อมแซมเนื้อเยื่อ'),
          _buildParagraph(
            'โปรตีน (Protein) เป็นสารอาหารหลักที่มีความสำคัญต่อการเจริญเติบโต การดำรงชีวิต และการทำงานของร่างกาย '
            'เนื่องจากโปรตีนประกอบด้วยกรดอะมิโน ซึ่งเป็นองค์ประกอบพื้นฐานในการสร้างและซ่อมแซมเซลล์ เนื้อเยื่อ และอวัยวะต่าง ๆ ของร่างกาย '
            'โดยเฉพาะในช่วงที่ร่างกายเกิดการบาดเจ็บ เจ็บป่วย หรือมีบาดแผล ร่างกายจะต้องใช้โปรตีนเพิ่มขึ้นเพื่อสนับสนุนกระบวนการฟื้นฟูและซ่อมแซมเนื้อเยื่อที่ได้รับความเสียหาย',
          ),
          const SizedBox(height: 12),

          _buildSubSection('1. การสร้างเซลล์และเนื้อเยื่อใหม่'),
          _buildParagraph(
            'โปรตีนมีบทบาทสำคัญในการสร้างเซลล์ใหม่เพื่อทดแทนเซลล์ที่เสื่อมสภาพหรือได้รับความเสียหาย โดยกรดอะมิโนที่ได้จากการย่อยโปรตีนจะถูกนำไปใช้เป็นวัตถุดิบในการสังเคราะห์โปรตีนชนิดต่าง ๆ ภายในร่างกาย ซึ่งจำเป็นต่อการสร้างและฟื้นฟูเนื้อเยื่อ รวมถึงการรักษาความสมบูรณ์ของโครงสร้างร่างกาย',
          ),

          _buildSubSection('2. การสร้างคอลลาเจนและสมานแผล'),
          _buildParagraph(
            'โปรตีนมีความสำคัญต่อกระบวนการสมานแผล เนื่องจากเป็นแหล่งกรดอะมิโนที่จำเป็นต่อการสร้างคอลลาเจน ซึ่งเป็นโปรตีนโครงสร้างสำคัญของผิวหนังและเนื้อเยื่อเกี่ยวพัน ช่วยเพิ่มความแข็งแรงและความยืดหยุ่นของเนื้อเยื่อ ตลอดจนสนับสนุนการสร้างเนื้อเยื่อใหม่บริเวณบาดแผล หากร่างกายได้รับโปรตีนไม่เพียงพอ อาจส่งผลให้กระบวนการซ่อมแซมบาดแผลเกิดขึ้นได้ไม่เต็มประสิทธิภาพและทำให้แผลหายช้าลง',
          ),

          _buildSubSection('3. การซ่อมแซมและเสริมสร้างกล้ามเนื้อ'),
          _buildParagraph(
            'โปรตีนมีส่วนสำคัญในการสร้างและซ่อมแซมเส้นใยกล้ามเนื้อที่ได้รับความเสียหายจากการทำกิจกรรมหรือการใช้แรงงาน ช่วยรักษามวลกล้ามเนื้อและความแข็งแรงของร่างกาย โดยเฉพาะผู้สูงอายุหรือผู้ที่มีภาวะเจ็บป่วย ซึ่งมีความเสี่ยงต่อการสูญเสียมวลกล้ามเนื้อ การได้รับโปรตีนอย่างเพียงพอจึงช่วยสนับสนุนการฟื้นฟูสมรรถภาพทางร่างกายและลดความเสี่ยงต่อภาวะกล้ามเนื้อน้อย',
          ),

          _buildSubSection('4. การเสริมสร้างระบบภูมิคุ้มกัน'),
          _buildParagraph(
            'โปรตีนเป็นองค์ประกอบสำคัญในการสร้างสารภูมิคุ้มกันหรือแอนติบอดี (Antibodies) รวมถึงโปรตีนที่เกี่ยวข้องกับการทำงานของระบบภูมิคุ้มกัน ช่วยให้ร่างกายสามารถตอบสนองต่อเชื้อโรคและสิ่งแปลกปลอมได้อย่างเหมาะสม โดยเฉพาะในช่วงที่มีบาดแผล ร่างกายจำเป็นต้องอาศัยระบบภูมิคุ้มกันในการป้องกันการติดเชื้อและสนับสนุนกระบวนการฟื้นฟูเนื้อเยื่อ',
          ),
          const SizedBox(height: 16),

          // ==================== ผลกระทบจากการได้รับโปรตีนไม่เพียงพอ ====================
          _buildWarningBox(
            'ผลกระทบจากการได้รับโปรตีนไม่เพียงพอ',
            'การได้รับโปรตีนไม่เพียงพอต่อความต้องการของร่างกายอาจส่งผลให้การสร้างเซลล์และเนื้อเยื่อใหม่ลดลง '
            'กล้ามเนื้ออ่อนแรงและสูญเสียมวลกล้ามเนื้อ ระบบภูมิคุ้มกันทำงานลดลง รวมถึงอาจทำให้กระบวนการสมานแผลล่าช้า '
            'หากเกิดภาวะขาดสารอาหารอย่างต่อเนื่องอาจเพิ่มความเสี่ยงต่อการเกิดแผลเรื้อรังและภาวะแทรกซ้อนจากการติดเชื้อได้',
          ),
          const SizedBox(height: 20),

          // ==================== แหล่งอาหารโปรตีนที่เหมาะสม ====================
          _buildSectionHeader('แหล่งอาหารโปรตีนที่เหมาะสม'),
          _buildParagraph(
            'แหล่งอาหารที่ให้โปรตีนสามารถแบ่งออกเป็น 2 กลุ่ม ได้แก่:\n'
            '• โปรตีนจากสัตว์ เช่น ปลา เนื้อหมู เนื้อไก่ ไข่ นม และอาหารทะเล เป็นแหล่งโปรตีนที่มีกรดอะมิโนจำเป็นครบถ้วน\n'
            '• โปรตีนจากพืช เช่น ถั่วเหลือง ถั่วเขียว ถั่วแดง เต้าหู้ และผลิตภัณฑ์จากถั่วต่าง ๆ ซึ่งเป็นแหล่งโปรตีนที่สามารถนำมาประกอบอาหารในชีวิตประจำวันได้',
          ),
          const SizedBox(height: 20),

          // ==================== ตัวอย่างอาหารที่มีโปรตีนสูง ====================
          _buildSectionHeader('ตัวอย่างอาหารที่มีโปรตีนสูง'),
          _buildParagraph(
            'โปรตีนเป็นสารอาหารหลักที่ร่างกายจำเป็นต้องได้รับจากการบริโภคอาหาร เนื่องจากร่างกายไม่สามารถสร้างกรดอะมิโนจำเป็นได้ครบถ้วนด้วยตนเอง '
            'จึงต้องได้รับจากอาหารที่บริโภคในชีวิตประจำวัน',
          ),
          const SizedBox(height: 12),

          // ---- หมวด 1: โปรตีนจากสัตว์ ----
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE0B2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.pets, color: Color(0xFFE65100)),
                SizedBox(width: 8),
                Text(
                  'โปรตีนจากสัตว์ (Animal Protein)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE65100),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildParagraph(
            'โปรตีนจากสัตว์เป็นแหล่งอาหารที่มีกรดอะมิโนจำเป็นครบถ้วนและมีคุณภาพโปรตีนสูง สามารถนำไปใช้ประโยชน์ในการสร้างและซ่อมแซมเนื้อเยื่อของร่างกายได้อย่างมีประสิทธิภาพ',
          ),
          const SizedBox(height: 12),
          // Loop แสดงรายการโปรตีนจากสัตว์ จาก Array
          ...kAnimalProteinFoods.map((item) => _buildFoodCard(item)),
          const SizedBox(height: 24),

          // ---- หมวด 2: โปรตีนจากพืช ----
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFC8E6C9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.eco, color: Color(0xFF2E7D32)),
                SizedBox(width: 8),
                Text(
                  'โปรตีนจากพืช (Plant Protein)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildParagraph(
            'โปรตีนจากพืชเป็นแหล่งอาหารที่ได้รับจากพืชตระกูลถั่วและผลิตภัณฑ์จากพืชต่าง ๆ มีความสำคัญต่อการบริโภคอาหารเพื่อสุขภาพ เนื่องจากนอกจากจะให้โปรตีนแล้ว ยังมีใยอาหาร วิตามิน แร่ธาตุเป็นประโยชน์ต่อร่างกาย',
          ),
          const SizedBox(height: 12),
          // Loop แสดงรายการโปรตีนจากพืช จาก Array
          ...kPlantProteinFoods.map((item) => _buildFoodCard(item)),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ============ UI Helper Widgets ============

  static Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFFE65100),
        ),
      ),
    );
  }

  static Widget _buildSubSection(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF57C00),
        ),
      ),
    );
  }

  static Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, height: 1.6),
      ),
    );
  }

  static Widget _buildWarningBox(String title, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE57373)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: Color(0xFFC62828), size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFFC62828),
                  ),
                ),
                const SizedBox(height: 4),
                Text(text, style: const TextStyle(fontSize: 14, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildFoodCard(Map<String, String> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item['asset']!,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 180,
              color: Colors.grey.shade200,
              child: const Center(
                child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name']!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37474F),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['desc']!,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
