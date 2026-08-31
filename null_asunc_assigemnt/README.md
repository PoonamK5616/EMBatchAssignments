# Assignment 2: Null-Safe Async Fetcher in Dart

**Author / Developer:** Ashutosh Rai  
**Course / Module:** Dart Fundamentals & Asynchronous Programming  
**Topic:** Asynchronous Data Fetching, Null Safety, Error Handling & Future Simulation  
**Repository:** [Assignment-2-Null-Safe-Async-Fetcher](https://github.com/Ashurai84)  

---

## 📌 Executive Summary

This project implements a lightweight, robust, and null-safe asynchronous data fetcher in Dart (`main.dart`). It simulates real-world API communication using `Future`, `async`, and `await`, while handling non-blocking network delays, missing data (`null`), and runtime exceptions (`try-catch`).

---

## 🚀 Key Features

1. **Asynchronous Operations (`Future`, `async`, `await`)**:
   - Simulates real-time network request latency using `Future.delayed(Duration(seconds: 1))`.
   - Prevents blocking the main execution thread.

2. **Sound Null Safety (`String?`, Null-Aware Checks)**:
   - Uses nullable return type `Future<String?>` to signify that a user record may or may not exist.
   - Handles missing records cleanly with explicit `if (name == null)` checks.

3. **Error Handling (`throw` & `try-catch`)**:
   - Throws clear exceptions for invalid input values (e.g., ID `< 1`).
   - Catches exceptions gracefully in the consumer function without crashing the program.

4. **Clean & Low-Level Code Structure**:
   - Free of complex external dependencies.
   - Built using fundamental Dart control flow and keyword primitives.

---

## 📁 Project Structure

```text
flutter/
├── main.dart             # Main Dart source file containing async fetcher & tests
├── README.md             # Project report, test cases, and execution screenshots
└── WHAT_YOU_LEARNED.md   # Comprehensive reflection report (2+ pages)
```

---

## 💻 Source Code (`main.dart`)

```dart
Future<String?> fetchUserName(int id) async {
  await Future.delayed(Duration(seconds: 1));

  if (id < 1) {
    throw Exception('ID must be 1 or higher');
  }

  if (id == 1) {
    return 'Rahul Sharma';
  } else if (id == 2) {
    return 'Priya Patel';
  } else if (id == 3) {
    return 'Amit Kumar';
  } else {
    return null;
  }
}

Future<void> displayUser(int id) async {
  print('Fetching ID: $id...');

  try {
    String? name = await fetchUserName(id);

    if (name == null) {
      print('Result: User not found.\n');
      return;
    }

    print('User Name: $name\n');
  } catch (error) {
    print('Error: $error\n');
  }
}

void main() async {
  await displayUser(1);
  await displayUser(2);
  await displayUser(3);
  await displayUser(4);
  await displayUser(0);
}
```

---

## 🧪 Test Cases & Verification Matrix

The test suite in `main()` covers all valid, missing, and invalid edge cases:

| Test Case | Input (`id`) | Expected Outcome | Result Status |
| :--- | :---: | :--- | :---: |
| **Case 1: Valid Record 1** | `1` | Returns `'Rahul Sharma'` | ✅ PASS |
| **Case 2: Valid Record 2** | `2` | Returns `'Priya Patel'` | ✅ PASS |
| **Case 3: Valid Record 3** | `3` | Returns `'Amit Kumar'` | ✅ PASS |
| **Case 4: Non-existent User** | `4` | Returns `null` $\rightarrow$ Displays `"User not found."` | ✅ PASS |
| **Case 5: Invalid ID (Error)** | `0` | Throws `Exception` $\rightarrow$ Caught by `try-catch` | ✅ PASS |

---

## 🖥️ Terminal Execution Output & Verification

### Running the Program:
```bash
dart main.dart
```

### Complete Console Output:
```text
Fetching ID: 1...
User Name: Rahul Sharma

Fetching ID: 2...
User Name: Priya Patel

Fetching ID: 3...
User Name: Amit Kumar

Fetching ID: 4...
Result: User not found.

Fetching ID: 0...
Error: Exception: ID must be 1 or higher
```

---

## 📸 Step-by-Step Screenshots / Visual Guide

### Step 1: Writing and Verifying `fetchUserName` Async Method
> *Implementation of `Future<String?>`, `await Future.delayed`, validation check `id < 1`, and returning nullable String.*

### Step 2: Implementing Null-Safe Consumer Function `displayUser`
> *Usage of `try-catch` block, `String?` nullable variable, and safe `null` condition handling.*

### Step 3: Executing Test Cases in Terminal
> *Full run demonstrating successful data retrieval, null handling for missing record (ID: 4), and error catching for invalid input (ID: 0).*

---

## 🎯 Conclusion

This assignment successfully demonstrates Dart's asynchronous programming model and sound null safety system. By combining `Future`, `async/await`, and `try-catch` error handling, the application delivers a resilient workflow capable of handling network latencies, missing records, and invalid runtime inputs.
