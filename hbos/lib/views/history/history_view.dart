import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hbos/models/procces_model.dart';
import 'package:hbos/models/user_model.dart';
import 'package:hbos/views/widgets/hbos_history_component.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            //  top: MediaQuery.of(context).size.width * 0.2,
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("procces")
                        .snapshots(),
                    builder: (context, snapshot) {
                      UserModel().realAmount?.toInt();

                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      var procces = snapshot.data!.docs;

                      if (procces.isEmpty) {
                        return const Center(child: Text('No cards found.'));
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: procces.length < 5 ? procces.length : 5,
                        itemBuilder: (context, index) {
                          var data =
                              procces[index].data() as Map<String, dynamic>;
                          var proccesModel = ProccesModel.fromJson(data);
                          // var userModel = UserModel.fromJson(data);

                          if (UserModel().realAmount == null) {
                          }
                          //   else{userAmount = userAmount - (proccesModel.proccesAmount?.toInt() ??
                          //         userAmount)!;}

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: HistoryComponent(
                                  spentAmount:
                                      proccesModel.proccesAmount?.toString() ??
                                          'bulunamadı',
                                  remainingBalance: 'yeterli',
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
              )),
        ),
      ),
    );
  }
}
