// 1. Positional Parameters

void introduce(String name, int age) {
  print("$name is $age years old.");
}


// 2. Optional Parameters

void greet(String name, [String? message]) {
  print("$name: ${message ?? "Hello"}");
}


// 3. Named Parameters

void studentInfo({
  required String name,
  required int age,
}) {
  print("Name: $name, Age: $age");
}


// 4. Default Parameters

void welcome({String name = "Guest"}) {
  print("Welcome, $name");
}


// 5. Arrow Function

int add(int a, int b) => a + b;


// 6. First-Class Function

void executeFunction(void Function() function) {
  function();
}

void sayHello() {
  print("Hello from a function!");
}


// 7. Lexical Scope

String globalMessage = "Global message";

void showScope() {
  String localMessage = "Local message";

  print(globalMessage);
  print(localMessage);
}


// 8. Lexical Closure

Function createCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}


void main() {
  // 1. Positional Parameters
  introduce("Parth", 21);

  // 2. Optional Parameters
  greet("Parth");
  greet("Parth", "Good morning");

  // 3. Named Parameters
  studentInfo(
    name: "Parth",
    age: 21,
  );

  // 4. Default Parameters
  welcome();
  welcome(name: "Parth");

  // 5. Arrow Function
  int result = add(10, 20);

  print("Addition: $result");

  // 6. First-Class Function
  var function = sayHello;

  function();

  executeFunction(sayHello);

  // 7. Anonymous Function
  List<int> numbers = [1, 2, 3];

  numbers.forEach((number) {
    print("Number: $number");
  });

  // 8. Lexical Scope
  showScope();

  // 9. Lexical Closure
  var counter = createCounter();

  print(counter()); // 1
  print(counter()); // 2
  print(counter()); // 3
}