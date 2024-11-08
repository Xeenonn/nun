import 'dart:io';

double calculateDiscount({required double price, required double discount}) {
  return price * (discount / 100);
}

double convertToRiel({required double amount, required double conversionRate}) {
  return amount * conversionRate;
}

void main() {
  List<Map<String, dynamic>> products = [];
  double grandTotal = 0.0;
  int nextId = 1;

  while (true) {
    stdout.write('Enter product name: ');
    String name = stdin.readLineSync()!;

    stdout.write('Enter quantity: ');
    int quantity = int.parse(stdin.readLineSync()!);

    stdout.write('Enter price: ');
    double price = double.parse(stdin.readLineSync()!);

    stdout.write('Enter discount: ');
    double discount = double.parse(stdin.readLineSync()!);

    products.add({
      'id': nextId++,
      'name': name,
      'quantity': quantity,
      'price': price,
      'discount': discount,
    });

    stdout.write('Do you want to enter another product? (y/n): ');
    String? response = stdin.readLineSync();
    if (response?.toLowerCase() != 'y') {
      break;
    }
  }

  print('\n<<=============>> Product List <<=============>>');
  print('ID     Name    QTY     Price     Discount      Sub Total');
  for (var product in products) {
    int id = product['id'] as int;
    String productName = product['name'] as String;
    int quantity = product['quantity'] as int;
    double price = product['price'] as double;
    double discount = product['discount'] as double;

    double discountAmount = calculateDiscount(price: price, discount: discount);
    double subTotal = (price - discountAmount) * quantity;
    grandTotal += subTotal;

    print('${id.toString().padRight(4)}   ${productName.padRight(7)}  ${quantity.toString().padRight(7)} ${price.toStringAsFixed(2).padRight(7)}  ${discount.toStringAsFixed(2).padRight(7)} ${subTotal.toStringAsFixed(2).padRight(7)}');
  }

  double conversionRate = 4100;
  double grandTotalRiel = convertToRiel(amount: grandTotal, conversionRate: conversionRate);

  print("<<---------------------------------------------->>");
  print("Grand Total (\$): ${grandTotal.toStringAsFixed(2)} \$");
  print("Grand Total (Riel): ${grandTotalRiel.toStringAsFixed(2)} Riel");
}
