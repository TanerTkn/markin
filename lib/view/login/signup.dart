import 'package:flutter/material.dart';
import 'package:markin/widgets/texthelper.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String valueChoose;
  List listitem = ["Male", "Famele"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFFC2A1F6),
              Color(0xFF743ecc),
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          )),
          child: Column(
            children: [
              buildExp1(),
              buildExp2(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExp1() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SIGN UP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 46.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExp2(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextHelper.inputFieldWidget(
                context,
                Icon(Icons.lock),
                'e-Mail',
                'E-Mail',
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'E-Mail is empty';
                  }
                  return null;
                },
                (onSavedValue) {},
              ),
              SizedBox(
                height: 40,
              ),
              TextHelper.inputFieldWidget(
                context,
                Icon(Icons.lock),
                'username',
                'Username',
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'Username is empty';
                  }
                  return null;
                },
                (onSavedValue) {},
              ),
              SizedBox(
                height: 40,
              ),
              TextHelper.inputFieldWidget(
                context,
                Icon(Icons.lock),
                'password',
                'PassWord',
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
                (onSavedValue) {},
              ),
              SizedBox(
                height: 40,
              ),
              TextHelper.inputFieldWidget(
                context,
                Icon(Icons.lock),
                'sex',
                'Sex',
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'Sex is empty';
                  }
                  return null;
                },
                (onSavedValue) {},
              ),
              
              SizedBox(
                height: 40,
              ),
              buildContainer()
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(60.0)),
        color: Color(0xff743ecc),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}