import '../../../res/import/import.dart';

class CreateAccountSuccessScreen extends StatefulWidget {
  const CreateAccountSuccessScreen({super.key});

  @override
  State<CreateAccountSuccessScreen> createState() =>
      _CreateAccountSuccessScreenState();
}

class _CreateAccountSuccessScreenState
    extends State<CreateAccountSuccessScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: REdgeInsets.fromLTRB(24, 47, 24, 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('poppers_6654110 1'.mobilepng),
                const YMargin(32),
                Text(
                  'Account Secured',
                  style: ZojatechTextStyle.size20.copyWith(
                      fontWeight: FontWeight.w500,
                      color: zojatechBlack,
                      fontSize: 28.sp),
                ),
                const YMargin(18),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Congratulations! Your account has been created successfully. Click',
                          style: ZojatechTextStyle.size16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: zojatechBlack,
                          ),
                        ),
                        TextSpan(
                          text: '“continue” ',
                          style: ZojatechTextStyle.size16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: zojatechPrimaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'to proceed',
                          style: ZojatechTextStyle.size16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: zojatechBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const YMargin(36),
                CustomButton(
                  title: 'Continue',
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                ),
                const YMargin(52),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccountTypeWidget extends StatelessWidget {
  const AccountTypeWidget(
      {super.key,
      required this.title,
      required this.sub,
      required this.image,
      required this.selected,
      required this.hasCondition,
      required this.onPressed});
  final String title, sub, image;
  final bool selected;
  final bool hasCondition;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // height: 93.sp,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 2.sp,
            color: selected ? zojatechPrimaryColor : Colors.transparent,
          ),
          color: zojatechWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 18, 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(image),
              const XMargin(10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: ZojatechTextStyle.size16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: zojatechBlack),
                          ),
                        ),
                        hasCondition
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: zojatechColor10,
                                ),
                                child: Padding(
                                  padding: REdgeInsets.all(6),
                                  child: Center(
                                    child: Text(
                                      'Conditions apply',
                                      style: ZojatechTextStyle.size10.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: zojatechWhite),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    Text(
                      sub,
                      style: ZojatechTextStyle.size10.copyWith(
                          fontWeight: FontWeight.w400, color: zojatechColor1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
