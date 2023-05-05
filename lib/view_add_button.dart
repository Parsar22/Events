
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class viewAddButton extends StatelessWidget{
  const viewAddButton({super.key}) ;


  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        context.pushNamed('form');
      },
      child : Row(
        children: const [
          Icon(Icons.add)
        ],
      )
    );
  }

}