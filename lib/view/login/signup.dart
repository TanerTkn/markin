import 'package:flutter/material.dart';
import 'package:markin/constant/color_constant.dart';
import 'package:markin/core/controllers/user_controller.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/core/services/validator_service.dart';
import 'package:markin/models/gender.dart';
import 'package:markin/models/profile.dart';
import 'package:markin/my_home_page.dart';
import 'package:markin/widgets/custom_radium.dart';
import 'package:markin/widgets/texthelper.dart';
import 'package:markin/core/extension/context_extension.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String valueChoose;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  Validator validator = Validator();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String gender = "Male";
  List<Gender> genders = [
    Gender("Male", "assets/svgs/man.svg", true),
    Gender("Woman", "assets/svgs/woman.svg", false),
    Gender("Other", "assets/svgs/unisex.svg", false)
  ];
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
              ColorConstants.instance.perfume,
              ColorConstants.instance.purpleHeart,
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
      flex: 6,
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
                  height: context.sizeH(0.03),
                ),
                TextHelper.inputFieldWidget(
                  context: context,
                  icon: Icon(Icons.lock),
                  keyName: 'username',
                  controller: usernameController,
                  hintName: 'Username',
                  onValidate: (onValidateVal) {
                    return validator.validateName(onValidateVal);
                  },
                  onSaved: (onSavedValue) {},
                ),
                SizedBox(
                  height: context.sizeH(0.04),
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
                  height: context.sizeH(0.03),
                ),
                SizedBox(
                  height: context.sizeH(0.15),
                  width: context.sizeW(0.8),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: genders.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.pinkAccent,
                          onTap: () {
                            setState(() {
                              genders.forEach(
                                  (gender) => gender.isSelected = false);
                              genders[index].isSelected = true;
                              gender = genders[index].name.toLowerCase();
                            });
                          },
                          child: CustomRadio(genders[index]),
                        );
                      }),
                ),
                SizedBox(
                  height: context.sizeH(0.06),
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
        color: ColorConstants.instance.purpleHeart,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        onPressed: () async {
          if (formKey.currentState.validate() && gender.isNotEmpty) {
            AuthService authService = AuthService();
            // ignore: unused_local_variable
            Profile profile = await authService.signUpAccount(
                emailController.text,
                passwordController.text,
                "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=6&m=1223671392&s=612x612&w=0&h=NGxdexflb9EyQchqjQP0m6wYucJBYLfu46KCLNMHZYM=",
                usernameController.text);
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
