Future<String> catchOrder() => Future.delayed(
    Duration(milliseconds: 5000), () => 'Take my order!!!');

Future<String> createOrder() async {
  var order = await catchOrder();
  return 'Order is: $order';
}

Future<void> main() async{
  print("Order's sent");
  print(await createOrder());
}
