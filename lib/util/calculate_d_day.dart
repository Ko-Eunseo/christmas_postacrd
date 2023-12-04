int calculateDday(String mmdd) {
  DateTime now = DateTime.now();
  List<String> parts = mmdd.split('/');

  if (parts.length != 2) {
    throw const FormatException('MM/DD 형식으로 입력해주세요.');
  }

  int? month = int.tryParse(parts[0]);
  int? day = int.tryParse(parts[1]);

  if (month == null || day == null) {
    throw const FormatException('올바르지 않은 입력입니다. MM/DD형식으로 입력해주세요.');
  }

  DateTime dDay = DateTime(now.year, month, day);
  Duration difference = dDay.difference(now);
  return difference.inDays;
}
