class Book {
  String title;
  String author;
  String isbn;
  String publisher;
  DateTime publicationDate;
  String genre;
  int numberOfCopies;
  String description;

  Book({
    required this.title,
    required this.author,
    required this.isbn,
    required this.publisher,
    required this.publicationDate,
    required this.genre,
    required this.numberOfCopies,
    required this.description,
  });
}
