import 'Counter.dart';

void main(List<String> args) {

  Counter.add();
  Counter.add();
  Counter.add();
  Counter.add();

  print(Counter.count);

  Counter.add();
  Counter.add();
  Counter.add();
  Counter.add();
  Counter.add();
  print(Counter.count);
  Counter.printCount();
}
