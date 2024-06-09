import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hbos/models/user_model.dart';
import 'package:hbos/views/account/about_hbos_page/about_view.dart';
import 'package:hbos/views/account/account_item_components.dart';
import 'package:hbos/views/account/payment_history/payment_history_view.dart';
import 'package:hbos/views/account/terms_page/terms_view.dart';
import 'package:hbos/views/auth/intro_view.dart';
import 'package:hbos/views/home/home_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      Map<String, dynamic> dataMap =
                          snapshot.data!.data() as Map<String, dynamic>;
                      var user = UserModel.fromJson(dataMap);

                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                              '${user.imagePath}',
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${user.name}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    letterSpacing: .6),
                              ),
                              const Text("Onaylanmış hesap"),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 20,
                      )),
                ],
              ),
              const Divider(thickness: .3),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xff397aff),
                shadowColor: const Color(0xffeef4ff),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymnetHistoryPage()),
                  );
                },
                text: "Ödeme Geçmişi",
                icon: Icons.account_balance_wallet,
              ),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xffff6d75),
                shadowColor: const Color(0xfffff2f3),
                onPressed: () {},
                text: "Bildirimler",
                icon: Icons.notifications_active,
                endWidget: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: const Color(0xfffea11e),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: .3),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xff397aff),
                shadowColor: const Color(0xffeef4ff),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymnetHistoryPage()),
                  );
                },
                text: "Ayarlar",
                icon: Icons.settings,
              ),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xff37c667),
                shadowColor: const Color(0xffedf9f1),
                onPressed: () {},
                text: "Güvenlik",
                icon: Icons.security,
              ),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xff7657ff),
                shadowColor: const Color(0xfff3f1ff),
                onPressed: () {},
                text: "Dil",
                icon: Icons.language_rounded,
                endWidget: const Row(
                  children: [
                    Text(
                      "Türkçe (Tr)",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 1.1),
                    ),
                    SizedBox(height: 10),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xff37c667),
                shadowColor: const Color(0xffedf9f1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutHbosPage()),
                  );
                },
                text: "Yardım Merkezi",
                icon: Icons.help_outlined,
              ),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xfffea11e),
                shadowColor: const Color(0xfffff7eb),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TermsPage()),
                  );
                },
                text: "Kullanıcı Sözleşmesi",
                icon: Icons.edit_document,
              ),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xff37c667),
                shadowColor: const Color(0xffedf9f1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutHbosPage()),
                  );
                },
                text: "HBOS Hakkında",
                icon: Icons.info,
              ),
              const SizedBox(height: 10),
              AccountItem(
                iconColor: const Color(0xffff6d75),
                shadowColor: const Color(0xfffff2f3),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroView()),
                  );
                },
                text: "Çıkış Yap",
                icon: Icons.logout_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
