import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widgets/auth/auth_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: [
          _FormWidget(),
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal'
            ' recommendations you will need to login to your account. If you do not have an account, registering'
            ' for an account is free and simple.',
            style: textStyle,
          ),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text("Register"),
          ),
          SizedBox(height: 25),
          Text(
            'If you signed up but didn\'t get your verification email.',
            style: textStyle,
          ),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text("Verify email"),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xF2212529),
    );
    const textFieldDecorator = InputDecoration(
      enabledBorder: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ErrorMessageWidget(),
          const Text(
            "Username",
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextField(
            controller: model?.loginTextController,
            decoration: textFieldDecorator,
          ),
          const SizedBox(height: 20),
          const Text(
            "Password",
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextField(
            controller: model?.passwordTextController,
            decoration: textFieldDecorator,
            obscureText: true,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              _AuthButtonWidget(),
              const SizedBox(width: 30),
              TextButton(
                  onPressed: () {},
                  child: const Text("Reset password"),
                  style: AppButtonStyle.linkButton),
            ],
          )
        ],
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    const color = Color(0xFF01B4E4);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
        ),
      ),
      child: const Text("Login"),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
