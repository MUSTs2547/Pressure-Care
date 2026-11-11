import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

// ============================================================
// Asset Arrays — รูปและ VDO ทั้งหมดเก็บแบบ Array
// ============================================================

/// ข้อมูลตำแหน่งท่าทางผู้ป่วยและรูปภาพ
const List<Map<String, String>> kPositionItems = [
  {
    'title': '1. ท่านอนหงาย',
    'desc':
        'มักเกิดบริเวณส้นเท้า ก้นกบ กระดูกสันหลัง ข้อศอก สะบัก และท้ายทอย',
    'asset': 'Asset/JPG/knowledge/position_supine.png',
  },
  {
    'title': '2. ท่านอนตะแคง',
    'desc':
        'มักเกิดบริเวณนิ้วเท้า ตาตุ่มด้านในและด้านนอก สะโพกด้านข้าง ซี่โครง ไหล่ และใบหู',
    'asset': 'Asset/JPG/knowledge/position_side.png',
  },
  {
    'title': '3. ท่านอนคว่ำ',
    'desc':
        'มักเกิดบริเวณนิ้วเท้า หัวเข่า อวัยวะเพศชาย เต้านม และแก้มหรือใบหู',
    'asset': 'Asset/JPG/knowledge/position_prone.png',
  },
  {
    'title': '4. ท่านั่งบนรถเข็น',
    'desc':
        'มักเกิดบริเวณหัวไหล่ ข้อศอก หลังส่วนล่าง กระดูกก้นหรือสะโพก และส้นเท้า เนื่องจากเป็นจุดที่รับแรงกดจากพนักพิง เบาะนั่ง และที่วางเท้า',
    'asset': 'Asset/JPG/knowledge/position_wheelchair.png',
  },
];

/// ข้อมูลระดับความรุนแรงของแผลกดทับ พร้อมรูปภาพแต่ละระดับ
const List<Map<String, String>> kSeverityItems = [
  {
    'title': 'แผลกดทับระดับ 1',
    'desc':
        'ผิวหนังยังไม่ฉีกขาด แต่มีรอยแดงเฉพาะบริเวณ ซึ่งไม่จางลงเมื่อใช้นิ้วกด ในผู้ที่มีผิวคล้ำอาจสังเกตได้จากสีผิว อุณหภูมิ หรือความแข็งของผิวหนังที่เปลี่ยนแปลง รวมถึงการรับความรู้สึกที่ผิดปกติ',
    'asset': 'Asset/JPG/knowledge/stage_1.png',
  },
  {
    'title': 'แผลกดทับระดับ 2',
    'desc':
        'ผิวหนังถลอกหรือหลุดลอกบางส่วนจนเห็นชั้นหนังแท้ แผลมีสีชมพูหรือแดงและชุ่มชื้น อาจพบตุ่มน้ำใสหรือตุ่มน้ำแตก โดยไม่มีเนื้อตาย',
    'asset': 'Asset/JPG/knowledge/stage_2.png',
  },
  {
    'title': 'แผลกดทับระดับ 3',
    'desc':
        'ผิวหนังถูกทำลายจนเห็นชั้นไขมันใต้ผิวหนัง แผลมีความลึก อาจพบเนื้อเยื่อสีแดง เนื้อตาย หรือมีโพรงใต้ขอบแผลร่วมด้วย',
    'asset': 'Asset/JPG/knowledge/stage_3.png',
  },
  {
    'title': 'แผลกดทับระดับ 4',
    'desc':
        'ผิวหนังและเนื้อเยื่อถูกทำลายลึกจนเห็นกล้ามเนื้อ เส้นเอ็น หรือกระดูก อาจมีเนื้อตายและโพรงแผลร่วมด้วย เป็นแผลกดทับที่มีความรุนแรงมากที่สุด',
    'asset': 'Asset/JPG/knowledge/stage_4.png',
  },
];

/// ข้อมูลแผลกดทับประเภทพิเศษ พร้อมรูปภาพแต่ละประเภท
const List<Map<String, String>> kSpecialItems = [
  {
    'title': 'แผลกดทับที่ไม่สามารถระบุระดับได้',
    'desc':
        'แผลมีเนื้อเยื่อตายสีเหลืองหรือสีดำปกคลุม ทำให้ไม่สามารถประเมินความลึกของแผลได้ หากพบเนื้อตายแห้งแข็งบริเวณส้นเท้า ห้ามทำให้อ่อนตัวหรือตัดออก',
    'asset': 'Asset/JPG/knowledge/stage_unstageable.png',
  },
  {
    'title': 'แผลกดทับที่มีการบาดเจ็บเนื้อเยื่อชั้นลึก',
    'desc':
        'ผิวหนังอาจยังไม่ฉีกขาดหรือเกิดแผลแล้ว พบผิวหนังเปลี่ยนเป็นสีแดงคล้ำ สีม่วง หรือมีตุ่มน้ำที่มีเลือดอยู่ภายใน โดยรอยแดงไม่จางลงเมื่อใช้นิ้วกด',
    'asset': 'Asset/JPG/knowledge/stage_deep_tissue.png',
  },
  {
    'title': 'แผลกดทับที่เกิดจากอุปกรณ์ทางการแพทย์',
    'desc':
        'แผลกดทับอาจมีรูปร่างคล้ายอุปกรณ์ที่กดทับผิวหนัง โดยแผลบริเวณเยื่อบุ (Mucosal membrane) ไม่สามารถระบุระดับได้ ให้เรียกว่าแผลกดทับบริเวณเยื่อบุ',
    'asset': 'Asset/JPG/knowledge/stage_medical_device.png',
  },
];

/// รูปสัญญาณผิดปกติ
const List<Map<String, String>> kWarningImages = [
  {
    'asset': 'Asset/JPG/knowledge/warning_signs.png',
    'label': 'สัญญาณผิดปกติที่ควรเฝ้าระวัง การดูแลและสังเกตแผลกดทับในผู้ป่วย',
  },
];

/// วิดีโอในหมวดความรู้เรื่องแผลกดทับ (หัวข้อ 6 วิธีป้องกัน)
const List<Map<String, String>> kPreventionVideos = [
  {
    'asset': 'Asset/VDO/knowledge/position_change_prevention.webm',
    'label': '1. การเปลี่ยนท่าทางผู้ป่วย (วิธีป้องกันแผลกดทับ)',
  },
  {
    'asset': 'Asset/VDO/knowledge/mobility_promotion.mkv',
    'label': '2. การส่งเสริมการเคลื่อนไหว',
  },
];

// ============================================================
// Page 1 — ความรู้เรื่องแผลกดทับ
// ============================================================

class Page1Knowledge extends StatelessWidget {
  const Page1Knowledge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ความรู้เรื่องแผลกดทับ'),
        backgroundColor: const Color(0xFFE3F2FD),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ==================== หัวข้อ 1 ====================
          _buildSectionHeader('1. ความหมายของแผลกดทับ'),
          _buildParagraph(
            'แผลกดทับ คือ การบาดเจ็บของผิวหนังและเนื้อเยื่อใต้ผิวหนัง '
            'มักเกิดบริเวณปุ่มกระดูกหรือบริเวณที่สัมผัสกับอุปกรณ์ทางการแพทย์ '
            'มีลักษณะตั้งแต่ผิวหนังแดงโดยไม่ฉีกขาดจนถึงเกิดเป็นแผล '
            'อาจมีอาการเจ็บปวดร่วมด้วย สาเหตุหลักเกิดจากแรงกดหรือแรงกดร่วมกับแรงไถลเป็นเวลานาน '
            'โดยความรุนแรงขึ้นอยู่กับความชื้นของผิวหนัง ภาวะโภชนาการ '
            'การไหลเวียนเลือด และโรคประจำตัวของผู้ป่วย',
          ),
          const SizedBox(height: 24),

          // ==================== หัวข้อ 2 ====================
          _buildSectionHeader('2. สาเหตุของแผลกดทับ'),
          _buildParagraph(
            'แผลกดทับเกิดจากการที่ผิวหนังและเนื้อเยื่อใต้ผิวหนังได้รับแรงกดทับเป็นเวลานาน '
            'ทำให้เลือดไหลเวียนไปเลี้ยงบริเวณนั้นลดลง ส่งผลให้เนื้อเยื่อขาดออกซิเจนและเกิดการบาดเจ็บ '
            'โดยมีสาเหตุสำคัญดังนี้',
          ),
          _buildBullet('1. แรงกด (Pressure)',
              'เกิดจากการนอนหรือนั่งอยู่ในท่าเดิมเป็นเวลานาน ทำให้น้ำหนักตัวกดทับบริเวณปุ่มกระดูก '
                  'เช่น ก้นกบ สะโพก และส้นเท้า ส่งผลให้เลือดไหลเวียนไปเลี้ยงผิวหนังและเนื้อเยื่อบริเวณนั้นลดลง'),
          _buildBullet('2. แรงไถล (Shear)',
              'เกิดเมื่อร่างกายเลื่อนตัวไปในทิศทางหนึ่ง แต่ผิวหนังยังติดอยู่กับที่นอน '
                  'เช่น ผู้ป่วยเลื่อนตัวลงจากหัวเตียง ทำให้เนื้อเยื่อภายในถูกดึงรั้งและเกิดการบาดเจ็บ'),
          _buildBullet('3. แรงเสียดสี (Friction)',
              'เกิดจากการที่ผิวหนังเสียดสีกับพื้นผิว เช่น การลากตัวผู้ป่วยไปบนที่นอน '
                  'หรือการเคลื่อนย้ายโดยไม่ยกตัว ทำให้ผิวหนังถลอกและเกิดบาดแผลได้'),
          _buildBullet('4. ความเปียกชื้น (Moisture)',
              'เกิดจากเหงื่อ ปัสสาวะ อุจจาระ หรือความชื้นที่สะสมบนผิวหนังเป็นเวลานาน '
                  'ทำให้ผิวหนังอ่อนแอ เปื่อยยุ่ย และเสี่ยงต่อการถูกทำลายมากขึ้น'),
          const SizedBox(height: 24),

          // ==================== หัวข้อ 3 ====================
          _buildSectionHeader('3. ตำแหน่งที่มักเกิดแผลกดทับ'),
          _buildParagraph(
            'แผลกดทับมักเกิดบริเวณปุ่มกระดูกหรือส่วนของร่างกายที่สัมผัสกับที่นอนและอุปกรณ์ต่าง ๆ '
            'เป็นเวลานาน โดยตำแหน่งที่เกิดแผลจะแตกต่างกันตามท่าทางของผู้ป่วย ดังนี้',
          ),
          const SizedBox(height: 12),

          // แสดงแต่ละท่า พร้อมรูปภาพใต้ข้อความโดยตรง
          ...kPositionItems.map((pos) => _buildTopicWithImage(
                title: pos['title']!,
                desc: pos['desc']!,
                assetPath: pos['asset']!,
              )),

          _buildWarningBox(
            'ข้อควรระวัง',
            'ผู้ดูแลควรตรวจสอบผิวหนังบริเวณปุ่มกระดูกและจุดสัมผัสกับอุปกรณ์ต่าง ๆ อย่างสม่ำเสมอ '
                'โดยเฉพาะบริเวณก้นกบ สะโพก และส้นเท้า ซึ่งเป็นจุดที่ต้องเฝ้าระวังเป็นพิเศษ',
          ),
          const SizedBox(height: 24),

          // ==================== หัวข้อ 4 ====================
          _buildSectionHeader('4. ปัจจัยเสี่ยงในผู้ป่วยติดเตียง'),
          _buildParagraph(
            'ผู้ป่วยติดเตียงมีความเสี่ยงต่อการเกิดแผลกดทับจากหลายปัจจัย ได้แก่',
          ),
          _buildBulletSimple('การเคลื่อนไหวลดลง: ไม่สามารถพลิกตัวหรือเปลี่ยนท่าได้เอง ทำให้ผิวหนังถูกกดทับเป็นเวลานาน'),
          _buildBulletSimple('แรงกดและแรงเสียดสี: เกิดจากการนอนท่าเดิม การลากตัว หรือการเคลื่อนย้ายผู้ป่วย'),
          _buildBulletSimple('แรงไถล: เกิดจากการเลื่อนตัวลงจากหัวเตียง ทำให้ผิวหนังและเนื้อเยื่อถูกทำลาย'),
          _buildBulletSimple('ความเปียกชื้น: จากเหงื่อ ปัสสาวะ หรืออุจจาระ ทำให้ผิวหนังเปื่อยและระคายเคือง'),
          _buildBulletSimple('ภาวะโภชนาการไม่เพียงพอ: ขาดสารอาหารและโปรตีน ทำให้ผิวหนังอ่อนแอและซ่อมแซมตัวเองได้ช้า'),
          _buildBulletSimple('อายุและโรคประจำตัว: ผู้สูงอายุ ผู้ป่วยอัมพาต หรือผู้ป่วยโรคทางระบบประสาท มีความเสี่ยงต่อการเกิดแผลกดทับมากขึ้น'),
          _buildWarningBox(
            'ข้อควรจำ',
            'ผู้ป่วยที่ไม่สามารถขยับร่างกายหรือรับรู้ความเจ็บปวดได้ ต้องได้รับการดูแลและตรวจสอบผิวหนังอย่างสม่ำเสมอ '
                'เพื่อป้องกันการเกิดแผลกดทับ',
          ),
          const SizedBox(height: 24),

          // ==================== หัวข้อ 5 ====================
          _buildSectionHeader('5. ระดับความรุนแรงของแผลกดทับ'),
          _buildParagraph(
            'การประเมินระดับความรุนแรงของแผลกดทับตามลักษณะการบาดเจ็บของชั้นผิวหนังและเนื้อเยื่อ:',
          ),
          const SizedBox(height: 12),

          // แต่ละระดับความรุนแรง (ระดับ 1 ถึง ระดับ 4) แสดงข้อความแล้วใส่รูปภาพล่างสุดของแต่ละระดับ
          ...kSeverityItems.map((item) => _buildTopicWithImage(
                title: item['title']!,
                desc: item['desc']!,
                assetPath: item['asset']!,
              )),

          const Divider(height: 36, thickness: 1.5),

          // แผลกดทับประเภทพิเศษ แสดงข้อความแล้วใส่รูปภาพล่างสุดของแต่ละประเภท
          ...kSpecialItems.map((item) => _buildTopicWithImage(
                title: item['title']!,
                desc: item['desc']!,
                assetPath: item['asset']!,
              )),

          const SizedBox(height: 24),

          // ==================== หัวข้อ 6 ====================
          _buildSectionHeader('6. วิธีป้องกันแผลกดทับ'),
          _buildParagraph(
            'การป้องกันแผลกดทับในผู้ป่วยติดเตียงเป็นสิ่งสำคัญ ผู้ดูแลควรปฏิบัติอย่างสม่ำเสมอ '
            'เพื่อลดแรงกดทับและป้องกันผิวหนังไม่ให้เกิดการบาดเจ็บ โดยมีวีดีโอสาธิตดังนี้',
          ),
          const SizedBox(height: 8),
          ...kPreventionVideos.map((v) => _VideoCard(
                assetPath: v['asset']!,
                title: v['label']!,
              )),
          const SizedBox(height: 24),

          // ==================== หัวข้อ 7 ====================
          _buildSectionHeader('7. สัญญาณผิดปกติที่ควรแจ้งบุคลากรสาธารณสุข'),
          const SizedBox(height: 8),
          ...kWarningImages.map((img) => _buildImageCard(img)),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ============ UI Helper Widgets ============

  /// Widget แสดงหัวข้อย่อย + ข้อความอธิบาย + รูปภาพด้านล่างสุดของแต่ละหัวข้อ
  static Widget _buildTopicWithImage({
    required String title,
    required String desc,
    required String assetPath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: const TextStyle(fontSize: 14.5, height: 1.55),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1565C0),
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

  static Widget _buildBullet(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(description,
              style: const TextStyle(fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }

  static Widget _buildBulletSimple(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 15)),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14, height: 1.5)),
          ),
        ],
      ),
    );
  }

  static Widget _buildWarningBox(String title, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFB300)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.warning_amber_rounded,
              color: Color(0xFFFF8F00), size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFFFF8F00))),
                const SizedBox(height: 4),
                Text(text, style: const TextStyle(fontSize: 14, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildImageCard(Map<String, String> img) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              img['asset']!,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            img['label']!,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Video Card Widget — เล่นไฟล์จาก Asset (ออฟไลน์)
// ============================================================

class _VideoCard extends StatefulWidget {
  final String assetPath;
  final String title;

  const _VideoCard({required this.assetPath, required this.title});

  @override
  State<_VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<_VideoCard> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      _videoController = VideoPlayerController.asset(widget.assetPath);
      await _videoController!.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: false,
        looping: false,
        showControlsOnInitialize: true,
        aspectRatio: _videoController!.value.aspectRatio,
      );
      if (mounted) {
        setState(() => _isInitialized = true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _hasError = true);
      }
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.play_circle_fill,
                    color: Color(0xFF1565C0), size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(widget.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          if (_hasError)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('ไม่สามารถเล่นวิดีโอได้',
                  style: TextStyle(color: Colors.red)),
            )
          else if (!_isInitialized)
            const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            )
          else
            AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: Chewie(controller: _chewieController!),
            ),
        ],
      ),
    );
  }
}
