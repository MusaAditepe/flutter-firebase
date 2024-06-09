import 'package:flutter/material.dart';
import 'package:hbos/services/user_services.dart';
import 'package:hbos/views/auth/login_view.dart';
import 'package:hbos/views/home/home_view.dart';
import 'package:hbos/views/widgets/hbos_main_button.dart';
import 'package:hbos/views/widgets/hbos_main_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
  }

  var eMailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var nameController = TextEditingController();
  String? emailErrorMessage;
  final List<String> genderItems = [
    'Erkek',
    'Kadın',
  ];
  String? selectedValue;
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
                      'https://cdni.iconscout.com/illustration/premium/thumb/sign-up-8694031-6983270.png'),
                  width: MediaQuery.sizeOf(context).width / 5 * 2),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Mail İle Kayıt Ol",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              const SizedBox(
                height: 30,
              ),
              HbosMainTextField(
                text: "Ad Soyad",
                obscureText: false,
                icon: Icons.mail,
                textEditingController: nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              HbosMainTextField(
                text: "Email Adresin",
                obscureText: false,
                icon: Icons.password,
                textEditingController: eMailController,
              ),
              const SizedBox(
                height: 25,
              ),
              HbosMainTextField(
                  text: "Şifre",
                  obscureText: true,
                  icon: Icons.password,
                  textEditingController: passwordController),
              const SizedBox(
                height: 25,
              ),
              HbosMainButton(
                "Giriş Yap",
                () async {
                  UserServices userServices = UserServices();
                  var user = await userServices.signup(
                      nameController.text,
                      eMailController.text,
                      passwordController.text,
                      rePasswordController.text,
                      selectedValue.toString(),
                      "Şehir Seçiniz");
                  if (user != null) {
                    Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ));
                  } else {}
                },
              ),
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
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 13),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Zaten bir hesaba",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: "  Sahibim",
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
