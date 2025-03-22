# Book Management App

This project is a Flutter-based mobile application designed to help users manage their personal book collection. Users can view a list of books, add new books, edit existing book details, and delete books from the list. The app uses a simple data model and dummy data service to demonstrate basic CRUD (Create, Read, Update, Delete) operations in Flutter.

## How to run

1.  Ensure you have Flutter installed.
2.  Run `flutter pub get` to install dependencies.
3.  Run `flutter run` to start the app.

## Project Structure

```
lib/
├── book_list.dart       # Main book list UI
├── main.dart            # Entry point of the app
├── models/
│   └── book.dart        # Book data model
├── services/
│   └── book_service.dart # Book data service (dummy data)
├── views/
│   └── book_list_view.dart # Book list view
└── widgets/
    ├── book_detail_row.dart # Widget to display book details in a row
    └── book_form.dart      # Form for adding/editing books
```

## Models

*   `book.dart`: Defines the structure of a book object with properties like title, author, and ISBN.

## Services

*   `book_service.dart`: Provides a dummy data service for fetching and managing books.

## Widgets

*   `book_detail_row.dart`: A widget used to display book details in a row format.
*   `book_form.dart`: A form widget for adding new books or editing existing ones.
