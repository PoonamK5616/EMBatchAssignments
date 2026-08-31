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
