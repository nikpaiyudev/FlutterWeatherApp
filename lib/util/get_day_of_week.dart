String getDayOfWeek(DateTime datetime) {
  List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  int dayIndex = datetime.weekday - 1;
  return daysOfWeek[dayIndex];
}
