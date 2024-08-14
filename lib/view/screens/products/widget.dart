import 'package:zojatech/res/import/import.dart';

class RequestListWidget extends StatelessWidget {
  const RequestListWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.status,
    required this.date,
    this.onPressed,
  });

  final String title, desc, status, date;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: zojatechColor12,
            width: 1.sp,
          ),
        ),
        child: Padding(
          padding: REdgeInsets.fromLTRB(9, 14, 9, 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'house_property'.mobilepng,
                    width: 33.sp,
                    height: 33.sp,
                  ),
                  const XMargin(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ZojatechTextStyle.size14.copyWith(
                            color: zojatechColor2, fontWeight: FontWeight.w400),
                      ),
                      const YMargin(2),
                      Text(
                        desc,
                        style: ZojatechTextStyle.size12.copyWith(
                            color: zojatechColor14,
                            fontWeight: FontWeight.w400),
                      ),
                      const YMargin(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: zojatechColor14.withOpacity(0.1),
                                border: Border.all(
                                  color: zojatechColor15,
                                  width: 0.5.sp,
                                )),
                            child: Padding(
                              padding: REdgeInsets.fromLTRB(8, 1.5, 8, 1.5),
                              child: Text(
                                status,
                                style: ZojatechTextStyle.size12.copyWith(
                                  color: zojatechColor11,
                                ),
                              ),
                            ),
                          ),
                          const XMargin(10),
                          Text(
                            date,
                            style: ZojatechTextStyle.size10.copyWith(
                                color: zojatechColor2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                'arrow_forward'.mobilesvg,
                height: 12.sp,
                width: 12.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
