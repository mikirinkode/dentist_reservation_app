import 'package:dentistreservation/app/data/provider/dummy_data.dart';
import 'package:dentistreservation/core/utils/ui_utils.dart';
import 'package:dentistreservation/core/values/images.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: UIUtils.paddingAll(16),
        children: DummyData.historyList
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
                            Image.asset(Images.calendarIcon, width: 18,),
                            UIUtils.widthSpace(8),
                            Text(e.date)
                          ],
                        ),
                        UIUtils.heightSpace(4),
                        Row(
                          children: [
                            Image.asset(Images.clockIcon, width: 18,),
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
