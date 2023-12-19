import 'dart:io';

import 'package:untitled/23_12_19/management/book_management.dart';
import 'package:untitled/23_12_19/management/library_management.dart';
import 'package:untitled/23_12_19/model/member_info.dart';

import 'management/member_management.dart';
import 'model/book_basic.dart';

final bool continueProgram = true;
final bool stopProgram = false;
final String wrongInputMsg = 'Please, input the proper number between ';

void main() {
  var libraryMgmt = LibraryManagementImpl.instance;
  var memberMgmt = MemberManagementImpl.instance;
  var bookMgmt = BookManagementImpl.instance;
  bool flag = continueProgram;

  final memberInfo = MemberInfo(
      name: 'name',
      address: 'addr',
      gender: 'Male',
      phone: '010-1111-2222',
      birthday: DateTime.parse('2000-10-01'));
  final bookInfo = BookInfo(
      title: 'title',
      author: 'author',
      status: 'status',
      publishedDate: '2013-12-12');

  print(LibraryManagementImpl.initMsg);

  do {
    print(LibraryManagementImpl.libMgmtMsg);
    int command = inputParameter();
    if (command == LibraryManagementImpl.managingMemberInfo ||
        command == LibraryManagementImpl.managingBookInfo) {
      flag = stopProgram;
      switch (command) {
        case LibraryManagementImpl.managingMemberInfo:
          flag = memberMgmtProcess(memberMgmt, continueProgram);
          break;
        case LibraryManagementImpl.managingBookInfo:
          flag = bookMgmtProcess(bookMgmt, continueProgram);
          break;
      }
    } else if (command == LibraryManagementImpl.quitLibraryProgram) {
      print(LibraryManagementImpl.finalMsg);
      return;
    } else {
      print(wrongInputMsg + LibraryManagementImpl.libraryCommandRange);
    }
  } while (flag);
}

// Member management process
bool memberMgmtProcess(MemberManagementImpl memberMgmt, bool flag) {
  do {
    print(MemberManagementImpl.memberMsg);
    int command = inputParameter();

    if (command == MemberManagementImpl.backwardFromMember) {
      flag = stopProgram;
    } else if (0 < command && command <= 5) {
      flag = continueProgram;
      switch (command) {
        case MemberManagementImpl.searchMember:
          print('$command MemberManagementImpl.searchMember');
          break;
        case MemberManagementImpl.registerMember:
          print('$command MemberManagementImpl.registerMember');
          break;
        case MemberManagementImpl.modifyMemberInfo:
          print('$command MemberManagementImpl.modifyMemberInfo');
          break;
        case MemberManagementImpl.deleteMember:
          print('$command MemberManagementImpl.deleteMember');
          break;
        case MemberManagementImpl.cancelDeleteMember:
          print('$command MemberManagementImpl.cancelDeleteMember');
          break;
      }
    } else {
      print(wrongInputMsg + MemberManagementImpl.memberCommandRange);
      print('$command');
    }
  } while (flag);

  return continueProgram;
}

// Book management process
bool bookMgmtProcess(BookManagementImpl bookMgmt, bool flag) {
// '0.뒤로\t1.도서조회\t2.도서등록\t3.도서수정';
  do {
    print(BookManagementImpl.bookMsg);
    int command = inputParameter();

    if (command == BookManagementImpl.backwardFromBook) {
      flag = stopProgram;
    } else if (0 < command && command <= 5) {
      flag = continueProgram;
      switch (command) {
        case BookManagementImpl.searchBook:
          print('$command BookManagementImpl.searchBook');
          break;
        case BookManagementImpl.registerBook:
          print('$command BookManagementImpl.registerBook');
          break;
        case BookManagementImpl.modifyBookInfo:
          print('$command BookManagementImpl.modifyBookInfo');
          break;
      }
    } else {
      print(wrongInputMsg + BookManagementImpl.bookCommandRange);
      print('$command');
    }
  } while (flag);

  return continueProgram;
}

// input 1 parameter
int inputParameter() {
  String? inputNumb = '';
  while (inputNumb == '' || inputNumb == null) {
    inputNumb = stdin.readLineSync();
  }
  return int.parse(inputNumb);
}

// input several parameters
List<int> inputParameters() {
  List<int>? intList = [];

  String? oneLine = stdin.readLineSync();
  List<String> strList = oneLine!.trim().split(' ').toList(); // don't use !

  for (String str in strList) {
    intList.add(int.parse(str));
  }

  return intList;
}
