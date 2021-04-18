import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/controllers/user_controller.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/core/services/validator_service.dart';
import 'package:markin/my_home_page.dart';
import 'package:markin/view/login/signup.dart';
import 'package:markin/widgets/reset_password.dart';
import 'package:markin/widgets/texthelper.dart';
import 'package:markin/core/extension/context_extension.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String valueChoose;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  Validator validator = Validator();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              'SIGN IN',
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextHelper.inputFieldWidget(
                  context: context,
                  icon: Icon(Icons.lock),
                  keyName: 'e-Mail',
                  controller: emailController,
                  hintName: 'E-Mail',
                  onValidate: (onValidateVal) {
                    return validator.validateEmail(onValidateVal);
                  },
                  onSaved: (onSavedValue) {},
                ),
                SizedBox(
                  height: context.sizeH(0.06),
                ),
                TextHelper.passFieldWidget(
                  context: context,
                  icon: Icon(Icons.lock),
                  keyName: 'password',
                  controller: passwordController,
                  obscureFunction: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  obscureText: obscureText,
                  obscureIcon: Icon(obscureText == true
                      ? Icons.visibility
                      : Icons.visibility_off),
                  hintName: 'Password',
                  onValidate: (onValidateVal) {
                    return validator.validatePasswordLength(onValidateVal);
                  },
                  onSaved: (onSavedValue) {},
                ),
                SizedBox(
                  height: context.sizeH(0.05),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: ColorConstants.instance.electricViolet),
                    )),
                TextButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            resetPasswordAlertDialog(context, emailController),
                      );
                    },
                    child: Text(
                      "Did you forget your password?",
                      style: TextStyle(
                          color: ColorConstants.instance.electricViolet),
                    )),
                SizedBox(
                  height: context.sizeH(0.05),
                ),
                buildContainer()
              ],
            ),
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
            'Sign In',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        onPressed: () async {
          if (formKey.currentState.validate()) {
            AuthService authService = AuthService();
            await authService.signInAccount(
              emailController.text,
              passwordController.text,
            );
            userController.updateProfile(firebaseAuth.currentUser);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          }
        },
      ),
    );
  }
}
