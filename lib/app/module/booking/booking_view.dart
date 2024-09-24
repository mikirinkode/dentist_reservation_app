import 'package:dentistreservation/app/data/provider/dummy_data.dart';
import 'package:dentistreservation/core/theme/app_button_style.dart';
import 'package:dentistreservation/core/theme/app_color.dart';
import 'package:dentistreservation/core/utils/time_utils.dart';
import 'package:dentistreservation/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  // DATE
  int _currentMonth = TimeUtils.getCurrentMonth();
  int _currentYear = TimeUtils.getCurrentYear();
  int _selectedMonth = TimeUtils.getCurrentMonth();
  String _selectedMonthName = TimeUtils.getCurrentMonthName();
  int _selectedYear = TimeUtils.getCurrentYear();
  bool _isNextMonthValid = true;
  bool _isPrevMonthValid = false;
  List<int> _availableDates = TimeUtils.getAvailableDateList(
      month: TimeUtils.getCurrentMonth(), year: TimeUtils.getCurrentYear());
  int _selectedDate = 0;

  // TIME
  String _selectedTime = "";

  //
  String _inputtedDiagnose = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservasi"),
      ),
      bottomNavigationBar: Padding(
        padding: UIUtils.paddingAll(16),
        child: ElevatedButton(
          style: AppButtonStyle.filledPrimary,
          onPressed: (_selectedDate == 0 || _selectedTime == "" || _inputtedDiagnose == "") ? null : () {},
          child: const Text("Lanjut"),
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
                    Text("Pilih tanggal"),
                    UIUtils.heightSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_isPrevMonthValid) {
                              setState(() {
                                // update month and year
                                if (_selectedMonth - 1 == 0) {
                                  _selectedMonth = 12;
                                  _selectedYear = _selectedYear - 1;
                                } else {
                                  _selectedMonth = _selectedMonth - 1;
                                }

                                // update view
                                _selectedMonthName =
                                    TimeUtils.getMonthName(_selectedMonth);
                                _isPrevMonthValid =
                                    _selectedMonth > _currentMonth ||
                                        _selectedYear > _currentYear;
                                _availableDates =
                                    TimeUtils.getAvailableDateList(
                                        month: _selectedMonth,
                                        year: _selectedYear);
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: (_isPrevMonthValid)
                                    ? AppColor.neutral700
                                    : AppColor.neutral50,
                                borderRadius: UIUtils.borderRadiusSmall()),
                            padding: UIUtils.paddingAll(4),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 16,
                              color: (_isPrevMonthValid)
                                  ? Colors.white
                                  : AppColor.neutral700,
                            ),
                          ),
                        ),
                        Text("$_selectedMonthName $_selectedYear"),
                        GestureDetector(
                          onTap: () {
                            if (_isNextMonthValid) {
                              setState(() {
                                // update month and year
                                if (_selectedMonth + 1 == 13) {
                                  _selectedMonth = 1;
                                  _selectedYear = _selectedYear + 1;
                                } else {
                                  _selectedMonth = _selectedMonth + 1;
                                }

                                // update view
                                _selectedMonthName =
                                    TimeUtils.getMonthName(_selectedMonth);
                                _isPrevMonthValid =
                                    _selectedMonth > _currentMonth ||
                                        _selectedYear > _currentYear;
                                _availableDates =
                                    TimeUtils.getAvailableDateList(
                                        month: _selectedMonth,
                                        year: _selectedYear);
                              });
                            }
                            debugPrint(
                                "selected month = $_selectedMonthName, selected year: $_selectedYear");
                            debugPrint(
                                "_isPrevMonthValid = $_isPrevMonthValid");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: (_isNextMonthValid)
                                    ? AppColor.neutral700
                                    : AppColor.neutral50,
                                borderRadius: UIUtils.borderRadiusSmall()),
                            padding: UIUtils.paddingAll(4),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: (_isNextMonthValid)
                                  ? Colors.white
                                  : AppColor.neutral700,
                            ),
                          ),
                        )
                      ],
                    ),
                    UIUtils.heightSpace(16),
                    GridView.count(
                      crossAxisCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                        children: _availableDates
                            .map((e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedDate = e;
                                });
                              },
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                    color: (_selectedDate == e)
                                        ? AppColor.primary50
                                        : Colors.white,
                                    borderRadius:
                                    UIUtils.borderRadiusSmall(),
                                    border: Border.all(
                                        color: (_selectedDate == e)
                                            ? AppColor.primary500
                                            : AppColor.neutral700,
                                        width: 1)),
                                alignment: Alignment.center,
                                padding: UIUtils.paddingSymmetric(
                                    vertical: 8, horizontal: 8),
                                child: Text(
                                  e.toString(),
                                  style: TextStyle(
                                    color: (_selectedDate == e)
                                        ? AppColor.primary500
                                        : AppColor.neutral700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ))
                            .toList(),)
                  ],
                ),
              ),
            ),
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
                    const Text("Pilih jam"),
                    UIUtils.heightSpace(8),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: AppColor.primary100,
                                  border:
                                      Border.all(color: AppColor.primary500)),
                            ),
                            UIUtils.widthSpace(8),
                            const Text("Dipilih")
                          ],
                        ),
                        UIUtils.widthSpace(16),
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.neutral700)),
                            ),
                            UIUtils.widthSpace(8),
                            const Text("Kosong")
                          ],
                        ),
                        UIUtils.widthSpace(16),
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: AppColor.neutral200,
                              ),
                            ),
                            UIUtils.widthSpace(8),
                            const Text("Tidak tersedia")
                          ],
                        ),
                      ],
                    ),
                    UIUtils.heightSpace(16),
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2,
                      children: DummyData.availableTimeList
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedTime = e.time;
                                    debugPrint("selected time: $_selectedTime");
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: (_selectedTime == e.time)
                                          ? AppColor.primary50
                                          : e.isAvailable
                                              ? Colors.white
                                              : AppColor.neutral200,
                                      borderRadius: UIUtils.borderRadiusSmall(),
                                      border: Border.all(
                                          color: (_selectedTime == e.time)
                                              ? AppColor.primary500
                                              : e.isAvailable
                                                  ? AppColor.neutral700
                                                  : AppColor.neutral200,
                                          width: 1)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    e.time,
                                    style: TextStyle(
                                      color: (_selectedTime == e.time)
                                          ? AppColor.primary500
                                          : e.isAvailable
                                              ? AppColor.neutral700
                                              : AppColor.neutral500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
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
                    const Text("Detail periksa"),
                    UIUtils.heightSpace(16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Keluhan",
                        hintText: "Gigi terasa nyeri..",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Keluhan tidak boleh kosong";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          _inputtedDiagnose = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
