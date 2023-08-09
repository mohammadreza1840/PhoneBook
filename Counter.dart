class Counter {
  static int count = 0;

  static void add() {
    count++;
  }

  static void mines() {
    count--;
  }

  static void printCount() => print(count);
}
