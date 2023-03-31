import 'package:event_mgmt_sys/utils/route_constants.dart';
import 'package:event_mgmt_sys/utils/status_enum.dart';
import 'package:event_mgmt_sys/utils/string_constants.dart';
import 'package:event_mgmt_sys/view_models/login_view_model.dart';
import 'package:event_mgmt_sys/views/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32)),
                  color: Theme.of(context).primaryColor),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 3,
              child: Image.asset(
                "assets/app_icon.png",
                opacity: const AlwaysStoppedAnimation(.1),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      16, MediaQuery.of(context).size.height / 2 - 50, 16, 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        login,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextFieldWidget(
                                textEditingController: _emailController,
                                fieldName: enterEmail,
                                labelText: email,
                                icon: Icons.email_outlined,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomTextFieldWidget(
                                textEditingController: _passwordController,
                                fieldName: enterPassword,
                                labelText: password,
                                icon: Icons.lock_outline,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 45,
                      child: ElevatedButton(
                          onPressed: _onLoginClick, child: const Text(login)),
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 128),
              child: Column(
                children: [
                  Image.asset(
                    "assets/app_icon.png",
                    height: 64,
                    width: 64,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    appName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _onLoginClick() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      Map data = {
        "email": _emailController.text.trim(),
        "password": _passwordController.text
      };
      Provider.of<LoginViewModel>(context, listen: false)
          .login(data)
          .then((value) {
        if (value == Status.success) {
          Navigator.pushNamed(context, homeRoute);
        } else {
          Fluttertoast.showToast(
            msg: "Login failed",
          );
        }
      });
    }
  }
}
