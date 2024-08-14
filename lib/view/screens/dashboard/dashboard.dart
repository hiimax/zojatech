import '../../../res/import/import.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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
      backgroundColor: zojatechBlack,
      body: Consumer<AuthenticationProvider>(builder: (context, auth, _) {
        return Column(
          children: [
            const YMargin(95),
            Row(
              children: [
                const XMargin(21),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: 'https://picsum.photos/200/300',
                        height: 50.sp,
                        width: 50.sp,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const XMargin(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Afternoon',
                          style: ZojatechTextStyle.size14.copyWith(
                            color: zojatechWhite,
                          ),
                        ),
                        Text(
                          auth.user?.name ?? '',
                          style: ZojatechTextStyle.size20.copyWith(
                            color: zojatechWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset('message_icon'.mobilesvg),
                    const XMargin(10),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'notification_icon'.mobilesvg)),
                  ],
                ),
                const XMargin(20),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 550.sp,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 500.sp,
                      decoration: const BoxDecoration(
                          color: zojatechSubColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: REdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const YMargin(170),
                              Text(
                                'This is a demo challenge for Zojatech',
                                style: ZojatechTextStyle.size14.copyWith(
                                  color: zojatechColor1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: const Align(
                      alignment: Alignment.topCenter,
                      child: DashBoardBalanceWidget(),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class DashBoardBalanceWidget extends StatelessWidget {
  const DashBoardBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: zojatechColor12,
          width: 1.sp,
        ),
        image:  DecorationImage(
            image: AssetImage('wallet_bg'.mobilepng),
            fit: BoxFit.cover),
      ),
    );
  }
}
