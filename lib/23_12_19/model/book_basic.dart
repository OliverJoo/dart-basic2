import 'package:intl/intl.dart';

import '../management/management.dart';

abstract class BookBasic {
  String title;
  String author;
  String status;

  BookBasic({
    required this.title,
    required this.author,
    required this.status,
  });

  String getInfo();
}

class BookInfo extends BookBasic implements Data {
  static int idNumber = 0;
  int? id;
  String publishedDate;

  BookInfo({
    required super.title,
    required super.author,
    required super.status,
    required this.publishedDate,
  }) : id = BookInfo.idNumber++;

  @override
  String getInfo() {
    return 'BookBasic{author: $author, status: $status} Book{id: $id, publishedDate: $publishedDate}';
  }
}

class BookBorrowHistory extends BookBasic {
  static int idNumber = 0;
  int? id;
  DateTime borrowDate;
  DateTime? returnDate;

  BookBorrowHistory({
    required super.title,
    required super.author,
    required super.status,
    required String borrowDate,
    this.returnDate,
  })  : id = BookBorrowHistory.idNumber++,
        borrowDate = DateTime.parse(borrowDate);

  @override
  String getInfo() {
    return 'BookBasic{author: $author, status: $status}  '
        'BookBorrowHistory{id: $id, borrowDate: ${DateFormat('yyyy-MM-dd').format(borrowDate)}, returnDate: $returnDate, id: $id}';
  }
}

void main() {
  List<BookInfo> bookList = [];
  bookList.add(BookInfo(
      title: 'title',
      author: 'author',
      status: 'status',
      publishedDate: '2013-12-12'));
  bookList.add(BookInfo(
      title: 'title1',
      author: 'author2',
      status: 'status2',
      publishedDate: '2015-12-12'));
  bookList.add(BookInfo(
      title: 'title14',
      author: 'auth3or2',
      status: 's2tatus2',
      publishedDate: '2015-12-01'));
  for (BookInfo book in bookList) {
    print(book.getInfo());
  }

  final bookHistory = BookBorrowHistory(
      title: 'title',
      author: 'author',
      status: 'status',
      borrowDate: '2013-12-15');
  print(bookHistory.getInfo());
}
