import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String title;
  final String message;
  final String image;

 const Todo({required this.title, required this.message, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => <Todo>[];



}