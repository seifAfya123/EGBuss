import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/constants/const_test_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/available_ticket_widget.dart';
import 'package:testapp/presentation/widget/drawer.dart';

class TicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const AppbarTitleText(titleText: 'تذاكر'),
        ),
        body: Center(
          child: BodyWhiteContainer(
            withPadding: true,
            bodyChild: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (BuildContext context, int index) {
                return AvailableTickets(
                  ticket: tickets[index],
                  function: () {
                    Navigator.pushNamed(
                      context,
                      RoutNamesDart.rTripTicketScreen,
                      arguments: tickets[index],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
