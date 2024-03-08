import 'package:flutter/material.dart';

const Color veryLightComb = Color.fromRGBO(254, 240, 146, 1);
const Color lightComb = Color.fromRGBO(233, 163, 0, 1);
const Color mediumComb = Color.fromRGBO(239, 144, 27, 1);
const Color darkComb = Color.fromRGBO(177, 79, 10, 1);
const Color lightHoney = Color.fromRGBO(242, 205, 71, 1);
const Color mediumHoney = Color.fromRGBO(241, 202, 45, 1);

const kSmallText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);
const kTitleDecoration = TextStyle(
  color: veryLightComb,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);
const kLogoDecoration = TextStyle(
  color: veryLightComb,
  fontWeight: FontWeight.bold,
  fontSize: 60.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: mediumComb, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mediumComb, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mediumComb, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

const kPostTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mediumComb, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mediumComb, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
