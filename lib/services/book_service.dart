import 'package:book_management_app/models/book.dart';

class BookService {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void editBook(int index, Book book) {
    books[index] = book;
  }

  void deleteBook(int index) {
    books.removeAt(index);
  }

  List<Book> getBooks() {
    return books;
  }
}
