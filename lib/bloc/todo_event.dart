part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class LoadTodo extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
   AddTodo({required this.todo});

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}

class RemoveTodo extends TodoEvent {
  final int itemIndex;
   RemoveTodo({required this.itemIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [itemIndex];
}