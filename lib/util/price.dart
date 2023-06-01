import 'package:intl/intl.dart';

String currency(int price) {
  return _formatPrice(price);
}
String _formatPrice(int price) {
  final formatter = NumberFormat.simpleCurrency();
  return formatter.format(price / 100); // Assuming the price is in cents, divide by 100 for dollars
}