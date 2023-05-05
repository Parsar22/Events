import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WrongEndDate {
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

class WrongStartDate {
  showSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.error),
            SizedBox(width: 20),
            Expanded(
              child: Text('Start date can not be after end date'),
            )
          ],
        ),
      ),
    );
  }
}

class EmptyFields {
  showSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.error),
            SizedBox(width: 20),
            Expanded(
              child: Text('Please choose valid options for each field'),
            )
          ],
        ),
      ),
    );
  }
}
