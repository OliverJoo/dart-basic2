import 'package:intl/intl.dart';

import '../management/management.dart';
class MemberInfo implements Data {
  static int idNumber = 0;
  int? id;
  String name;
  String address;
  String gender;
  String? regDate;
  String phone;
  DateTime birthday;
  int? age;
  bool? deleteYN;

  MemberInfo({
    required this.name,
    required this.address,
    required this.gender,
    required this.phone,
    required this.birthday,
  })  : id = idNumber++,
        regDate = DateFormat('yyyy-MM-dd').format(DateTime.now()),
        age = DateTime.now().difference(birthday).inDays ~/ 365,
        deleteYN = false;

  @override
  String toString() {
    return 'MemberInfo{id: $id, name: $name, address: $address, gender: $gender, '
        'regDate: $regDate, phone: $phone, birthday: $birthday, _age: $age, '
        'deleteYN: $deleteYN}';
  }
}

void main() {
  final memberInfo = MemberInfo(
      name: 'name',
      address: 'addr',
      gender: 'Male',
      phone: '010-1111-2222',
      birthday: DateTime.parse('2000-10-01'));

  print(memberInfo.toString());
}
