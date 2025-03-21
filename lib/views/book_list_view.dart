import 'package:flutter/material.dart';
import 'package:book_management_app/models/book.dart';

abstract class BookListView extends StatefulWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  BookListViewState createState();
}

abstract class BookListViewState<T extends BookListView> extends State<T> {
  Widget buildBookList(List<Book> books);
}
