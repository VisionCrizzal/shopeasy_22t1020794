import 'dart:async';
import 'package:flutter/material.dart';

class BaiTap21Page extends StatefulWidget {
  const BaiTap21Page({super.key});

  @override
  State<BaiTap21Page> createState() => _BaiTap21PageState();
}

class _BaiTap21PageState extends State<BaiTap21Page> {
  int currentIndex = 0;
  final int totalDots = 5;
  Timer? _timer;

  // Danh sách 5 ảnh wallpaper
  final List<String> images = [
    'assets/wallpaper/wallpaper_1.jpg',
    'assets/wallpaper/wallpaper_2.jpg',
    'assets/wallpaper/wallpaper_3.jpg',
    'assets/wallpaper/wallpaper_4.jpeg',
    'assets/wallpaper/wallpaper_5.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Huỷ timer khi thoát màn hình để tránh rò rỉ bộ nhớ
    super.dispose();
  }

  // Khởi động bộ đếm tự động chuyển sau mỗi 5 giây
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _nextDot();
    });
  }

  // Hàm xử lý nút Lùi
  void _prevDot() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = totalDots - 1;
      } else {
        currentIndex--;
      }
    });
    _startTimer(); // Khởi động lại chu kỳ 5 giây khi người dùng bấm thủ công
  }

  // Hàm xử lý nút Tới
  void _nextDot() {
    setState(() {
      if (currentIndex == (totalDots - 1)) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    });
    _startTimer(); // Khởi động lại chu kỳ 5 giây khi người dùng bấm thủ công
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập 2.1: Image & Indicator Slider'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Khung hiển thị ảnh có hiệu ứng đổi ảnh mượt mà (Fade Animation)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      images[currentIndex],
                      key: ValueKey<int>(currentIndex),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Text(
                              'Ảnh No. $currentIndex',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Dãy 5 chấm tròn Indicator (Chấm đỏ di chuyển)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalDots, (index) {
                  final bool isSelected = index == currentIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                      _startTimer();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      width: isSelected ? 18 : 12,
                      height: isSelected ? 18 : 12,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.red : Colors.grey.shade400,
                        shape: BoxShape.circle,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.red.withValues(alpha: 0.4),
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                )
                              ]
                            : [],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),

              // Thông tin vị trí ảnh và thông báo đếm giờ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.timer_outlined, size: 16, color: Colors.blueGrey),
                  const SizedBox(width: 4),
                  Text(
                    'Ảnh ${currentIndex + 1} / $totalDots • Tự động chuyển sau 5s',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // 3. Hai nút bấm "Lùi" và "Tới" với icon mũi tên trái/phải
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nút LÙI (arrow left)
                  ElevatedButton.icon(
                    onPressed: _prevDot,
                    icon: const Icon(Icons.arrow_left, size: 28),
                    label: const Text(
                      'Lùi',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),

                  // Nút TỚI (arrow right)
                  ElevatedButton.icon(
                    onPressed: _nextDot,
                    icon: const Icon(Icons.arrow_right, size: 28),
                    label: const Text(
                      'Tới',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
