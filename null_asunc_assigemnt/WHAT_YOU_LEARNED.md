# Assignment 2: What I Learned & Reflection Report

**Student Name:** Ashutosh Rai  
**Course:** Basics of Dart & Asynchronous Programming  
**Assignment:** Assignment 2 - Null-Safe Async Fetcher  
**File Covered:** `main.dart`  

---

## 1. Introduction

Hi, I am Ashutosh Rai. In this assignment, I built a Dart program (`main.dart`) to understand how to fetch data asynchronously while handling `null` values and errors properly using Dart's null safety features.

Before this assignment, I was confused about how `async`, `await`, `Future`, and null safety work together in Dart. By writing, testing, and debugging this code line-by-line, I now have a solid understanding of how asynchronous data fetching works and how to write safe code that does not crash when data is missing or when an error happens.

Below is my detailed report explaining everything I learned from each line of code, the concepts I understood, and the exact problems I faced along with how I solved them.

---

## 2. What I Learned Directly From My Code

Here is the exact code I wrote in `main.dart`:

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

### 2.1 Understanding Line 1: `Future<String?> fetchUserName(int id) async`
When I first saw this line, it looked complicated. Here is how I broke it down:
- `Future`: I learned that when an operation takes time (like loading from a database or calling a server over the internet), it doesn't give a result immediately. It gives a `Future` promise.
- `String?`: The question mark `?` is Dart's null safety. It means this function can return a `String` (like `'Rahul Sharma'`), but if the user does not exist, it can also safely return `null`.
- `async`: I learned that adding `async` allows me to use the `await` keyword inside the function body. Without `async`, Dart gives an error if I try to use `await`.

---

### 2.2 Understanding Line 2: `await Future.delayed(Duration(seconds: 1));`
- In real apps, API calls take time to respond.
- I learned that `Future.delayed` simulates network delay for 1 second.
- By using `await`, Dart pauses this function for 1 second, but it does **not** freeze the computer or block other processes.

---

### 2.3 Understanding Lines 4–6: Input Validation & `throw Exception`
```dart
if (id < 1) {
  throw Exception('ID must be 1 or higher');
}
```
- In database systems, IDs start from 1 ($1, 2, 3\dots$).
- If someone passes `0` or a negative number like `-1`, it is invalid input.
- I learned that `throw Exception(...)` allows me to create an intentional error so that the program jumps straight into the `catch` block.

---

### 2.4 Understanding Lines 8–16: Returning Data vs Returning `null`
```dart
if (id == 1) {
  return 'Rahul Sharma';
} else if (id == 2) {
  return 'Priya Patel';
} else if (id == 3) {
  return 'Amit Kumar';
} else {
  return null;
}
```
- For IDs 1, 2, and 3, the function returns valid names.
- If someone passes ID 4 (or any other ID), it hits the `else` block and returns `null`.
- I learned that returning `null` is the proper way to say: *"The search finished successfully, but no user was found with that ID."*

---

### 2.5 Understanding Lines 19–35: `displayUser` and `try-catch`
```dart
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
```
In this function, I learned:
1. **`await fetchUserName(id)`**: Calls the async function and waits for the result before moving to the next line.
2. **`String? name`**: The variable must be nullable (`String?`) because `fetchUserName` can return `null`. If I declared `String name = ...`, Dart would give a compile error because regular `String` cannot hold `null`.
3. **`if (name == null)`**: This check prevents null errors. If `name` is null, it prints `"Result: User not found."` and exits early using `return`.
4. **`try-catch`**: When ID `0` throws an exception, the `catch (error)` block catches it smoothly and prints `"Error: Exception: ID must be 1 or higher"` without crashing the app.

---

### 2.6 Understanding `main()` and Sequential Execution
```dart
void main() async {
  await displayUser(1);
  await displayUser(2);
  await displayUser(3);
  await displayUser(4);
  await displayUser(0);
}
```
- I made `main()` an `async` function so I could use `await` on each `displayUser()` call.
- Because of `await`, test case 1 runs and finishes, then test case 2 runs, and so on. This keeps the terminal output clean and organized.

---

## 3. Problems and Difficulties I Faced & How I Solved Them

### Problem 1: Confusing `null` Return with `Exception`
- **What happened:** At first, I was confused whether a missing user (like ID 4) should throw an exception or return `null`.
- **How I fixed it:** I realized that searching for an ID that doesn't exist is normal behavior, so it should return `null`. Throwing an `Exception` should be reserved for actual invalid inputs like `0` or negative numbers.

### Problem 2: Understanding `Future<String?>` vs `Future<String>?`
- **What happened:** I didn't know where to put the question mark `?`.
- **How I fixed it:** 
  - `Future<String?>` means: The future always runs, but the value inside it can be a String or `null`.
  - `Future<String>?` means: The future object itself could be null.
  - For API calls, `Future<String?>` is the correct syntax.

### Problem 3: Output Printing Out of Order
- **What happened:** When I ran `main()` without `await` before `displayUser()`, all 5 requests started at the exact same time and their print statements mixed up in the console.
- **How I fixed it:** I added `async` to `main()` and `await` before each call. This made them execute one by one in order.

### Problem 4: Making Code Too Complex Initially
- **What happened:** Initially, I wrote a large program with multiple classes, constructors, and nested Maps which made it difficult for me to understand the core async fundamentals.
- **How I fixed it:** I simplified the code to focus purely on the core requirements: `Future`, `async`, `await`, `null safety`, and `try-catch` using simple Dart keywords.

---

## 4. Key Takeaways and Summary

1. **Null Safety Protects Apps:** By using `String?` and checking `if (name == null)`, Dart helps avoid runtime crashes.
2. **`async` and `await` are Essential:** They allow long operations (like network calls) to run smoothly without freezing the app.
3. **`try-catch` is Mandatory for Safety:** Any operation that might throw an error should be wrapped inside `try-catch` to handle failures gracefully.
4. **Simple Code is Better:** Writing simple, clean code with clear variable names makes debugging and understanding much easier.
