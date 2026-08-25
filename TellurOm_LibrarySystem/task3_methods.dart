class LibraryUtils {
  // Method to calculate late fees
  static double calculateLateFee(int daysLate) {
    const double feePerDay = 2.5;
    return daysLate * feePerDay;
  }

  // Method to check if an item is antique (older than 50 years)
  static bool isAntique(int yearPublished) {
    int currentYear = DateTime.now().year;
    return (currentYear - yearPublished) > 50;
  }
}
