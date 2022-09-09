import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Loaders/GifLoader.dart';
import 'package:inventory_go/Components/Textfields/CustomTextFormField.dart';
import 'package:inventory_go/Components/Widgets/Authentication/AuthButton.dart';
import 'package:inventory_go/Providers/AuthProvider/AuthProvider.dart';
import 'package:inventory_go/Util/color_constants.dart';
import 'package:inventory_go/Util/image_constants.dart';
import 'package:inventory_go/Util/route_constants.dart';
import 'package:provider/provider.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  var formKey = GlobalKey<FormState>();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode companyUrlNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyUrlController = TextEditingController();

  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).initAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                ImageConstants.loginBackGround,
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Image.asset(ImageConstants.solutionDotLogo, height: 15),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.2),
            child: Container(
              height: 580,
              width: size.width,
              color: ColorConstants.primary,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Form(
                key: formKey,
                child: Consumer<AuthProvider>(
                  builder: (context, loginProvider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          ImageConstants.appLogo,
                          width: 250,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'InventoryGo',
                          style: TextStyle(
                              color: ColorConstants.secondary,
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                        const Expanded(child: SizedBox()),
                        const Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          node: companyUrlNode,
                          headerText: "Company URL",
                          hintText: 'name.workbox.com',
                          cursorColor: ColorConstants.white,
                          onFieldSubmit: (value) =>
                              FocusScope.of(context).requestFocus(emailNode),
                          controller: _companyUrlController,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (value) {
                            if (!value!.contains('.com')) {
                              return 'Company URL not valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          node: emailNode,
                          headerText: "Email",
                          cursorColor: ColorConstants.white,
                          onFieldSubmit: (value) =>
                              FocusScope.of(context).requestFocus(passwordNode),
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          validator: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return 'Enter a valid Email Address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          node: passwordNode,
                          headerText: 'Password',
                          cursorColor: ColorConstants.white,
                          isObscure: true,
                          controller: _passwordController,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.done,
                          validator: (String? value) => (value!.isEmpty)
                              ? "Please Enter Password"
                              : value.length < 4
                                  ? 'Please enter the correct Password'
                                  : null,
                          onFieldSubmit: (value) async => () {},
                        ),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            // onTap: () => Navigator.of(context)
                            //     .pushNamed(RouteConstants.forgetPassword),
                            child: Text('Forget Password?',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        ColorConstants.black.withOpacity(0.5))),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        loginProvider.loading
                            ? GifLoader()
                            : AuthButton(
                                title: "Login",
                                onPressed: () => Navigator.of(context)
                                    .pushReplacementNamed(
                                        RouteConstants.dashboard),
                              )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
