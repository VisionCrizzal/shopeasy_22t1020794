import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(
                Icons.shopping_bag_rounded,
                color: AppColors.primary,
                size: AppSizes.iconM,
              ),
              SizedBox(width: AppSizes.paddingS),
              Text(
                AppStrings.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Tìm kiếm',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              tooltip: 'Thông báo',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              tooltip: 'Giỏ hàng',
              onPressed: () {},
            ),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            _HomeTabContent(),
            _FeaturePlaceholderState(
              icon: Icons.category_rounded,
              title: 'Danh mục & Bộ lọc sản phẩm',
              subtitle:
                  'Sẽ được xây dựng ở Chương 4 & Chương 5 với bố cục Responsive Grid và thanh tìm kiếm.',
            ),
            _FeaturePlaceholderState(
              icon: Icons.favorite_rounded,
              title: 'Danh sách yêu thích trống',
              subtitle:
                  'Chức năng Giỏ hàng & Yêu thích quản lý trạng thái sẽ được phát triển ở Chương 6.',
            ),
            _FeaturePlaceholderState(
              icon: Icons.person_rounded,
              title: 'Tài khoản người dùng',
              subtitle:
                  'Đăng nhập Email/Google với Firebase Auth & đồng bộ Firestore sẽ được tích hợp ở Chương 10.',
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          backgroundColor: AppColors.surface,
          indicatorColor: AppColors.primaryLight,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: AppColors.primary),
              label: 'Trang chủ',
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              selectedIcon: Icon(Icons.category, color: AppColors.primary),
              label: 'Danh mục',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite, color: AppColors.primary),
              label: 'Yêu thích',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person, color: AppColors.primary),
              label: 'Cá nhân',
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSizes.paddingM),
      children: [
        // Banner chào mừng đồ án
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.welcome,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.paddingS),
              Text(
                'Đồ án ứng dụng thương mại điện tử xuyên suốt học phần\n${AppStrings.studentInfo}',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.paddingL),

        // Danh mục sản phẩm (Preview)
        const Text(
          'Danh mục nổi bật',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 92,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _CategoryItem(
                icon: Icons.phone_iphone_rounded,
                label: 'Điện thoại',
              ),
              _CategoryItem(
                icon: Icons.laptop_chromebook_rounded,
                label: 'Laptop',
              ),
              _CategoryItem(
                icon: Icons.headphones_rounded,
                label: 'Phụ kiện',
              ),
              _CategoryItem(
                icon: Icons.watch_rounded,
                label: 'Đồng hồ',
              ),
              _CategoryItem(
                icon: Icons.camera_alt_rounded,
                label: 'Máy ảnh',
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.paddingL),

        // Khu vực sản phẩm đề xuất
        const Text(
          'Sản phẩm mới nhất',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.78,
          children: const [
            _PreviewProductCard(
              name: 'Laptop Gaming Pro',
              price: '24.990.000 đ',
              rating: '4.8',
              inStock: true,
            ),
            _PreviewProductCard(
              name: 'Smartphone X Plus',
              price: '15.490.000 đ',
              rating: '4.9',
              inStock: true,
            ),
            _PreviewProductCard(
              name: 'Tai nghe chống ồn',
              price: '3.290.000 đ',
              rating: '4.7',
              inStock: true,
            ),
            _PreviewProductCard(
              name: 'Đồng hồ thông minh',
              price: '4.890.000 đ',
              rating: '4.6',
              inStock: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.paddingM),
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primaryLight,
            child: Icon(
              icon,
              color: AppColors.primary,
              size: AppSizes.iconM,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String rating;
  final bool inStock;

  const _PreviewProductCard({
    required this.name,
    required this.price,
    required this.rating,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(AppSizes.radiusS),
                  border: Border.all(color: AppColors.divider),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 44,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.paddingS),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSizes.paddingXS),
            Text(
              inStock ? 'Còn hàng' : 'Tạm hết hàng',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: inStock ? AppColors.success : AppColors.error,
              ),
            ),
            const SizedBox(height: AppSizes.paddingXS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: AppColors.secondary, // Cam, dùng cho giá và CTA (Slide 59)
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: AppSizes.iconS,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturePlaceholderState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeaturePlaceholderState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.primaryLight,
              child: Icon(icon, size: 36, color: AppColors.primary),
            ),
            const SizedBox(height: AppSizes.paddingM),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSizes.paddingS),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
