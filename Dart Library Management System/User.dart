import 'Book.dart';

class User {
  String name;
  List<Book> borrowedBooks;

  User(this.name) : borrowedBooks = [];

  void borrow(Book book) {
    if (book.isAvailable) {
      borrowedBooks.add(book);
      book.borrowBook();
    } else {
      print("The book ${book.title} is not available");
    }
  }

  void returnBook(Book book) {
    if (borrowedBooks.contains(book)) {
      borrowedBooks.remove(book);
      book.returnBook();
      print('The book ${book.title} is returned');
    } else {
      print('You didn`t borrow that book');
    }
  }

  void displayBorrowedBooks() {
    if (borrowedBooks.isEmpty) {
      print('You didn`t borrow any book yet.');
      return;
    }
    print('You borrowed the following books: ');
    for (var book in borrowedBooks) {
      print(book.title);
    }
  }
}
