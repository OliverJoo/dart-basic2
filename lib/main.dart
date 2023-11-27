main() {
  bool? isTrue = true;
  isTrue = false;

  if (isTrue) {
    print("True");
  } else {
    print("False");
  }

  List<String> str_list = ["str", "fsad"];
  str_list.add("NoNo");

  for (String str in str_list) {
    print(str);
  }
}
