import 'package:untitled/23_12_19/model/book_basic.dart';
import 'package:untitled/23_12_19/model/member_info.dart';

abstract interface class LibraryManagement {
  bool borrowBook(MemberInfo memberInfo, BookInfo bookInfo);

  bool returnBook(MemberInfo memberInfo, BookInfo bookInfo);

  bool termExtension(MemberInfo memberInfo, BookInfo bookInfo);
}

class LibraryManagementImpl implements LibraryManagement {
  List<BookInfo> bookInfo = [];
  List<MemberInfo> memberInfo = [];

  static const managingMemberInfo = 1;
  static const managingBookInfo = 2;
  static const managingBookCheckout = 3;
  static const quitLibraryProgram = 4;

  static const backFromBookCheckout = 0;
  static const borrowingBook = 1;
  static const returningBook = 2;
  static const extendingBorrowingTerm = 3;


  static const String initMsg =
      '도서 관리 프로그램을 시작합니다. 원하시는 항목의 숫자를 입력하시고 엔터를 입력해주세요~';
  static const String finalMsg = '도서 관리 프로그램을 종료합니다.';
  static const String libMgmtMsg = '1.회원관리\t2.도서관리\t3.도서대출관리\t4.종료';
  static const String bookCheckoutMsg = '0.뒤로\t1.도서대출\t2.도서반납\t3.대출기간연장';
  static const String libraryCommandRange = '1 and 4!\n';
  static const String bookCheckoutCommandRange = '1 and 4!\n';

  static LibraryManagementImpl? _instance;

  LibraryManagementImpl._();

  static LibraryManagementImpl get instance {
    _instance ??= LibraryManagementImpl._();
    return _instance!;
  }

  @override
  bool borrowBook(MemberInfo memberInfo, BookInfo bookInfo) {
    print('LibraryManagementImpl borrowBook');
    return true;
  }

  @override
  bool returnBook(MemberInfo memberInfo, BookInfo bookInfo) {
    print('LibraryManagementImpl returnBook');
    return true;
  }

  @override
  bool termExtension(MemberInfo memberInfo, BookInfo bookInfo) {
    print('LibraryManagementImpl termExtension');
    return true;
  }
}
