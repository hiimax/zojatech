import 'package:flutter/gestures.dart';

import '../../../res/import/import.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> with Validators {
  bool password = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
            image: DecorationImage(
          image: AssetImage('welcome_back_bg'.mobilepng),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.fromLTRB(25, 133, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: ZojatechTextStyle.size30.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 28.sp,
                      color: zojatechSplashColor,
                    ),
                  ),
                  const YMargin(14),
                  Text(
                    'We’re glad to have you back, Kindly enter your details to continue',
                    style: ZojatechTextStyle.size16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechSplashColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: REdgeInsets.only(top: 47),
                child: Container(
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: zojatechSubColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Form(
                    key: _formKey,
                    child: Consumer<AuthenticationProvider>(
                      builder: (context, auth, child) {
                        return Center(
                          child: Padding(
                            padding: REdgeInsets.fromLTRB(24, 46, 24, 40),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    obscureText: false,
                                    readonly: false,
                                    hintText: 'Email',
                                    // maxLength: 10,

                                    textInputType: TextInputType.number,

                                    controller: emailController,
                                    validator: (val) => validateEmail(val),
                                  ),
                                  const YMargin(20),
                                  CustomTextFormField(
                                    obscureText: password,
                                    readonly: false,
                                    hintText: 'Create password',
                                    textInputType: TextInputType.text,
                                    controller: passwordController,
                                    validator: (val) => validatePassword(val),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            password = !password;
                                          });
                                        },
                                        child: password
                                            ? Image.asset(
                                                'eyes_off'.mobilepng,
                                                fit: BoxFit.none,
                                                width: 18.sp,
                                                height: 18.sp,
                                              )
                                            : const Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: zojatechCountryColor,
                                              )),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          StatefulBuilder(
                                              builder: (context, setter) {
                                            return Checkbox(
                                                value: false,
                                                checkColor: zojatechWhite,
                                                activeColor: zojatechColor11,
                                                onChanged: (val) {
                                                  setState(() {
                                                    // _checked = val!;
                                                  });
                                                });
                                          }),
                                          Text(
                                            'Remember me',
                                            style: ZojatechTextStyle.size12
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: zojatechColor11),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Forgot Password?',
                                          style: ZojatechTextStyle.size12
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: zojatechColor11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const YMargin(72),
                                  CustomButton(
                                    title: 'Login',
                                    onPressed: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      if (_formKey.currentState!.validate()) {
                                        auth.login(
                                          ctx: context,
                                          onFailure: () {},
                                          onSuccess: () {
                                            context
                                                .goNamed(RouteNames.dashboard);
                                          },
                                          email: emailController.text
                                              .toLowerCase()
                                              .trim(),
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'or',
                                      style: ZojatechTextStyle.size16.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const YMargin(32),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Don’t have an account? ',
                                          style:
                                              ZojatechTextStyle.size12.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: zojatechBlack,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Sign Up',
                                          style:
                                              ZojatechTextStyle.size12.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: zojatechPrimaryColor,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              context
                                                  .goNamed(RouteNames.signup);
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
