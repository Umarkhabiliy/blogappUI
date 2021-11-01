import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsblog/widgets/custom_app_bar.dart';
import 'package:newsblog/widgets/custom_button.dart';
import 'package:newsblog/widgets/custom_tffd.dart';

class SettingsAdminPage extends StatelessWidget {
  SettingsAdminPage({Key? key}) : super(key: key);
  TextEditingController userEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            AppBarWidget(title: "Sign In For Admins"),
            TextFormFieldWidget(
              textEditingController: userEditingController,
              hinttext: "Username ...",
            ),
            TextFormFieldWidget(
              textEditingController: passwordEditingController,
              hinttext: "Password ...",
            ),
            ElButtonWidget(
              text: "Sign in",
              onPressed: () async {
                var token = await Dio()
                    .post('http://192.168.1.133:4000/admins/signin', data: {
                  "username": userEditingController.text,
                  "password": passwordEditingController.text
                });
                final jwt =
                    JWT.verify(token.toString(), SecretKey("secretKey"));
                if (jwt.payload['isAdmin']) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => Container()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text("Admin uchun login yoki parol notogri !"),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
