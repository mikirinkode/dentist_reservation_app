import 'package:dentistreservation/app/data/provider/dummy_data.dart';
import 'package:dentistreservation/core/theme/app_color.dart';
import 'package:dentistreservation/core/utils/ui_utils.dart';
import 'package:dentistreservation/core/values/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../booking/booking_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIUtils.heightSpace(16),
            Padding(
              padding: UIUtils.paddingHorizontal(16),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: UIUtils.borderRadiusAll()),
                padding: UIUtils.paddingAll(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      Images.defaultProfile,
                      width: 50,
                    ),
                    Expanded(
                      child: Padding(
                        padding: UIUtils.paddingHorizontal(8),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Selamat Pagi"),
                            Text("Mau periksa gigi?"),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          Images.notificationIcon,
                          width: 24,
                        ))
                  ],
                ),
              ),
            ),
            UIUtils.heightSpace(24),
            Padding(
              padding: UIUtils.paddingHorizontal(16),
              child: const Text("Pengumuman"),
            ),
            UIUtils.heightSpace(8),
            Padding(
              padding: UIUtils.paddingHorizontal(16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BookingView(selectedService: "",);
                    }));
                  },
                  child: Image.asset(Images.sampleAnnouncementBanner)),
            ),
            UIUtils.heightSpace(24),
            Padding(
              padding: UIUtils.paddingHorizontal(16),
              child: const Text("Layanan"),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: UIUtils.paddingFromLTRB(
                  left: 16, top: 8, right: 16, bottom: 0),
              child: Row(
                children: DummyData.dentistServices
                    .map((e) => Padding(
                          padding: UIUtils.paddingRight(16),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return BookingView(selectedService: e.name,);
                                  }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: UIUtils.borderRadiusAll()),
                              padding: UIUtils.paddingAll(16),
                              child: Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                          color: AppColor.primary50,
                                          shape: BoxShape.circle),
                                      padding: UIUtils.paddingAll(16),
                                      child: Image.asset(
                                        e.iconPath,
                                        width: 32,
                                        color: AppColor.primary500,
                                      )),
                                  UIUtils.heightSpace(8),
                                  Text(e.name)
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            UIUtils.heightSpace(24),
            Padding(
              padding: UIUtils.paddingHorizontal(16),
              child: const Text("Lokasi"),
            ),
            UIUtils.heightSpace(8),
            Padding(
                padding: UIUtils.paddingHorizontal(16),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: UIUtils.borderRadiusAll()),
                    padding: UIUtils.paddingAll(8),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.doctor,
                          width: 100,
                        ),
                        UIUtils.widthSpace(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Praktek Dokter Gigi Lampung"),
                              UIUtils.heightSpace(4),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.stethoscopeIcon,
                                    width: 18,
                                  ),
                                  UIUtils.widthSpace(8),
                                  const Expanded(
                                      child:
                                          Text("drg. Arihka Ayif Ul, Sp.KG")),
                                ],
                              ),
                              UIUtils.heightSpace(4),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.markerIcon,
                                    width: 18,
                                  ),
                                  UIUtils.widthSpace(8),
                                  const Expanded(
                                      child: Text("Jl. Kesehatan no 123")),
                                ],
                              ),
                              UIUtils.heightSpace(4),
                              GestureDetector(
                                onTap: () {
                                  // TODO: UNHANDLED ON TAP
                                },
                                child: Text(
                                  "Buka Google Map >",
                                  style: TextStyle(color: AppColor.primary500),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
