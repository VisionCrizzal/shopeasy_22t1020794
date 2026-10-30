import 'package:flutter_test/flutter_test.dart';
import 'package:shopeasy_22t1020794/main.dart';
import 'package:shopeasy_22t1020794/features/splash/screens/splash_screen.dart';
import 'package:shopeasy_22t1020794/features/home/screens/home_screen.dart';

void main() {
  testWidgets('MenuPage hiển thị thông tin sinh viên và điều hướng vào ShopEasy',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Kiểm tra thông tin sinh viên trên MenuPage
    expect(find.text('Nguyễn Ngọc Vĩ'), findsOneWidget);
    expect(find.text('MSSV: 22T1020794 • Lớp: K46D'), findsOneWidget);
    expect(find.text('ShopEasy - E-Commerce App'), findsOneWidget);

    // Nhấn vào thẻ ShopEasy để mở SplashScreen
    await tester.tap(find.text('ShopEasy - E-Commerce App'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(SplashScreen), findsOneWidget);

    // Đợi timer 2.2 giây trên SplashScreen chuyển sang HomeScreen
    await tester.pump(const Duration(milliseconds: 2000));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Danh mục nổi bật'), findsOneWidget);
  });
}
