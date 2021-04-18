import 'package:markin/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:markin/core/services/auth_service.dart';
import 'package:markin/core/services/validator_service.dart';
import 'package:markin/widgets/texthelper.dart';

AlertDialog resetPasswordAlertDialog(
    BuildContext context, TextEditingController emailController) {
  Validator validator = Validator();
  AuthService authService = AuthService();
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    title: Text("Şifeni Sıfırla"),
    content: Container(
      child: Column(
        children: [
          Text(
              "Aşağıya yazdığın mail adresine şifre sıfırlama bağlantınızı göndericeğiz."),
          SizedBox(
            height: context.sizeH(0.05),
          ),
          TextHelper.inputFieldWidget(
              context: context,
              controller: emailController,
              hintName: "Email Adresiniz...",
              onValidate: (val) {
                return validator.validateEmail(val);
              }),
        ],
      ),
    ),
    actions: [
      TextButton(
          onPressed: () {
            authService.resetPassword(emailController.text);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Mail Adresinize Şifre gönderildi")));
          },
          child: Text("GÖNDER"))
    ],
  );
}
