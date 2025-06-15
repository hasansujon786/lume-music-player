String formatDuration(Duration? d) {
  if (d == null) {
    return '';
  }
  final min = d.inMinutes.remainder(60);
  final sec = d.inSeconds.remainder(60);
  return "${min.toString().padLeft(1, "0")}:${sec.toString().padLeft(2, "0")}";
}
