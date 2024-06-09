import 'package:flutter/material.dart';
import 'package:hbos/views/account/payment_history/payment_history__component.dart';

class PaymnetHistoryPage extends StatefulWidget {
  const PaymnetHistoryPage({super.key});

  @override
  State<PaymnetHistoryPage> createState() => _PaymnetHistoryPageState();
}

class _PaymnetHistoryPageState extends State<PaymnetHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: const Column(
                children: [
                  PaymentHistoryComponent(
                    cardName: 'Öğrenci Kartı',
                    transactionDate: '11.02.2024',
                    transactionAmount: '25TL',
                    newBalance: '277TL',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PaymentHistoryComponent(
                    cardName: 'Öğrenci Kartı',
                    transactionDate: '05.01.2024',
                    transactionAmount: '150TL',
                    newBalance: '252TL',
                  ),
                ],
              )),
        ));
  }
}
