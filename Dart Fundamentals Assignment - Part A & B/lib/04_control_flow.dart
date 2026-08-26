void main() {
  // 1. if / else if / else
  int score = 85;

  if (score >= 90) {
    print('Grade A');
  } else if (score >= 75) {
    print('Grade B');
  } else if (score >= 50) {
    print('Grade C');
  } else {
    print('Grade F');
  }

  // 2. switch Statement & Switch Patterns (Dart 3+)
  Object shape = (10, 20);

  switch (shape) {
    case (int w, int h):
      print('Rectangle $w x $h');
  }

  // 3. Loops
  List<String> items = ['A', 'B', 'C'];

  for (int i = 0; i < items.length; i++) {
    print(items[i]);
  }

  for (String item in items) {
    print(item);
  }

  int number = 1;

  while (number <= 3) {
    print(number);
    number++;
  }

  int count = 1;

  do {
    print(count);
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

    print(i);
  }

  int speed = 50;

  assert(speed <= 100, "Speed limit exceeded");
}
