import 'package:flutter/material.dart';

class TextHelper {
  static Widget inputFieldWidget(
    BuildContext context,
    Icon icon,
    String keyName,
    String hintName,
    Function onValidate,
    Function onSaved, {
    String initialValue = "",
    obscureText: false,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        initialValue: initialValue,
        key: new Key(keyName),
        obscureText: obscureText,
        validator: (val) {
          return onValidate(val);
        },
        onSaved: (val) {
          return onSaved(val);
        },
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          hintText: hintName,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color(0xFFC2A1F6),
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color(0xFF743ecc),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  static Widget saveButton(
    Function onTap,
    String btnText,
  ) {
    return Container(
      height: 50,
      width: 150,
      child: RaisedButton(
        onPressed:(){},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF743ecc),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Color(0xFFC2A1F6),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }
}