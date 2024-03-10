
import 'package:flutter/material.dart';

pushwithReplacement(context, newview) { {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => newview));
  }
}

push(context, newview) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => newview));
}
