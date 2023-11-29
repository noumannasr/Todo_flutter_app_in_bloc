import 'package:flutter/material.dart';
import 'package:todo_app_with_block/utils/routes/routes_name.dart';
import 'package:todo_app_with_block/view/addTodo/add_todo_view.dart';
import 'package:todo_app_with_block/view/home/home_view.dart';


class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RoutesName.addTodo:
        return MaterialPageRoute(builder: (context) => const AddTodoView());


      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Center(
            child: Text('No Route Defined'),
          ),
        );
    }
  }
}
