void main() {
  // 1. if / else if / else

  int score = 85;
  String grade;

  if (score >= 90) {
    grade = "A";
  } else if (score >= 75) {
    grade = "B";
  } else if (score >= 50) {
    grade = "C";
  } else {
    grade = "F";
  }

  print("Grade: $grade");

  // 2. switch Statement & Switch Patterns (Dart 3+)

  Object shape = (10, 20);

  String shapeDescription = switch (shape) {
    (int w, int h) => 'Rectangle $w x $h',
    _ => 'Unknown shape',
  };

  print(shapeDescription);

  // 3. Loops

  List<String> items = ['A', 'B', 'C'];

  // Standard for loop
  for (int i = 0; i < items.length; i++) {
    print(items[i]);
  }

  // for-in loop
  for (String item in items) {
    print(item);
  }

  // while loop
  int number = 1;

  while (number <= 3) {
    print(number);
    number++;
  }

  // do-while loop
  int count = 1;

  do {
    print("Do-while: $count");
    count++;
  } while (count <= 3);

  // 4. break, continue, assert

  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      continue;
    }

    if (i == 8) {
      break;
    }

    print("Loop: $i");
  }

  int speed = 50;

  assert(speed <= 100, "Speed limit exceeded");
}