void main() {
  int score = 85;
  String grade;
  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else {
    grade = 'F';
  }
  print('Score: $score, Grade: $grade');

  Object shape = (10, 20);
  switch (shape) {
    case (int w, int h):
      print('Rectangle $w x $h');
      break;
    default:
      print('Unknown shape');
  }

  List<String> items = ['A', 'B', 'C'];
  
  for (int i = 0; i < items.length; i++) {
    print(items[i]);
  }

  for (String item in items) {
    print(item);
  }

  int counter = 1;
  while (counter <= 3) {
    print(counter);
    counter++;
  }

  int d = 10;
  do {
    print('Executed at least once, d = $d');
  } while (d < 5);

  for (int k = 1; k <= 10; k++) {
    if (k == 5) continue;
    if (k == 8) break;
    print(k);
  }

  int speed = 50;
  assert(speed <= 100, "Speed limit exceeded");
  print('Speed is within limits: $speed');
}
