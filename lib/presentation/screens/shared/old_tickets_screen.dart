import 'package:flutter/material.dart';
import 'package:testapp/constants/const_test_data.dart';

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
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (BuildContext context, int index) {
                return AvailableTickets(
                  ticket: tickets[index],
                  function: () {},
                );
              },
            ),
          ),
        ));
  }
}
