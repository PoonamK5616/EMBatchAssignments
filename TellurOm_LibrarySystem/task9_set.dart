class SetDemonstration {
  void runDemonstration() {
    print('\n--- Task 9: Set Demonstration ---');
    Set<String> categories = {'Fiction', 'Non-Fiction', 'Science', 'History'};
    
    print('Categories Set: $categories');
    
    // Add existing item to show Sets store unique elements
    categories.add('Science');
    print('Categories after trying to add duplicate "Science": $categories');
    
    // Add new item
    categories.add('Biography');
    print('Categories after adding "Biography": $categories');
  }
}
