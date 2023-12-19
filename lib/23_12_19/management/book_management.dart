import 'management.dart';

class BookManagementImpl implements Management {
  static BookManagementImpl? _instance;

  static const int backFromBook = 0;
  static const int searchBook = 1;
  static const int registerBook = 2;
  static const int modifyBookInfo = 3;

  static const String bookMsg = '0.뒤로\t1.도서조회\t2.도서등록\t3.도서수정';
  static const String bookCommandRange = '0 and 3!\n';


  BookManagementImpl._();

  static BookManagementImpl get instance {
    _instance ??= BookManagementImpl._();
    return _instance!;
  }

  @override
  bool addInfo(Data data) {
    print('BookManagementImpl addInfo');
    return false;
  }

  @override
  bool delDataInfo(int id) {
    print('BookManagementImpl delDataInfo');
    return false;
  }

  @override
  List<Data> getAllDataListInfo() {
    print('BookManagementImpl getAllDataListInfo');
    return [];
  }

  @override
  bool modifyInfo(Data data) {
    print('BookManagementImpl modifyInfo');
    return false;
  }
}
