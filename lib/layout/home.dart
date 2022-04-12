import 'package:change_first_login/shared/cubit/cubit.dart';
import 'package:change_first_login/shared/cubit/states.dart';
import 'package:change_first_login/shared/list.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var task = AppCubit.get(context).newTasks;
        return  tasksBulder(task: task,iocn: Icons.task,text: 'No Tasks Yet. Please Add Some Tasks');
      },
    );
  }
}
