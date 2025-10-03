import 'package:go_router/go_router.dart';
import 'package:belanja_go/pages/home_page.dart';
import 'package:belanja_go/pages/item_page.dart';
import 'package:belanja_go/models/item.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => HomePage()),
    GoRoute(
      path: '/item',
      name: 'item',
      builder: (context, state) {
        // Ambil data dari extra
        final item = state.extra as Item;
        return ItemPage(item: item);
      },
    ),
  ],
);
