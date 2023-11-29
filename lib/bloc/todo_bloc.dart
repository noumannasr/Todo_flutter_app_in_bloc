import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_with_block/model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  List<Todo> todos = [];


  @override
  TodoState get initialState => TodoLoaded( todo: todos);
  TextEditingController get titleController => titleController;
  TextEditingController get messageController => messageController;


  TodoBloc() : super(TodoInitial()) {
    print(todos.length.toString() + " This is the list length");
    on<LoadTodo>((event, emit) async {
      await Future<void>.delayed(Duration(seconds: 2));
      todos = [];
      emit(TodoLoaded(todo: <Todo>[]));
    });
    on<AddTodo>((event, emit) async {
      if(state is TodoLoaded) {
        final state = this.state as TodoLoaded;
        // todos.add(event.todo);
        // print(todos.length.toString() + " This is the list length");
        // print(event.todo.message.toString() + " This is the list length");
        emit(TodoLoaded(todo: List.from(state.todo)..add(event.todo)));
      }
    });
    on<RemoveTodo>((event, emit) async {
      if(state is TodoLoaded) {
        final state = this.state as TodoLoaded;
        if(state.todo.isNotEmpty) {
          state.todo.removeAt(event.itemIndex);
        }
        // ..removeAt(event.itemIndex)
        emit(TodoLoaded(todo: state.todo//List.from(state.todo)
        )); //
      }
    });

    // @override
    // Stream<TodoState> mapEventToState(TodoEvent event) async* {
    //   if (event is LoadTodo) {
    //     await Future<void>.delayed(Duration(seconds: 2));
    //     yield TodoLoaded(todo: <Todo>[]);
    //
    //   }
    //   if (event is AddTodo) {
    //     final state = this.state as TodoLoaded;
    //     todos.add(event.todo);
    //     yield TodoLoaded(todo: List.from(todos));
    //
    //   }
    //
    // }


  }
}
