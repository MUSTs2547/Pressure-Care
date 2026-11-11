import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

// ============================================================
// Asset Array — วิดีโอสาธิตการดูแลผู้ป่วย (5 ไฟล์)
// ============================================================

const List<Map<String, String>> kCareVideos = [
  {
    'asset': 'Asset/VDO/care/positioning_and_turning.mkv',
    'title': 'การจัดท่า เลื่อนตัว และพลิกตะแคงตัวผู้ป่วย',
    'icon': 'bed',
  },
  {
    'asset': 'Asset/VDO/care/wound_dressing.webm',
    'title': 'การทำแผลกดทับเบื้องต้น',
    'icon': 'healing',
  },
  {
    'asset': 'Asset/VDO/care/hair_washing.mkv',
    'title': 'การสระผมผู้ป่วยติดเตียง',
    'icon': 'wash',
  },
  {
    'asset': 'Asset/VDO/care/diaper_changing.webm',
    'title': 'เปลี่ยนผ้าอ้อม ผู้สูงอายุ และผู้ป่วยติดเตียง',
    'icon': 'baby_changing_station',
  },
  {
    'asset': 'Asset/VDO/care/bed_bath.mkv',
    'title': 'วิธีเช็ดตัว ผู้ป่วยติดเตียง',
    'icon': 'clean_hands',
  },
];

/// Map icon string → IconData
IconData _getIcon(String key) {
  switch (key) {
    case 'bed':
      return Icons.bed_rounded;
    case 'healing':
      return Icons.healing_rounded;
    case 'wash':
      return Icons.wash_rounded;
    case 'baby_changing_station':
      return Icons.baby_changing_station_rounded;
    case 'clean_hands':
      return Icons.clean_hands_rounded;
    default:
      return Icons.play_circle_rounded;
  }
}

// ============================================================
// Page 2 — วิดีโอสาธิตการดูแลผู้ป่วย
// ============================================================

class Page2Video extends StatelessWidget {
  const Page2Video({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('วิดีโอสาธิตการดูแลผู้ป่วย'),
        backgroundColor: const Color(0xFFE8F5E9),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kCareVideos.length,
        itemBuilder: (context, index) {
          final video = kCareVideos[index];
          return _VideoListTile(
            index: index + 1,
            title: video['title']!,
            icon: _getIcon(video['icon']!),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => _VideoPlayerPage(
                  assetPath: video['asset']!,
                  title: video['title']!,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// Video list tile
// ============================================================

class _VideoListTile extends StatelessWidget {
  final int index;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _VideoListTile({
    required this.index,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF2E7D32), size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'วิดีโอที่ $index',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.play_circle_outline,
                  color: Color(0xFF2E7D32), size: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// Full-screen video player page
// ============================================================

class _VideoPlayerPage extends StatefulWidget {
  final String assetPath;
  final String title;

  const _VideoPlayerPage({required this.assetPath, required this.title});

  @override
  State<_VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<_VideoPlayerPage> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      _videoController = VideoPlayerController.asset(widget.assetPath);
      await _videoController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: true,
        looping: false,
        showControlsOnInitialize: true,
        aspectRatio: _videoController.value.aspectRatio,
        allowFullScreen: true,
      );
      if (mounted) {
        setState(() => _isInitialized = true);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFFE8F5E9),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: _hasError
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      color: Colors.white54, size: 64),
                  const SizedBox(height: 16),
                  const Text(
                    'ไม่สามารถเล่นวิดีโอได้',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.white38, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            : !_isInitialized
                ? const CircularProgressIndicator(color: Colors.white)
                : AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  ),
      ),
    );
  }
}
