import 'package:flutter/material.dart';
import 'package:hbos/services/user_services.dart';
import 'package:hbos/views/auth/forget_password_view.dart';
import 'package:hbos/views/auth/sing_up_view.dart';
import 'package:hbos/views/home/home_view.dart';
import 'package:hbos/views/widgets/hbos_main_button.dart';
import 'package:hbos/views/widgets/hbos_main_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  var eMailController = TextEditingController();
  var passwordController = TextEditingController();
  String? emailErrorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: const NetworkImage(
                      'https://en.pimg.jp/038/659/446/1/38659446.jpg'),
                  width: MediaQuery.sizeOf(context).width / 5 * 2),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Hesabın ile Giriş Yap",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              const SizedBox(
                height: 30,
              ),
              HbosMainTextField(
                text: "Email Adresin",
                obscureText: false,
                icon: Icons.mail,
                textEditingController: eMailController,
              ),
              const SizedBox(
                height: 15,
              ),
              HbosMainTextField(
                text: "Şifren",
                obscureText: true,
                icon: Icons.password,
                textEditingController: passwordController,
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPasswordView()),
                  );
                },
                child: const Text(
                  "Şifremi unuttum?",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              HbosMainButton("Giriş Yap", () async {
                UserServices userServices = UserServices();
                var user = await userServices.login(
                  eMailController.text,
                  passwordController.text,
                );
                if (user == null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Hatalı Giriş Bilgisi!')),
                  );
                }
                if (eMailController.text == "" &&
                    passwordController.text == "") {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Hatalı Giriş Bilgisi!')),
                  );
                }
                if (user != null) {
                  Navigator.pushReplacement(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ));
                }
              }),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
