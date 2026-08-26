void main() {
  // 1. if / else if / else
  // TODO: Write code to assign grades (A, B, C, F) based on a score variable.
  int score = 88;
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
  print('Score: $score => Grade: $grade');

  // 2. switch Statement & Switch Patterns (Dart 3+)
  Object shape = (10, 20); // Record type
  // TODO: Implement switch expression using pattern matching for shape records:
  // case (int w, int h) => print('Rectangle $w x $h');
  switch (shape) {
    case (int w, int h):
      print('Rectangle $w x $h');
      break;
    default:
      print('Unknown shape');
  }

  // 3. Loops (for, for-in, while, do-while)
  List<String> items = ['A', 'B', 'C'];
  // TODO: Iterate over 'items' using standard for loop.
  print('--- Standard for loop ---');
  for (int i = 0; i < items.length; i++) {
    print('Item index $i: ${items[i]}');
  }

  // TODO: Iterate using for-in loop.
  print('--- For-in loop ---');
  for (var item in items) {
    print('Item: $item');
  }

  // TODO: Print numbers 1 to 3 using while loop.
  print('--- While loop ---');
  int whileCounter = 1;
  while (whileCounter <= 3) {
    print('While count: $whileCounter');
    whileCounter++;
  }

  // TODO: Execute a do-while loop at least once.
  print('--- Do-while loop ---');
  int doCounter = 1;
  do {
    print('Do-while count: $doCounter');
    doCounter++;
  } while (doCounter <= 1);

  // 4. break, continue, assert
  // TODO: Write a loop from 1 to 10. Skip 5 using 'continue', stop at 8 using 'break'.
  print('--- Loop with break and continue ---');
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      continue;
    }
    if (i == 8) {
      break;
    }
    print('Loop index: $i');
  }

  int speed = 50;
  // TODO: Add assert statement: assert(speed <= 100, "Speed limit exceeded");
  assert(speed <= 100, "Speed limit exceeded");
  print('Speed assert passed: $speed km/h');
}
