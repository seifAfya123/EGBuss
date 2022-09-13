import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/data/models/mesasge.dart';
import 'package:testapp/data/models/ticket.dart';

class ConstTestData {}

List<Mesasge> constMessages = [
  Mesasge(
    title: "ahmed",
    isSeen: false,
    messageContent:
        "يؤسفنا ان نبلغك ان تم تاجيل رحلتك من القاهره الي الاسكندريه رقم 32156445 بدلا من يوم 22/10/2022 الي 23/10/2022 الساعه 10 مساءا , محطه الماظه",
  ),
  Mesasge(
    title: "ahmed",
    isSeen: true,
    messageContent:
        "نود أن نذكرك بموعد رحلتك في 26  أغسطس , 12:00 مساءً ,محطه الماظه نتمني لكم رحله سعيده",
  ),
  Mesasge(
    title: "ahmed",
    isSeen: false,
    messageContent:
        "يؤسفنا ان نبلغك ان تم تاجيل رحلتك من القاهره الي الاسكندريه رقم 32156445 بدلا من يوم 22/10/2022 الي 23/10/2022 الساعه 10 مساءا , محطه الماظه",
  ),
];
List<Ticket> tickets = [
  Ticket(
    ticketNumber: "#111111",
    price: '200',
    from: 'القاهرة',
    to: 'الأسكندرية',
    text1: 'تاريخ الرحلة',
    text2: 'الأثنين,29اغسطس',
    time: '10:30صباحا ',
    type: 'vip',
  ),
  Ticket(
    ticketNumber: "#222222",
    price: '150',
    from: 'الأسكندرية',
    to: 'القاهرة',
    text1: 'تاريخ الرحلة',
    text2: 'الأربعاء,7سبتمبر',
    time: '10:30صباحا ',
    type: 'Regular',
  ),
];

List<List<SeatStatus>> seatsStatusFakeData = [
  [
    SeatStatus.notAvailable,
    SeatStatus.available,
    SeatStatus.lane,
    SeatStatus.notAvailable,
    SeatStatus.notAvailable,
  ],
  [
    SeatStatus.available,
    SeatStatus.available,
    SeatStatus.lane,
    SeatStatus.notAvailable,
    SeatStatus.notAvailable,
  ],
  [
    SeatStatus.notAvailable,
    SeatStatus.available,
    SeatStatus.lane,
    SeatStatus.notAvailable,
    SeatStatus.notAvailable,
  ],
  [
    SeatStatus.notAvailable,
    SeatStatus.available,
    SeatStatus.lane,
    SeatStatus.notAvailable,
    SeatStatus.notAvailable,
  ],
  [
    SeatStatus.notAvailable,
    SeatStatus.available,
    SeatStatus.lane,
    SeatStatus.notAvailable,
    SeatStatus.available,
  ],
  [
    SeatStatus.notAvailable,
    SeatStatus.notAvailable,
    SeatStatus.lane,
    SeatStatus.notAvailable,
    SeatStatus.available,
  ],
  [
    SeatStatus.notAvailable,
    SeatStatus.available,
    SeatStatus.lane,
    SeatStatus.available,
    SeatStatus.notAvailable,
  ],
  [
    SeatStatus.available,
    SeatStatus.available,
    SeatStatus.lane,
    SeatStatus.notAvailable,
    SeatStatus.notAvailable,
  ],
  [
    SeatStatus.notAvailable,
    SeatStatus.notAvailable,
    SeatStatus.available,
    SeatStatus.available,
    SeatStatus.available,
  ],
];
