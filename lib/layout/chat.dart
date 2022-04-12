import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var task = AppCubit.get(context).doneTasks;
        return  tasksBulder(task: task,iocn: Icons.check_circle,text: 'No Tasks Done');
      },
    );
  }
}
