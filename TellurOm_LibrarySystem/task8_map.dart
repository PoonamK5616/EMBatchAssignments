import 'task2_constructor.dart';

class MapDemonstration {
  void runDemonstration() {
    print('\n--- Task 8: Map Demonstration ---');
    Map<String, Member> membersMap = {
      'M001': Member('Alice', 'M001', DateTime(2022, 1, 15)),
      'M002': Member.newMember('Bob', 'M002'),
    };

    print('Iterating over a Map of members:');
    membersMap.forEach((id, member) {
      print('Key (ID): $id -> Value (Member Name): ${member.name}');
    });

    // Add item
    membersMap['M003'] = Member.newMember('Charlie', 'M003');
    print('Total members in map after adding: ${membersMap.length}');
  }
}
