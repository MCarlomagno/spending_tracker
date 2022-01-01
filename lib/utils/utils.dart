class Utils {
  static amountFormatString(double amount, String currency) {
    return currency + ' ' + amount.toStringAsFixed(0);
  }
}