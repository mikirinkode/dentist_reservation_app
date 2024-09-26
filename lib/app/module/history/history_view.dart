import 'package:dentistreservation/app/data/provider/dummy_data.dart';
import 'package:dentistreservation/core/utils/ui_utils.dart';
import 'package:dentistreservation/core/values/images.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_button_style.dart';
import '../booking/booking_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
      ),
      body: (DummyData.historyList.isEmpty)
          ? Center(
            child: Padding(
              padding: UIUtils.paddingAll(24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: UIUtils.borderRadiusAll(),
                  color: Colors.white
                ),
                padding: UIUtils.paddingAll(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIUtils.heightSpace(16),
                      Image.asset(Images.calendarIcon),
                      UIUtils.heightSpace(16),
                      Text("Belum ada Riwayat", style: TextStyle(fontSize: 18),),
                      Text(
                        "Kamu belum pernah melakukan reservasi jadwal periksa gigi. Yuk segera periksa gigimu.",
                        textAlign: TextAlign.center,
                      ),
                      UIUtils.heightSpace(24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: AppButtonStyle.filledPrimary,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BookingView(
                                selectedService: "",
                              );
                            }));
                          },
                          child: const Text("Reservasi Sekarang"),
                        ),
                      )
                    ],
                  ),
              ),
            ),
          )
          : ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: UIUtils.paddingAll(16),
              children: DummyData.historyList.reversed
                  .map((e) => Padding(
                        padding: UIUtils.paddingBottom(16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: UIUtils.borderRadiusAll(),
                          ),
                          padding: UIUtils.paddingAll(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.serviceName),
                              UIUtils.heightSpace(4),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.calendarIcon,
                                    width: 18,
                                  ),
                                  UIUtils.widthSpace(8),
                                  Text(e.date)
                                ],
                              ),
                              UIUtils.heightSpace(4),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.clockIcon,
                                    width: 18,
                                  ),
                                  UIUtils.widthSpace(8),
                                  Text(e.time)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
