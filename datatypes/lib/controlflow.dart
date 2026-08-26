void main() {
  // 1. if / else
  int score = 85;
  String grade = score >= 90 ? 'A' : (score >= 80 ? 'B' : (score >= 70 ? 'C' : 'F'));
  print('Score: $score, Grade: $grade');

  // 2. switch Statement & Patterns
  Object shape = (10, 20); 
  switch (shape) {
    case (int w, int h):
      print('Rectangle $w x $h');
      break;
    default:
      print('Unknown shape');
  }

  // 3. Loops
  List<String> items = ['A', 'B', 'C'];
  for (int i = 0; i < items.length; i++) print(items[i]);
  for (var item in items) print(item);
  
  int count = 1;
  while (count <= 3) print(count++);

  int doCount = 1;
  do { print(doCount++); } while (doCount <= 3);

  // 4. break, continue, assert
  for (int i = 1; i <= 10; i++) {
    if (i == 5) continue;
    if (i == 8) break;
    print(i);
  }

  assert(50 <= 100, "Speed limit exceeded");
}