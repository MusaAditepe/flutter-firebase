import 'package:flutter/material.dart';
import 'package:hbos/models/card_model.dart';
import 'package:hbos/services/user_services.dart';
import 'package:hbos/views/widgets/hbos_main_button.dart';
import 'package:hbos/views/widgets/hbos_main_textfield.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  //final CardServices _cardServices = CardServices();
  //final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final cardNameController = TextEditingController();
  final UserServices _userServices = UserServices();
  //var userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          // color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const Text(
                  "Lütfen Tüm Alanları Eksiksiz Doldurun",
                  style: TextStyle(
                      color: Color(0xFF3DD39B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                    "Kart bilgileriniz. Hbos tarafından Google sunucularında tutulmaktadır. Üçüncü parti şirketler ile kart bilgileriniz paylaşılmaz. Detaylı yazı için kullanıcı sözleşmesini okuyunuz."),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const Text(
                  "Kart Adı",
                  style: TextStyle(
                      color: Color(0xFF3DD39B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //SizedBox(height: ,),
              HbosMainTextField(
                text: "Kart Adı",
                obscureText: false,
                icon: Icons.abc,
                textEditingController: cardNameController,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const Text(
                  "Kart ID",
                  style: TextStyle(
                      color: Color(0xFF3DD39B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),

              HbosMainTextField(
                  text: "Kart ID",
                  obscureText: false,
                  icon: Icons.password,
                  textEditingController: _cardNumberController),
              const SizedBox(
                height: 15,
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: HbosMainButton(
                      "KAYDET",
                      () async {
                        int cardNumber = int.parse(_cardNumberController.text);

                        try {
                          CardModel? newCard = CardModel();
                          newCard.cardNummber = cardNumber;
                          newCard.cardName = cardNameController.text;
                          var result = await _userServices.addCard(newCard);
                          if (result) {
                            await ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Card added successfully!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to add card')),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
