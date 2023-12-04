import 'package:christmas_postcard/repository/auth_repository.dart';
import 'package:christmas_postcard/styles/app_font_styles.dart';
import 'package:christmas_postcard/view/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Merry Christmas',
              style: AppTextStyles.headline50(),
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) {
                      return null;
                      //validation
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이메일',
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (value) {
                      return null;
                      //validation
                    },
                    controller: pwController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await context.read<AuthRepository>().signin(
                                  email: emailController.text,
                                  password: pwController.text,
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '성공적으로 로그인했습니다.',
                                ),
                                duration: Duration(seconds: 120),
                              ),
                            );
                          },
                          child: Text(
                            '로그인',
                            style: AppTextStyles.body16B(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await context
                                .read<AuthRepository>()
                                .signinWithGoogle(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '성공적으로 로그인했습니다.',
                                ),
                                duration: Duration(seconds: 120),
                              ),
                            );
                          },
                          child: Text(
                            '구글로그인',
                            style: AppTextStyles.body16B(),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                            (route) => route.isFirst,
                          );
                        },
                        child: const Text(
                          '회원가입하러가기',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
