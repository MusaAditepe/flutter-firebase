import 'package:flutter/material.dart';
import 'package:hbos/views/auth/login_view.dart';
import 'package:hbos/views/auth/sing_up_view.dart';
import 'package:hbos/views/widgets/hbos_main_button.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTphvVnyhKwnqcM0yaIi5LJz6rJ8CnJ_vNV562ulCjRBxTQDgytbaVMYXzaroxIX6xV9F8&usqp=CAU'),
                      width: MediaQuery.sizeOf(context).width / 10 * 8),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Hemen Giriş Yap",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  HbosMainButton("Email ile Giriş Yap", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 13),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Henüz hesabın yok mu? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: " Kayıt Ol",
                            style: TextStyle(
                                color: Color(0xFF3DD39B),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
