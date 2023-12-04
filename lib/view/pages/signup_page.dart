import 'package:christmas_postcard/providers/auth/auth_provider.dart';
import 'package:christmas_postcard/styles/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // header
              Text(
                'Merry Christmas',
                style: AppTextStyles.headline50(),
              ),
              // contents
              const SizedBox(height: 16),
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
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '이름',
                        prefixIcon: Icon(Icons.man),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        return null;
                        //validation
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '비밀번호 확인',
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
                              await context.read<AuthProvider>().signup(
                                    email: emailController.text,
                                    name: nameController.text,
                                    password: pwController.text,
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    '회원가입에 성공했습니다.',
                                  ),
                                  duration: Duration(seconds: 120),
                                ),
                              );
                            },
                            child: Text(
                              '회원가입',
                              style: AppTextStyles.body16B(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              '홈으로',
                              style: AppTextStyles.body16B(),
                            ),
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
      ),
    );
  }
}
