import 'package:flutter/gestures.dart';

import '../../../res/import/import.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Validators {
  bool password = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    fullNameController.dispose();
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
          image: AssetImage('Onboarding_bg1'.mobilepng),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: REdgeInsets.fromLTRB(24, 75, 0, 0),
                    child: SvgPicture.asset('arrow_back'.mobilesvg),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.only(top: 44),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: zojatechSubColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Consumer<AuthenticationProvider>(
                        builder: (context, auth, child) {
                          return Center(
                            child: Padding(
                              padding: REdgeInsets.fromLTRB(24, 18, 24, 18),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Create account',
                                      style: ZojatechTextStyle.size30.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28.sp,
                                        color: zojatechColor2,
                                      ),
                                    ),
                                  ),
                                  const YMargin(16),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Kindly fill up this form and let’s get you started.',
                                      style: ZojatechTextStyle.size12.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: zojatechGrey,
                                      ),
                                    ),
                                  ),
                                  const YMargin(46),
                                  CustomTextFormField(
                                    obscureText: false,
                                    readonly: false,
                                    hintText: 'Full name',
                                    textInputType: TextInputType.name,
                                    fillColor: zojatechTransparent,
                                    controller: fullNameController,
                                    validator: (val) => validateName(val),
                                  ),
                                  const YMargin(20),
                                  CustomTextFormField(
                                    obscureText: false,
                                    readonly: false,
                                    hintText: 'Email address',
                                    textInputType: TextInputType.emailAddress,
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
                                  const YMargin(72),
                                  CustomButton(
                                    title: 'Create Account',
                                    onPressed: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }

                                      if (_formKey.currentState!.validate()) {
                                        UserModel user = UserModel(
                                          fullNameController.text,
                                          emailController.text
                                              .toLowerCase()
                                              .trim(),
                                          '',
                                          passwordController.text,
                                          generateToken(20),
                                          id: Random().nextInt(1000),
                                        );
                                        auth.signup(
                                          ctx: context,
                                          onFailure: () {
                                            
                                          },
                                          onSuccess: () {
                                            context.goNamed(RouteNames.login);
                                          },
                                          user: user,
                                        );
                                      }
                                    },
                                  ),
                                  const YMargin(32),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Already have an account?  ',
                                          style:
                                              ZojatechTextStyle.size12.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: zojatechBlack,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Sign in',
                                          style:
                                              ZojatechTextStyle.size12.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: zojatechPrimaryColor,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              context.goNamed(RouteNames.login);
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
