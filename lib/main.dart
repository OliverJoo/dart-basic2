main() {
  bool? isTrue = true;
  isTrue = false;

  if (isTrue) {
    print("True");
  } else {
    print("False");
  }

  List<String> strList = ["str", "list", "add", "Nothing"];
  strList.add("NoNo");

  for (String str in strList) {
    print(str);
  }
}
