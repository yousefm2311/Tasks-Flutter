import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

import 'cubit/cubit.dart';

Widget defaultFormField({
  required String text,
  required TextInputType type,
  required IconData perfix,
  required TextEditingController controller,
  IconData? suffix,
  VoidCallback? suffixButton,
  bool isPassword = false,
  required Function function,
  VoidCallback? ontap,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: (v) {
          function(v);
        },
        controller: controller,
        obscureText: isPassword,
        keyboardType: type,
        onTap: ontap,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          labelText: text,
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.5), width: 1.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(perfix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixButton,
                  icon: Icon(suffix),
                )
              : null,
        ),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  double? height,
  required String text,
  required Function button,
}) =>
    Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.blue,
      ),
      width: width,
      child: MaterialButton(
        height: 40.0,
        onPressed: () {
          button;
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultDesign(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('${model["time"]}'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model["title"]}',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model["date"]}',
                    style: TextStyle(fontSize: 17.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: "done", id: model['id']);
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: "archive", id: model['id']);
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
  onDismissed: (direction){
        AppCubit.get(context).deleteData(id: model['id']);
  },
    );

Widget tasksBulder({
  required List<Map> task,
  IconData? iocn ,
  String? text,
}) =>ConditionalBuilder(
  condition: task.length > 0,
  builder: (context) =>ListView.separated(itemBuilder: (context, index) => defaultDesign(task[index],context),
    separatorBuilder: (context,index) => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    ),
    itemCount: task.length,
  ),
  fallback: (context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iocn,size: 100.0,),
        Text(text!,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)
      ],
    ),
  ),
);
