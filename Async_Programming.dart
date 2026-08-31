// This function acts like getting data from a mock API
Future<String> getUserData() async {
  print("API: User data loading...");

  await Future.delayed(Duration(seconds: 2));

  return "Parth data received";
}

// This function shows null safety
String? getUserEmail(bool hasEmail) {
  if (hasEmail) {
    return "parth@gmail.com";
  }

  return null;
}

// This function checks the API data
Future<void> showUserData() async {
  try {
    print("\nAPI: Fetching user profile...");

    String user = await getUserData();

    print("User data: $user");

    String? email = getUserEmail(false);

    if (email != null) {
      print("Email: $email");
    } else {
      print("Email is not available");
    }
  } catch (error) {
    print("Error: $error");
  } finally {
    print("Data checking completed");
  }
}

void main() async {
  print("===== MOCK API DATA =====");

  await showUserData();

  print("\nProgram finished");
}