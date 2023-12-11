import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee({
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> map) {
    return Employee(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }
}

class Department {
  String name;
  Employee leader;

  Department({
    required this.name,
    required this.leader,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'leader': leader,
    };
  }

  factory Department.fromJson(Map<String, dynamic> map) {
    return Department(
      name: map['name'] as String,
      leader: map['leader'] as Employee,
    );
  }

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }
}

void main() {
  final employee = Employee(name: '홍길동', age: 41);
  final department = Department(name: '총무부', leader: employee);

  print(department.toString());
  File('department.txt').writeAsStringSync(jsonEncode(department.toJson()));

  final employee1 = Employee(name: '김두한', age: 40);
  final department1 = Department(name: '개발팀', leader: employee1);
  final employee2 = Employee(name: '홍길반', age: 27);
  final department2 = Department(name: '비서실', leader: employee2);
  final employee3 = Employee(name: '홍두깨', age: 35);
  final department3 = Department(name: '보안팀', leader: employee3);

  final List<Department> deptList = [department, department1, department2, department3];
  print(deptList.toString());
  for (Department department in deptList) {
    File('dept_list.txt').writeAsStringSync(jsonEncode(department.toJson()),
        mode: FileMode.append);
  }

  // print(jsonDecode(File('department.txt').readAsStringSync()));
}
