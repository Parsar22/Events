import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WrongDate {
  showSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.error),
            SizedBox(width: 20),
            Expanded(
              child: Text('Invalid start/end date was given!'),
            )
          ],
        ),
      ),
    );
  }
}
