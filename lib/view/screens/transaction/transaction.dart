import 'package:zojatech/data/provider/transaction_provider.dart';
import 'package:zojatech/res/import/import.dart';
import 'package:zojatech/view/screens/transaction/widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zojatechSubColor,
      body: Padding(
        padding: REdgeInsets.fromLTRB(24, 77, 24, 0),
        child: Consumer<TransactionProvider>(builder: (context, trans, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Transactions',
                    style: ZojatechTextStyle.size20.copyWith(
                        fontWeight: FontWeight.w400, color: zojatechColor2),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.goNamed(
                        RouteNames.addTransaction,
                        queryParameters: {'isEditEnabled': false.toString()},
                        extra: TransactionModel('', '', '', '', '', '', 0),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: zojatechPrimaryColor,
                        ),
                        Text(
                          'Add transaction',
                          style: ZojatechTextStyle.size14.copyWith(
                              fontWeight: FontWeight.w400,
                              color: zojatechPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const YMargin(48),
              Expanded(
                child: (trans.transactions != null &&
                        trans.transactions!.isNotEmpty)
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: trans.transactions?.length ?? 0,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.goNamed(
                                RouteNames.addTransaction,
                                queryParameters: {
                                  'isEditEnabled': true.toString()
                                },
                                extra: trans.transactions?[index],
                              );
                            },
                            child: TransactionWidget(
                              amount: trans.transactions?[index].amount ?? '',
                              title: trans.transactions?[index].title ?? '',
                              date: trans.transactions?[index].date ?? '',
                              transactionType: trans.transactions![index].type!
                                          .toLowerCase() ==
                                      'debit'
                                  ? TransactionType.debit
                                  : TransactionType.credit,
                              description:
                                  trans.transactions?[index].description ?? '',
                              transactionStatus: trans
                                          .transactions?[index].status!
                                          .toLowerCase() ==
                                      'success'
                                  ? TransactionStatus.success
                                  : trans.transactions?[index].status!
                                              .toLowerCase() ==
                                          'pending'
                                      ? TransactionStatus.pending
                                      : TransactionStatus.failed,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const YMargin(10),
                      )
                    : const Center(
                        child: Text('No data found'),
                      ),
              )
            ],
          );
        }),
      ),
    );
  }
}
