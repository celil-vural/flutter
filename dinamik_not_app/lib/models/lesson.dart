class Lesson {
  final String name;
  final double letterValue;
  final double krediValue;
  Lesson(
      {required this.name,
      required this.letterValue,
      required this.krediValue});
  @override
  String toString() {
    // TODO: implement toString
    return "Name:$name\nLetter:$letterValue\nKredi:$krediValue";
  }
}
