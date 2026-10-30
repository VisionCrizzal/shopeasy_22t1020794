import 'package:flutter/material.dart';
import 'bai_tap_1/bai_tap_1_page.dart';
import 'bai_tap_2/bai_tap_2_page.dart';
import 'bai_tap_2_1/bai_tap_2_1_page.dart';
import 'core/widgets/color_palette_page.dart';
import 'features/splash/screens/splash_screen.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng Dụng Di Động - Flutter'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Thẻ thông tin sinh viên
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    child: Icon(Icons.person, size: 32),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nguyễn Ngọc Vĩ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'MSSV: 22T1020794 • Lớp: K46D',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // KHU VỰC DỰ ÁN XUYÊN SUỐT: SHOPEASY
          const Row(
            children: [
              Icon(Icons.stars_rounded, color: Colors.amber, size: 22),
              SizedBox(width: 6),
              Text(
                'DỰ ÁN XUYÊN SUỐT HỌC PHẦN (60%)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Card(
            elevation: 3,
            color: Colors.indigo.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: Colors.indigo.shade200, width: 1.5),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 26),
              ),
              title: const Text(
                'ShopEasy - E-Commerce App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.indigo,
                ),
              ),
              subtitle: const Text(
                'Ứng dụng thương mại điện tử hoàn chỉnh theo lộ trình 10 chương',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Colors.indigo),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SplashScreen()),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // KHU VỰC BÀI TẬP THỰC HÀNH TRÊN LỚP
          const Text(
            'Bài tập thực hành trên lớp (Labs):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Thực hành 20 (Chương 3)
          _buildExerciseCard(
            context,
            icon: Icons.palette_rounded,
            title: 'TH 20: Bảng màu riêng cho ShopEasy',
            subtitle: 'Khai báo AppColors & hiển thị Wrap ô màu 80x80 (Slide 60)',
            color: Colors.teal,
            destination: const ColorPalettePage(),
          ),

          const SizedBox(height: 12),

          // Bài tập 1
          _buildExerciseCard(
            context,
            icon: Icons.dashboard_customize_rounded,
            title: 'Bài tập 1: Bố cục Layout (Oeschinen Lake)',
            subtitle: 'Thực hành Row, Column, Container & Image',
            color: Colors.blue,
            destination: const BaiTap1Page(),
          ),

          const SizedBox(height: 12),

          // Bài tập 2
          _buildExerciseCard(
            context,
            icon: Icons.view_carousel_rounded,
            title: 'Bài tập 2: Complicated Image Slider Demo',
            subtitle: 'Trượt album ảnh wallpaper với carousel slider',
            color: Colors.purple,
            destination: const BaiTap2Page(),
          ),

          const SizedBox(height: 12),

          // Bài tập 2.1
          _buildExerciseCard(
            context,
            icon: Icons.linear_scale_rounded,
            title: 'Bài tập 2.1: Custom Indicator Demo',
            subtitle: 'Điều khiển di chuyển chấm đỏ với nút Lùi/Tới',
            color: Colors.redAccent,
            destination: const BaiTap21Page(),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Widget destination,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
      ),
    );
  }
}
