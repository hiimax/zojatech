import '../../../res/import/import.dart';

class BottomNavWidgets extends StatelessWidget {
  const BottomNavWidgets({super.key, required this.index, required this.color});

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icons[index],
          color: color,
        ),
        const YMargin(12),
        Text(titles[index],
            style: ZojatechTextStyle.size12.copyWith(
              color: color,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}

List<String> icons = [
  'home_icon'.mobilesvg,
  'artisan_nav_icon'.mobilesvg,
  'more_icon'.mobilesvg,
];
List<String> titles = [
  'Home',
  'Products',
  'Transactions',
];
