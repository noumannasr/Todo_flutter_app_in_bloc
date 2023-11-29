import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_block/bloc/todo_bloc.dart';
import 'package:todo_app_with_block/model/todo_model.dart';
import 'package:todo_app_with_block/utils/routes/routes_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addTodo);
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        title: const Text(
          'Todos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TodoLoaded) {
            return state.todo.isEmpty
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Center(
                          child: Text(
                        'No Data Found',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        background: Container(
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.delete, color: Colors.white,size: 40,)
                          ],),
                        ),
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.startToEnd) {
                            print("Add to favorite");
                          } else {
                            todoBloc.add(RemoveTodo(itemIndex: index));

                            print('Remove item');
                          }

                          // setState(() {
                          //   items.removeAt(index);
                          // });
                        },
                        key: UniqueKey(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            tileColor: Colors.green.shade50,
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage("https://i.imgur.com/OvMZBs9.jpeg"),
                            ),
                            title: Text(
                              state.todo[index].title.toString(),
                              style: const TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            subtitle: Text(
                              state.todo[index].message.toString(),
                              style: const TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      );
                    });
          } else {
            return const Column(
              children: [
                Center(
                    child:  Text(
                  'Something went wrong',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                )),
              ],
            );
          }
        },
      ),
    );
  }
}
