import 'Book.dart';
import 'User.dart';
import 'Library.dart';

void main() {
  Library library = Library('The City Library');

  Book book1 = Book('1984', "George Orwell");
  Book book2 = Book('The Great Gatsby', "F. Scott");
  Book book3 = Book('Book3', "Book3 Author");

  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  User user1 = User('Stojance');
  User user2 = User('Dzoko');

  library.addUser(user1);
  library.addUser(user2);

  //Display available books;

  library.displayAvailableBooks();

  //User borrows book;
  user1.borrow(book1);
  user2.borrow(book2);

  user1.displayBorrowedBooks();
  user2.displayBorrowedBooks();
}
