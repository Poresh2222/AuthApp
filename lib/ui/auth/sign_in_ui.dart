import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:waterproject_v3/ui/components/components.dart';
import 'package:waterproject_v3/ui/components/form_input_field_with_icon.dart';
import 'package:waterproject_v3/ui/components/label_button.dart';
import 'package:waterproject_v3/ui/components/primary_button.dart';

class SignInUI extends StatefulWidget {
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: LoadingScreen(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LogoGraphicHeader(),
                    SizedBox(height: 48.0),
                    FormInputFieldWithIcon(
                      controller: _email,
                      iconPrefix: Icons.email,
                      labelText: "email",
                      //validator: Validator,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => null,
                      onSaved: (value) => _email.text = value,
                    ),
                    FormVerticalSpace(),
                    FormInputFieldWithIcon(
                      controller: _password,
                      iconPrefix: Icons.lock,
                      labelText: "password",
                      //validator: Validator,
                      obscureText: true,
                      onChanged: (value) => null,
                      onSaved: (value) => _password.text = value,
                      maxLines: 1,
                    ),
                    FormVerticalSpace(),
                    PrimaryButton(
                      labelText: "Sign In",
                      onPressed: null,
                    ),
                    FormVerticalSpace(),
                    LabelButton(
                      labelText: "resetPass",
                      onPressed: null,
                    ),
                    LabelButton(
                      labelText: "Sign Up",
                      onPressed: null,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        inAsyncCall: _loading,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
