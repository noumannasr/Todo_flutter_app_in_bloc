part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class TodoLoaded extends TodoState {
  final List<Todo> todo;
   TodoLoaded({required this.todo});

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}
