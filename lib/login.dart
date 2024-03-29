import 'package:aplika_si/Service/Auth_Service.dart';
import 'package:aplika_si/home_page.dart';
import 'package:aplika_si/profil.dart';
import 'package:aplika_si/validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool isLogin;

  @override
  Widget build(BuildContext context) {
    if (Auth.getAuthUser() != null) {
      return const AplikaSI();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: LoginWidget(
          formKey: _formKey,
          emailController: _emailController,
          passwordController: _passwordController,
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 96),
          child: Column(
            children: [
              Image.asset(
                'assets/images/himsi_1.png',
                width: 200,
                height: 200,
              ),
              Image.asset(
                'assets/images/AplikaSI.png',
                width: 194,
                height: 72,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustTextField(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.person_2_outlined),
                controller: _emailController,
                isObscure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This value cannot be empty';
                  } else if (!value.isValidEmail) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustTextField(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                controller: _passwordController,
                isObscure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This value cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustButton(
                controller: TextEditingController(text: 'Login'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String? message = await Auth.signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (message != null) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      }
                      return;
                    }
                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const AplikaSI(),
                        ),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool isObscure;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  const CustTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.isObscure,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isObscure,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: const Color.fromARGB(25, 36, 31, 123),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color.fromARGB(255, 36, 31, 123),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: const Color.fromARGB(255, 36, 31, 123),
          filled: true,
        ),
      ),
    );
  }
}

class CustButton extends StatefulWidget {
  final Function()? onPressed;
  final TextEditingController? controller;
  const CustButton({super.key, required this.onPressed, this.controller});

  @override
  State<CustButton> createState() => _CustButtonState();
}

class _CustButtonState extends State<CustButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
          height: 48,
          width: 324,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 36, 31, 123),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: widget.controller,
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          // child: Text(
          //   widget.buttonText,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //     fontFamily: 'Poppins',
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ),
      ),
    );
  }
}
