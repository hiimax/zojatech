import 'package:zojatech/data/provider/transaction_provider.dart';
import 'package:zojatech/res/import/import.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen(
      {super.key, required this.isEditEnabled, this.transaction});
  final bool isEditEnabled;
  final TransactionModel? transaction;

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen>
    with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    if (widget.isEditEnabled) {
      titleController.text = widget.transaction!.title ?? '';
      typeController.text = widget.transaction!.type ?? '';
      descriptionController.text = widget.transaction!.description ?? '';
      statusController.text = widget.transaction!.status ?? '';
      amountController.text = widget.transaction!.amount.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    typeController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trans = Provider.of<TransactionProvider>(context, listen: false);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.fromLTRB(24, 95, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          },
                          child: SvgPicture.asset(
                            'arrow_back'.mobilesvg,
                          ),
                        ),
                        const Spacer(),
                        if (widget.isEditEnabled)
                          GestureDetector(
                            onTap: () {
                              trans.deleteTransaction(
                                  onFailure: () {},
                                  onSuccess: () {
                                    context.pop();
                                  },
                                  id: widget.transaction?.id ?? 0,
                                  ctx: context);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: zojatechRed,
                                ),
                                Text(
                                  'Delete transaction',
                                  style: ZojatechTextStyle.size14.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: zojatechRed),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const YMargin(22),
                    Text(
                      widget.isEditEnabled
                          ? 'Edit transaction'
                          : 'Add new transaction',
                      style: ZojatechTextStyle.size24.copyWith(
                        color: zojatechColor2,
                      ),
                    ),
                  ],
                ),
                const YMargin(24),
                const YMargin(18),
                CustomTextFormField(
                  hintText: 'Enter title ',
                  fillColor: zojatechWhite,
                  enabledBorderColor: zojatechColor8,
                  errorBorderColor: zojatechColor8,
                  focusedBorderColor: zojatechColor8,
                  controller: titleController,
                  validator: (val) => validateEmptyTextField(val),
                ),
                const YMargin(20),
                DropDownInput(
                  hint: 'Select transaction type',
                  items: const [
                    'Debit',
                    'Credit',
                  ],
                  enabled: true,
                  fillColor: zojatechWhite,
                  controller: typeController,
                  onSelected: (val) {
                    typeController.text = val ?? '';
                  },
                  validator: (val) => validateEmptyTextField(val),
                ),
                const YMargin(20),
                DropDownInput(
                  hint: 'Select transaction status',
                  items: const [
                    'Success',
                    'Failed',
                    'Pending',
                  ],
                  enabled: true,
                  fillColor: zojatechWhite,
                  controller: statusController,
                  onSelected: (val) {
                    statusController.text = val ?? '';
                  },
                  validator: (val) => validateEmptyTextField(val),
                ),
                const YMargin(20),
                CustomTextFormField(
                  hintText: 'Enter transaction amount',
                  fillColor: zojatechWhite,
                  enabledBorderColor: zojatechColor8,
                  errorBorderColor: zojatechColor8,
                  focusedBorderColor: zojatechColor8,
                  controller: amountController,
                  textInputType: TextInputType.number,
                  validator: (val) => validateEmptyTextField(val),
                ),
                const YMargin(20),
                CustomTextFormField(
                  hintText: 'Enter transaction description',
                  fillColor: zojatechWhite,
                  enabledBorderColor: zojatechColor8,
                  errorBorderColor: zojatechColor8,
                  focusedBorderColor: zojatechColor8,
                  controller: descriptionController,
                  validator: (val) => validateEmptyTextField(val),
                  maxLines: 3,
                ),
                const YMargin(20),
                CustomButton2(
                  title: widget.isEditEnabled
                      ? 'Update Transaction'
                      : 'Add Transaction',
                  buttonColor: zojatechBlack,
                  borderColor: zojatechBlack,
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    if (_formKey.currentState!.validate()) {
                      final transaction = TransactionModel(
                        titleController.text,
                        descriptionController.text,
                        DateTime.now().toString(),
                        typeController.text,
                        statusController.text,
                        amountController.text,
                        widget.isEditEnabled
                            ? widget.transaction!.id
                            : Random().nextInt(1000),
                      );

                      widget.isEditEnabled
                          ? trans.updateTransaction(
                              ctx: context,
                              onFailure: () {},
                              onSuccess: () {
                                context.pop();
                              },
                              transaction: transaction,
                            )
                          : trans.addTransaction(
                              ctx: context,
                              onFailure: () {},
                              onSuccess: () {
                                context.pop();
                              },
                              transaction: transaction,
                            );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
