import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hbos/models/procces_model.dart';
import 'package:hbos/models/user_model.dart';
import 'package:hbos/views/account/account_view.dart';
import 'package:hbos/views/cards/cards_view.dart';
import 'package:hbos/views/history/history_view.dart';
import 'package:hbos/views/home/header_component.dart';
import 'package:hbos/views/home/home_way_components.dart';
import 'package:hbos/views/payment/payment_view.dart';
import 'package:hbos/views/widgets/hbos_history_component.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int userAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
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
            userAmount = user.realAmount?.toInt() ?? 0;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Merhaba, ${user.name}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    user.imagePath ?? '',
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AccountView()),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: HeaderComponent(
                              balance: '${user.realAmount}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: const Row(
                      children: [
                        HomeWayComponent(
                          icon: Icons.wallet,
                          title: 'Bakiye Yükle',
                          color: Colors.blue,
                          destination: PaymentPage(),
                        ),
                        Spacer(),
                        HomeWayComponent(
                          icon: Icons.history,
                          title: 'Geçmiş',
                          color: Colors.green,
                          destination: HistoryView(),
                        ),
                        Spacer(),
                        HomeWayComponent(
                          icon: Icons.credit_card,
                          title: 'Kartlarım',
                          color: Colors.red,
                          destination: CardsView(),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'İşlemler',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '| Son 5 İşlem',
                              style: TextStyle(
                                  color: Color(0xFF3DD39B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("procces")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }

                            var procces = snapshot.data!.docs;

                            if (procces.isEmpty) {
                              return  Center(
                                  child: Container(color: Colors.white,height: MediaQuery.of(context).size.width * 0.9,
                                  child: Center(child: Text('İşlem bulunmamaktadır',style: TextStyle(color: Color(0xFF3DD39B),fontSize: 26),)),
      width: MediaQuery.of(context).size.width * 0.9,));
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  procces.length < 5 ? procces.length : 5,
                              itemBuilder: (context, index) {
                                var data = procces[index].data()
                                    as Map<String, dynamic>;
                                var proccesModel = ProccesModel.fromJson(data);
                                userAmount =userAmount-
                                    proccesModel.proccesAmount!.toInt() ??
                                        userAmount;

                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: HistoryComponent(
                                        spentAmount: proccesModel.proccesAmount
                                                ?.toString() ??
                                            'bulunamadı',
                                        remainingBalance: userAmount.toString(),
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.green,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
