import 'package:dentistreservation/app/data/model/booking_history.dart';
import 'package:dentistreservation/app/data/provider/dummy_data.dart';
import 'package:dentistreservation/app/module/history/history_view.dart';
import 'package:dentistreservation/app/module/root/root_view.dart';
import 'package:dentistreservation/core/theme/app_color.dart';
import 'package:dentistreservation/core/values/images.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_button_style.dart';
import '../../../core/utils/ui_utils.dart';

class BookingConfirmationView extends StatelessWidget {
  final String date;
  final String time;
  final String service;

  const BookingConfirmationView(
      {super.key,
      required this.date,
      required this.time,
      required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfirmasi Reservasi"),
      ),
      bottomNavigationBar: Padding(
        padding: UIUtils.paddingAll(16),
        child: ElevatedButton(
          style: AppButtonStyle.filledPrimary,
          onPressed: () {
            DummyData.historyList.add(
                BookingHistory(serviceName: service, date: date, time: time));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => RootView(currentScreen: 1)),
                (route) => false);
          },
          child: const Text("Konfirmasi"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: UIUtils.paddingFromLTRB(
                    left: 16, top: 16, right: 16, bottom: 0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: UIUtils.borderRadiusAll()),
                    padding: UIUtils.paddingAll(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jadwal",
                            style: TextStyle(fontSize: 16),
                          ),
                          UIUtils.heightSpace(16),
                          Row(
                            children: [
                              Image.asset(
                                Images.calendarIcon,
                                width: 18,
                              ),
                              UIUtils.widthSpace(8),
                              Text(date),
                            ],
                          ),
                          UIUtils.heightSpace(8),
                          Row(
                            children: [
                              Image.asset(
                                Images.clockIcon,
                                width: 18,
                              ),
                              UIUtils.widthSpace(8),
                              Text(time),
                            ],
                          )
                        ]))),
            Padding(
                padding: UIUtils.paddingFromLTRB(
                    left: 16, top: 16, right: 16, bottom: 0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: UIUtils.borderRadiusAll()),
                    padding: UIUtils.paddingAll(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Informasi Pribadi",
                            style: TextStyle(fontSize: 16),
                          ),
                          UIUtils.heightSpace(16),
                          Text(
                            "Nama Lengkap",
                            style: TextStyle(color: AppColor.neutral400),
                          ),
                          Text(
                            "John Doe",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          UIUtils.heightSpace(16),
                          Text(
                            "Tanggal Lahir",
                            style: TextStyle(color: AppColor.neutral400),
                          ),
                          Text(
                            "19 Januari 1999",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          UIUtils.heightSpace(16),
                          Text(
                            "Alamat",
                            style: TextStyle(color: AppColor.neutral400),
                          ),
                          Text(
                            "Jalan Sudirman nomor 19",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          UIUtils.heightSpace(16),
                          Text(
                            "Layanan",
                            style: TextStyle(color: AppColor.neutral400),
                          ),
                          Text(
                            service,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]))),
          ],
        ),
      ),
    );
  }
}
