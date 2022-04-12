// ignore_for_file: null_check_always_fails, non_constant_identifier_names
import 'package:change_first_login/shared/component.dart';
import 'package:change_first_login/shared/cubit/cubit.dart';
import 'package:change_first_login/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../shared/list.dart';
import 'add.dart';
import 'chat.dart';
import 'home.dart';

class BottomNavi extends StatelessWidget {
  BottomNavi({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabase) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.appBarName[cubit.CurrnetIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetLoadDatabase,
              builder: (context) => cubit.slider[cubit.CurrnetIndex],
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheet) {
                  cubit.Insert(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text);
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormField(
                                text: 'Title',
                                type: TextInputType.text,
                                perfix: Icons.title,
                                controller: titleController,
                                function: (String value) {
                                  if (value.isEmpty) {
                                    return 'Title isEmpty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                text: 'Time',
                                type: TextInputType.datetime,
                                perfix: Icons.timer_outlined,
                                controller: timeController,
                                ontap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) => {
                                        timeController.text =
                                            value!.format(context).toString(),
                                      });
                                },
                                function: (String value) {
                                  if (value.isEmpty) {
                                    return 'Title isEmpty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                text: 'date',
                                type: TextInputType.datetime,
                                perfix: Icons.date_range,
                                controller: dateController,
                                ontap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse("2022-11-23"),
                                  ).then((value) => {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!),
                                      });
                                },
                                function: (String value) {
                                  if (value.isEmpty) {
                                    return 'Title isEmpty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        elevation: 20.0,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheet(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.Ico),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.CurrnetIndex,
              onTap: (index) {
                cubit.ChangeBottom(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.task,
                    ),
                    label: "Tasks"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_circle,
                    ),
                    label: "Done"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive,
                    ),
                    label: "Archive"),
              ],
            ),
          );
        },
      ),
    );
  }
}
