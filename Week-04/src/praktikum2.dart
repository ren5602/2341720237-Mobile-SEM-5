void main() {
  // Langkah 1
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

  // Langkah 3:
  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = <String>{}; // Creates a map, not a set.

  // .add
  names2.add('Nur Aziz');
  names2.add('2341720237');

  // .addAll
  names3.addAll(names2);

  print("names1 : $names1");
  print("names2 : $names2");
  print("names3 : $names3");
}
