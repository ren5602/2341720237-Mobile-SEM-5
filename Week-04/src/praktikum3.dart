void main() {
  // langkah 1
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  print(gifts);
  print(nobleGases);

  print("-----------------------------------");
  // langkah 3
  var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Nur aziz';
  mhs1['nim'] = '2341720237';
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  mhs2[0] = 'Nur aziz';
  mhs2[1] = '2341720237';
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // print output
  print("gifts : $gifts");
  print("nobleGases : $nobleGases");
  print("mhs1 : $mhs1");
  print("mhs2 : $mhs2");
}
