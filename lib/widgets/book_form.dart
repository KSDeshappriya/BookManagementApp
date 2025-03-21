import 'package:flutter/material.dart';
import 'package:book_management_app/models/book.dart';
import 'package:intl/intl.dart';

class BookForm extends StatefulWidget {
  final Function(Book) onBookAdded;
  final Book? initialBook;

  const BookForm({Key? key, required this.onBookAdded, this.initialBook}) : super(key: key);

  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  late final titleController = TextEditingController(text: widget.initialBook?.title ?? '');
  late final authorController = TextEditingController(text: widget.initialBook?.author ?? '');
  late final isbnController = TextEditingController(text: widget.initialBook?.isbn ?? '');
  late final publisherController = TextEditingController(text: widget.initialBook?.publisher ?? '');
  DateTime? _selectedDate;
  late final genreController = TextEditingController(text: widget.initialBook?.genre ?? '');
  late final numberOfCopiesController = TextEditingController(text: widget.initialBook?.numberOfCopies.toString() ?? '');
  late final descriptionController = TextEditingController(text: widget.initialBook?.description ?? '');

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialBook?.publicationDate;
  }

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    isbnController.dispose();
    publisherController.dispose();
    genreController.dispose();
    numberOfCopiesController.dispose();
    descriptionController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

 void addBook() {
    final newBook = Book(
      title: titleController.text,
      author: authorController.text,
      isbn: isbnController.text,
      publisher: publisherController.text,
      publicationDate: _selectedDate ?? DateTime.now(),
      genre: genreController.text,
      numberOfCopies: int.tryParse(numberOfCopiesController.text) ?? 0,
      description: descriptionController.text,
    );
    widget.onBookAdded(newBook);

    titleController.clear();
    authorController.clear();
    isbnController.clear();
    publisherController.clear();
    _selectedDate = null;
    genreController.clear();
    numberOfCopiesController.clear();
    descriptionController.clear();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2027));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: authorController,
          decoration: InputDecoration(
            labelText: 'Author',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: isbnController,
          decoration: InputDecoration(
            labelText: 'ISBN',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: publisherController,
          decoration: InputDecoration(
            labelText: 'Publisher',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => _selectDate(context),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Publication Date',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_selectedDate == null
                    ? 'Select Date'
                    : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: genreController,
          decoration: InputDecoration(
            labelText: 'Genre',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: numberOfCopiesController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Number of Copies',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: addBook,
          child: const Text('Add Book'),
        ),
      ],
    );
  }
}
