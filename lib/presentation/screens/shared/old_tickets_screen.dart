import 'package:flutter/material.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/available_ticket_widget.dart';
import 'package:testapp/presentation/widget/drawer.dart';

class OldTicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تذاكر قديمة'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              AvailableTickets(
                ticketNumber: "#111111",
                price: '200',
                from: 'القاهرة',
                to: 'الأسكندرية',
                text1: 'تاريخ الرحلة',
                text2: 'الأثنين,29اغسطس',
                time: '10:30صباحا ',
                type: 'vip',
                typeColor: MyThemeData.appyellow,
              ),
              AvailableTickets(
                ticketNumber: "#222222",
                price: '150',
                from: 'الأسكندرية',
                to: 'القاهرة',
                text1: 'تاريخ الرحلة',
                text2: 'الأربعاء,7سبتمبر',
                time: '10:30صباحا ',
                type: 'Regular',
                typeColor: MyThemeData.dappblue,
              ),
              AvailableTickets(
                ticketNumber: "#222222",
                price: '150',
                from: 'الأسكندرية',
                to: 'القاهرة',
                text1: 'تاريخ الرحلة',
                text2: 'الأربعاء,7سبتمبر',
                time: '10:30صباحا ',
                type: 'Regular',
                typeColor: MyThemeData.dappblue,
              ),
              AvailableTickets(
                ticketNumber: "#222222",
                price: '150',
                from: 'الأسكندرية',
                to: 'القاهرة',
                text1: 'تاريخ الرحلة',
                text2: 'الأربعاء,7سبتمبر',
                time: '10:30صباحا ',
                type: 'Regular',
                typeColor: MyThemeData.dappblue,
              ),
            ]),
          ),
        ));
  }
}
