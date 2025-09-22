void main() {
  // Langkah 1
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  // langkah 3
  print("-----------------------------------");
  var list1 = [1, 2, null];
  print("list1: $list1");
  var nim = [2341720237];
  print("nim: $nim");
  var list3 = [0, ...?list1, ...?nim];
  print("list3: $list3");
  print("list3 length: ${list3.length}");

  // langkah 4
  print("-----------------------------------");
  List<String> nav(bool promoActive) {
    return ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  }

  print("jika true: ${nav(true)}");
  print("jika false: ${nav(false)}");

  // langkah 5
  print("-----------------------------------");
  List<String> nav2(String login) {
    return [
      'Home',
      'Furniture',
      'Plants',
      if (login case 'Manager') 'Inventory',
      if (login case 'Admin') 'Outlet',
      if (login case 'Customer') 'Cart',
    ];
  }

  print('login == Manager: ${nav2('Manager')}');
  print('login == Admin: ${nav2('Admin')}');
  print('login == Customer: ${nav2('Customer')}');

  // Langkah 6
  print("-----------------------------------");
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
