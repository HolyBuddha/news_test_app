extension DateTimeExtension on DateTime {
  String showDaysAgo() {
    if (DateTime.now().difference(this).inDays < 1) return 'Today';
    return '${DateTime.now().difference(this).inDays} day ago';
  }
}
