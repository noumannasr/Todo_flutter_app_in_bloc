import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_block/bloc/todo_bloc.dart';
import 'package:todo_app_with_block/model/todo_model.dart';
import 'package:todo_app_with_block/res/colors.dart';
import 'package:todo_app_with_block/res/round_button.dart';
import 'package:todo_app_with_block/res/text_editing_item.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {

    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        title: Text('Add Todo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [

          SizedBox(
            height: 10,
          ),
          TextEditingItem(
            isRequired: true,
            controller: titleController,
            title: 'Title',
            hintText: 'Title',
            obsecureText: false,
            validator: (String? value) {},
            keyboardType: TextInputType.name,

            labelText: '',
            minLines: 1,
            maxLines: 1,
            enabled: true,
            textCapitalization: TextCapitalization.none,
            onTap: () {},
            readOnly: false,
          ),
          SizedBox(
            height: 10,
          ),
          TextEditingItem(
            isRequired: true,
            controller: messageController,
            title: 'Message',
            hintText: 'Message',
            obsecureText: false,
            validator: (String? value) {},
            keyboardType: TextInputType.name,

            labelText: '',
            minLines: 1,
            maxLines: 1,
            enabled: true,
            textCapitalization: TextCapitalization.none,
            onTap: () {},
            readOnly: false,
          ),
          SizedBox(
            height: 10,
          ),
          RoundButton(
            width: deviceWidth,
            //isLoading: authViewModel.loading,
            round: 10.0,
            color: Colors.green,
            title: 'Save',
            //   onPress: vm.handleSavePress,
            height: deviceHeight * 0.055,
            icon: '', onPress: () {
            todoBloc.add(AddTodo(todo: Todo(title: titleController.text, message: messageController.text, image: '')));
            Navigator.pop(context);

          },
          ),

        ],),
      ),
    );
  }
}
