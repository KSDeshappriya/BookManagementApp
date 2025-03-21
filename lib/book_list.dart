import 'package:flutter/material.dart';
import 'package:book_management_app/models/book.dart';
import 'package:book_management_app/widgets/book_detail_row.dart';
import 'package:book_management_app/widgets/book_form.dart';
import 'package:book_management_app/services/book_service.dart';
import 'package:book_management_app/views/book_list_view.dart';
import 'package:intl/intl.dart';

class BookList extends BookListView {
  const BookList({Key? key}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends BookListViewState<BookList> {
  final BookService _bookService = BookService();

  void _addBook(Book newBook) {
    setState(() {
      _bookService.addBook(newBook);
    });
  }

  void editBook(int index) {
    Book book = _bookService.books[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Edit Book',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: BookForm(
              onBookAdded: (Book updatedBook) {
                setState(() {
                  _bookService.editBook(index, updatedBook);
                });
                Navigator.of(context).pop();
              },
              initialBook: book,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteBook(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Delete Book',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text('Are you sure you want to delete this book?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  _bookService.deleteBook(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showBookDetails(Book book, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            book.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                buildBookDetailRow('Author', book.author),
                buildBookDetailRow('ISBN', book.isbn),
                buildBookDetailRow('Publisher', book.publisher),
                buildBookDetailRow('Publication Date', DateFormat('yyyy-MM-dd').format(book.publicationDate)),
                buildBookDetailRow('Genre', book.genre),
                buildBookDetailRow('Number of Copies', book.numberOfCopies.toString()),
                buildBookDetailRow('Description', book.description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: const Text('Edit'),
              onPressed: () {
                Navigator.of(context).pop();
                editBook(index);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                deleteBook(index);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildBookList(List<Book> books) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Management App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            BookForm(onBookAdded: _addBook),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _bookService.books.length,
                itemBuilder: (context, index) {
                  Book book = _bookService.books[index];
                  return GestureDetector(
                    onTap: () {
                      showBookDetails(book, index);
                    },
                    child: Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Author: ${book.author}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBookList(_bookService.books);
  }
}
