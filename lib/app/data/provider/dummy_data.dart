import 'package:dentistreservation/core/values/images.dart';

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
}