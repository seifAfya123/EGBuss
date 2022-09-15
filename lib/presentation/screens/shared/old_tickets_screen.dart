import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constants/const_test_data.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/available_ticket_widget.dart';
import 'package:testapp/presentation/widget/drawer.dart';

class OldTicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CupertinoNavigationBar(
            leading: CupertinoNavigationBarBackButton(color: Colors.white),
            backgroundColor: MyThemeData.appblue,
            middle: AppbarTitleText(titleText: 'تذاكر قديمة'),
          ),
          body: BodyWhiteContainer(
            withPadding: true,
            bodyChild: Center(
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
          )),
    );
  }
}
