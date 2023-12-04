import 'package:christmas_postcard/providers/user/user_provider.dart';
import 'package:christmas_postcard/view/pages/my_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  Future<void> _getProfile() async {
    await context.read<UserProvider>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPage(),
                  ),
                  (route) => route.isFirst,
                );
              },
              child: const Text(
                '내 트리',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                '크리스마스 엽서 조르기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
