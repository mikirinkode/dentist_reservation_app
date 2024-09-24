class TimeUtils {
  TimeUtils._();

  static int getCurrentMonth() {
    DateTime now = DateTime.now();
    return now.month;
  }

  static String getMonthName(int month) {
    List<String> monthNames = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    return monthNames[month - 1];
  }

  static String getCurrentMonthName() {
    return getMonthName(getCurrentMonth());
  }

  static int getCurrentYear() {
    DateTime now = DateTime.now();
    return now.year;
  }

  static List<int> getAvailableDateList(
      {required int month, required int year}) {
    DateTime now = DateTime.now();

    int length = 31;
    int incrementBy = 1;

    int currentMonth = now.month;

    if (month % 2 == 0) {
      if (month == 2) {
        if (year % 4 == 0) {
          length = 29;
        } else {
          length = 28;
        }
      } else {
        length = 30;
      }
    }

    if (month == currentMonth) {
      incrementBy = now.day;
      length = length - incrementBy;
    }

    return List.generate(length, (index) => index + incrementBy);
  }
}
