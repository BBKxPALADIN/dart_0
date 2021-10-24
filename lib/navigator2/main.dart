import 'package:flutter/material.dart';
import 'books.dart';

void main() => runApp(const BooksApp());

class BooksApp extends StatefulWidget {
  const BooksApp({Key key}) : super(key: key);

  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  final BookRouterDelegate _routerDelegate = BookRouterDelegate();
  final BookRouteInformationParser _routeInformationParser =
      BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.length == 0) return BookRoutePath.home();

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
      final remaining = uri.pathSegments[1];
      final id = int.tryParse(remaining);
      if (id == null) return BookRoutePath.unknown();
      return BookRoutePath.details(id);
    }

    return BookRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    if (path.isUnknown) {
      return const RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    return null;
  }
}

//TODO: RouterDelegate
class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Book _selectedBook;
  bool show404 = false;

  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('BooksListPage'),
          child: BooksListScreen(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),
        if (show404)
          const MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(),
          )
        else if (_selectedBook != null)
          BookDetailsPage(book: _selectedBook)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedBook = null;
        show404 = true;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[path.id];
    } else {
      _selectedBook = null;
    }
    show404 = false;
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }
}

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({
    this.book,
  }) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => BookDetailsScreen(book: book),
    );
  }
}

//TODO: RouteInformationParser definition
class BookRoutePath {
  final int id;
  final bool isUnknown;

  BookRoutePath.home()
      : id = null,
        isUnknown = false;

  BookRoutePath.details(this.id) : isUnknown = false;

  BookRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BooksListScreen({
    Key key,
    @required this.books,
    @required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Library!!!'),
      ),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            ),
        ],
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(
                book.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                book.author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404!'),
      ),
    );
  }
}
