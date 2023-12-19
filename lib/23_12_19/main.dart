import 'dart:io';

import 'package:untitled/23_12_19/management/book_management.dart';
import 'package:untitled/23_12_19/management/library_management.dart';
import 'package:untitled/23_12_19/model/member_info.dart';

import 'management/member_management.dart';
import 'model/book_basic.dart';

final bool continueProgram = true;
final bool stopProgram = false;
final String wrongInputMsg = 'Please, input the proper number between ';

// test dummy to use only here
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

void main() {
  var libraryMgmt = LibraryManagementImpl.instance;
  var memberMgmt = MemberManagementImpl.instance;
  var bookMgmt = BookManagementImpl.instance;
  bool flag = continueProgram;

  print(LibraryManagementImpl.initMsg);

  do {
    print(LibraryManagementImpl.libMgmtMsg);
    int command = inputParameter();
    if (command == LibraryManagementImpl.managingMemberInfo ||
        command == LibraryManagementImpl.managingBookInfo ||
        command == LibraryManagementImpl.managingBookCheckout) {
      flag = stopProgram;
      switch (command) {
        case LibraryManagementImpl.managingMemberInfo:
          flag = memberMgmtProcess(memberMgmt, continueProgram);
          break;
        case LibraryManagementImpl.managingBookInfo:
          flag = bookMgmtProcess(bookMgmt, continueProgram);
          break;
        case LibraryManagementImpl.managingBookCheckout:
          flag = bookCheckoutProcess(libraryMgmt, continueProgram);
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

bool bookCheckoutProcess(LibraryManagementImpl libraryMgmt, bool flag) {
  do {
    print(LibraryManagementImpl.bookCheckoutMsg);
    int command = inputParameter();

    if (command == LibraryManagementImpl.backFromBookCheckout) {
      flag = stopProgram;
    } else if (0 < command && command < 4) {
      flag = continueProgram;
      switch (command) {
        case LibraryManagementImpl.borrowingBook:
          libraryMgmt.borrowBook(memberInfo, bookInfo);
          break;
        case LibraryManagementImpl.returningBook:
          libraryMgmt.returnBook(memberInfo, bookInfo);
          break;
        case LibraryManagementImpl.extendingBorrowingTerm:
          libraryMgmt.termExtension(memberInfo, bookInfo);
          break;
      }
    } else {
      print(wrongInputMsg + MemberManagementImpl.memberCommandRange);
      print('$command');
    }
  } while (flag);

  return continueProgram;
}

// Member management process
bool memberMgmtProcess(MemberManagementImpl memberMgmt, bool flag) {
  do {
    print(MemberManagementImpl.memberMsg);
    int command = inputParameter();

    if (command == MemberManagementImpl.backFromMember) {
      flag = stopProgram;
    } else if (0 < command && command < 6) {
      flag = continueProgram;
      switch (command) {
        case MemberManagementImpl.searchMember:
          memberMgmt.searchInfo(0);
          break;
        case MemberManagementImpl.registerMember:
          memberMgmt.addInfo(memberInfo);
          break;
        case MemberManagementImpl.modifyMemberInfo:
          memberMgmt.modifyInfo(memberInfo, 1);
          break;
        case MemberManagementImpl.deleteMember:
          memberMgmt.delDataInfo(0);
          break;
        case MemberManagementImpl.cancelDeleteMember:
          memberMgmt.cancelDelDataInfo(0);
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
  do {
    print(BookManagementImpl.bookMsg);
    int command = inputParameter();

    if (command == BookManagementImpl.backFromBook) {
      flag = stopProgram;
    } else if (0 < command && command < 4) {
      flag = continueProgram;
      switch (command) {
        case BookManagementImpl.searchBook:
          bookMgmt.searchInfo(0);
          break;
        case BookManagementImpl.registerBook:
          bookMgmt.addInfo(bookInfo);
          break;
        case BookManagementImpl.modifyBookInfo:
          bookMgmt.modifyInfo(bookInfo, 0);
          break;
      }
    } else {
      print(wrongInputMsg + BookManagementImpl.bookCommandRange);
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
  List<String> strList = oneLine!.trim().split(' ').toList();

  for (String str in strList) {
    intList.add(int.parse(str));
  }

  return intList;
}
