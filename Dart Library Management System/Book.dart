class Book {
  String title;
  String author;
  bool isAvailable;

  Book(this.title, this.author) : isAvailable = true;

  void borrowBook() {
    if (isAvailable) {
      isAvailable = false;
      print('The book $title has been borrowed.');
    } else {
      print('The book $title is already borrowed.');
    }
  }

  void returnBook() {
    if (!isAvailable) {
      isAvailable = true;
      print('The book $title has been returned');
    } else {
      print('You have not borrowed that book yet.');
    }
  }
}
