class Member {
  String name;
  String memberId;
  DateTime joinDate;

  // Default constructor
  Member(this.name, this.memberId, this.joinDate);

  // Named constructor
  Member.newMember(this.name, this.memberId) : joinDate = DateTime.now();

  void displayMember() {
    print('Member: $name, ID: $memberId, Joined: ${joinDate.year}-${joinDate.month}-${joinDate.day}');
  }
}
