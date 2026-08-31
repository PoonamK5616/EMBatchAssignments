# Dart Fundamentals & OOP Assignment

A comprehensive collection of Dart programming exercises demonstrating core language features, Object-Oriented Programming (OOP) concepts, collection types, and a mini Library Management System.

---

## 📂 Project Structure

| File | Description | Topics Covered |
| :--- | :--- | :--- |
| [`main.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/main.dart) | Entry point running all tasks sequentially | Imports, Main Runner |
| [`task1_class.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task1_class.dart) | Task 1: Class and Object Basics | Classes, Properties, Instantiation |
| [`task2_constructor.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task2_constructor.dart) | Task 2: Constructors | Parameterized Constructors, `this` keyword |
| [`task3_methods.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task3_methods.dart) | Task 3: Methods inside Class | Instance Methods, State Mutation |
| [`task4_inheritance.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task4_inheritance.dart) | Task 4: Inheritance | `extends`, `super`, Method Overriding (`@override`) |
| [`task5_mixing.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task5_mixing.dart) | Task 5: Mixins | `mixin`, `with` keyword, Code Reuse |
| [`task6_interface.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task6_interface.dart) | Task 6: Interfaces | `abstract class`, `implements` keyword |
| [`task7_list.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task7_list.dart) | Task 7: List Collection & Loops | `List<T>`, Iteration, For-loops |
| [`task8_map.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task8_map.dart) | Task 8: Map Collection | `Map<K, V>`, Key-Value pairs, `forEach` |
| [`task9_set.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task9_set.dart) | Task 9: Set Collection | `Set<T>`, Uniqueness, Set operations |
| [`task10_libaray.dart`](file:///Users/ashutoshrai/Desktop/flutter%20/task10_libaray.dart) | Task 10: Library System | Complete Mini Project (OOP + Collections) |

---

## 🚀 Getting Started

### Prerequisites
Make sure you have the [Dart SDK](https://dart.dev/get-dart) or [Flutter SDK](https://flutter.dev) installed on your machine.

Verify installation:
```bash
dart --version
```

### Running All Tasks
To execute all assignment tasks in one go:
```bash
dart run main.dart
```

### Running Individual Tasks
You can also run any task file independently:
```bash
dart run task1_class.dart
dart run task2_constructor.dart
dart run task10_libaray.dart
```

---

## 📖 Task Details

### 1. Class and Object Basics (`task1_class.dart`)
Defines a basic `Book` class with default values and demonstrates creating an object instance and accessing its fields.

### 2. Constructors (`task2_constructor.dart`)
Introduces parameterized constructors in Dart with shorthand `this.title` syntax and instance methods.

### 3. Methods inside Class (`task3_methods.dart`)
Demonstrates mutating internal object states using methods (`borrowBook`, `returnBook`, `showInfo`).

### 4. Inheritance (`task4_inheritance.dart`)
Illustrates class inheritance where `Book` extends `Item`, calls `super()` constructor, and overrides methods.

### 5. Mixins (`task5_mixing.dart`)
Shows modular code reuse using `mixin LogInfo` and applying it with the `with` keyword.

### 6. Interfaces (`task6_interface.dart`)
Demonstrates Dart interfaces using `abstract class Borrowable` and the `implements` keyword in concrete classes.

### 7. List Collection & Loops (`task7_list.dart`)
Covers ordered collections using `List<String>`, adding elements, and traversing with for loops.

### 8. Map Collection (`task8_map.dart`)
Covers key-value data structures with `Map<String, String>` and iterating with `.forEach()`.

### 9. Set Collection (`task9_set.dart`)
Demonstrates unique unordered collections using `Set<String>`.

### 10. Mini Project: Library Management System (`task10_libaray.dart`)
Combines OOP and collections to create an interactive library system that manages book availability, borrowing, and returning.
