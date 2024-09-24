import 'package:dentistreservation/app/data/model/available_time.dart';
import 'package:dentistreservation/core/values/images.dart';

import '../model/booking_history.dart';
import '../model/dentist_service.dart';

class DummyData{
  DummyData._();

  static List<DentistService> dentistServices = [
    DentistService(name: "Cabut Gigi", iconPath: Images.toothIcon),
    DentistService(name: "Tambal Gigi", iconPath: Images.toothIcon),
    DentistService(name: "Pasang Gigi", iconPath: Images.toothIcon),
    DentistService(name: "Behel Gigi", iconPath: Images.toothIcon),
    DentistService(name: "Gigi Palsu", iconPath: Images.toothIcon),
    DentistService(name: "Putihin Gigi", iconPath: Images.toothIcon),
  ];

  static List<BookingHistory> historyList = [
    BookingHistory(serviceName: "Tambal Gigi", date: "Senin, 15 Mei 2024", time: "10:00"),
    BookingHistory(serviceName: "Perawatan Saraf Akar", date: "Senin, 13 Mei 2024", time: "10:00"),
    BookingHistory(serviceName: "Periksa Gigi", date: "Senin, 1 Mei 2024", time: "10:00"),
  ];

  static List<AvailableTime> availableTimeList = [
    AvailableTime(time: "09:00", isAvailable: false),
    AvailableTime(time: "10:00", isAvailable: true),
    AvailableTime(time: "11:00", isAvailable: true),
    AvailableTime(time: "12:00", isAvailable: true),
    AvailableTime(time: "13:00", isAvailable: true),
    AvailableTime(time: "14:00", isAvailable: true),
    AvailableTime(time: "15:00", isAvailable: false),
    AvailableTime(time: "16:00", isAvailable: true),
  ];
}