// lib/core/widgets/color_palette_page.dart
// Thực hành TH 20 - Bảng màu riêng cho ShopEasy (Slide 60 - Chương 3)
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class ColorPalettePage extends StatelessWidget {
  const ColorPalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TH 20: Bảng màu ShopEasy (Slide 60)'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bảng màu chuẩn hệ thống (AppColors)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Mỗi ô có kích thước 80 × 80, tự động xuống dòng bằng Widget Wrap.',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                _OMau('primary', AppColors.primary, 'Xanh chủ đạo'),
                _OMau('primaryLight', AppColors.primaryLight, 'Xanh nhạt'),
                _OMau('secondary', AppColors.secondary, 'Cam giá & CTA'),
                _OMau('success', AppColors.success, 'Còn hàng'),
                _OMau('error', AppColors.error, 'Hết hàng / Lỗi'),
                _OMau('background', AppColors.background, 'Nền app'),
                _OMau('surface', AppColors.surface, 'Nền card'),
                _OMau('textPrimary', AppColors.textPrimary, 'Chữ chính'),
                _OMau('textSecondary', AppColors.textSecondary, 'Chữ phụ'),
                _OMau('divider', AppColors.divider, 'Đường kẻ'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OMau extends StatelessWidget {
  final String label;
  final Color color;
  final String note;

  const _OMau(this.label, this.color, [this.note = '']);

  @override
  Widget build(BuildContext context) {
    final bool isDark = color.computeLuminance() < 0.5;

    return Column(
      children: [
        Container(
          width: AppSizes.thumbnailSize, // 80.0 (Slide 60 & 61)
          height: AppSizes.thumbnailSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
            border: Border.all(
              color: Colors.grey.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black87,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        if (note.isNotEmpty)
          Text(
            note,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
      ],
    );
  }
}
