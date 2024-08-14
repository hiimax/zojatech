import '../../../res/import/import.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget(
      {super.key,
      required this.title,
      required this.amount,
      required this.date,
      required this.transactionStatus,
      required this.transactionType,
      required this.description});
  final String title, amount, date, description;
  final TransactionType transactionType;
  final TransactionStatus transactionStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 5),
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
                  const XMargin(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ZojatechTextStyle.size14.copyWith(
                            color: zojatechColor2, fontWeight: FontWeight.w400),
                      ),
                      const YMargin(9),
                      Text(
                        formatSystemDate(date),
                        style: ZojatechTextStyle.size10.copyWith(
                            color: zojatechColor1, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    transactionType == TransactionType.debit
                        ? '- ₦$amount'
                        : '+ ₦$amount',
                    style: ZojatechTextStyle.size12.copyWith(
                        color: transactionType == TransactionType.credit
                            ? zojatechPrimaryColor
                            : zojatechRed,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    transactionStatus.name,
                    style: ZojatechTextStyle.size12.copyWith(
                        color: transactionStatus == TransactionStatus.success
                            ? zojatechPrimaryColor
                            : transactionStatus == TransactionStatus.failed
                                ? zojatechRed
                                : zojatechColor11,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum TransactionType { debit, credit }

enum TransactionStatus { pending, success, failed }
