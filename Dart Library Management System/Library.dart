import 'Book.dart';
import 'User.dart';

class Library {
  String name;
  List<Book> books;
  List<User> users;

  Library(this.name) : books = [], users = [];

  void addBook(Book book) {
    if (books.contains(book)) {
      print(
        'The book with a title ${book.title} is already added to the library',
      );
      return;
    }
    books.add(book);
    print('The book ${book.title} by ${book.author} is added to the library.');
  }

  void addUser(User user) {
    users.add(user);
    print('User ${user.name} has joined the library.');
  }

  void displayAvailableBooks() {
    print('The available books in $name:');
    for (var book in books) {
      if (book.isAvailable) {
        print("${book.title} by ${book.author}");
      }
    }
  }
}
