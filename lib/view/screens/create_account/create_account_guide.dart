import '../../../res/import/import.dart';

class CreateAccountGuide extends StatelessWidget {
  const CreateAccountGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              padding: REdgeInsets.only(top: 44, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guide for all account types',
                    style: ZojatechTextStyle.size20.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechColor2,
                    ),
                  ),
                  Text(
                    'Learn all you need to know about account types and how it benefits you',
                    style: ZojatechTextStyle.size12.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechColor1,
                    ),
                  ),
                  const YMargin(29),
                  Text(
                    'Private Account',
                    style: ZojatechTextStyle.size18.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechPrimaryColor,
                    ),
                  ),
                  const YMargin(12),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Augue nunc pellentesque scelerisque tortor vestibulum. Convallis morbi vitae egestas massa vitae sed vestibulum. Amet nibh ultrices consequat lorem dictum cras non. Tempus nunc sit at mollis posuere.Nullam urna ipsum vel enim augue ultricies dui leo ante. Est purus amet a lacus aliquet eget. Fermentum malesuada fermentum fermentum pulvinar vitae. Massa ridiculus amet tortor hendrerit urna ac semper commodo. A arcu pulvinar ullamcorper arcu ipsum eget in placerat. Rhoncus molestie uctus. Ligula augue sed scelerisque dignissim. ',
                    style: ZojatechTextStyle.size12.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechColor1,
                    ),
                  ),
                  const YMargin(64),
                  Text(
                    'Corporate Account',
                    style: ZojatechTextStyle.size18.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechPrimaryColor,
                    ),
                  ),
                  const YMargin(12),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Augue nunc pellentesque scelerisque tortor vestibulum. Convallis morbi vitae egestas massa vitae sed vestibulum. Amet nibh ultrices consequat lorem dictum cras non. Tempus nunc sit at mollis posuere.Nullam urna ipsum vel enim augue ultricies dui leo ante. Est purus amet a lacus aliquet eget. Fermentum malesuada fermentum fermentum pulvinar vitae. Massa ridiculus amet tortor hendrerit urna ac semper commodo. A arcu pulvinar ullamcorper arcu ipsum eget in placerat. Rhoncus molestie uctus. Ligula augue sed scelerisque dignissim. ',
                    style: ZojatechTextStyle.size12.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechColor1,
                    ),
                  ),
                  const YMargin(32),
                  Text(
                    'Affiliate Account',
                    style: ZojatechTextStyle.size18.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechPrimaryColor,
                    ),
                  ),
                  const YMargin(12),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Augue nunc pellentesque scelerisque tortor vestibulum. Convallis morbi vitae egestas massa vitae sed vestibulum. Amet nibh ultrices consequat lorem dictum cras non. Tempus nunc sit at mollis posuere.Nullam urna ipsum vel enim augue ultricies dui leo ante. Est purus amet a lacus aliquet eget. Fermentum malesuada fermentum fermentum pulvinar vitae. Massa ridiculus amet tortor hendrerit urna ac semper commodo. A arcu pulvinar ullamcorper arcu ipsum eget in placerat. Rhoncus molestie uctus. Ligula augue sed scelerisque dignissim. ',
                    style: ZojatechTextStyle.size12.copyWith(
                      fontWeight: FontWeight.w400,
                      color: zojatechColor1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
