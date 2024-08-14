import 'package:zojatech/data/provider/product_provider.dart';
import 'package:zojatech/res/import/import.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen(
      {super.key, required this.isEditEnabled, this.product});
  final bool isEditEnabled;
  final ProductModel? product;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  void initState() {
    if (widget.isEditEnabled) {
      nameController.text = widget.product!.title ?? '';
      categoryController.text = widget.product!.category ?? '';
      descriptionController.text = widget.product!.description ?? '';
      statusController.text = widget.product!.status ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductsProvider>(context, listen: false);
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
                              prod.deleteProduct(
                                  onFailure: () {},
                                  onSuccess: () {
                                    context.pop();
                                  },
                                  id: widget.product?.id ?? 0,
                                  ctx: context);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: zojatechRed,
                                ),
                                Text(
                                  'Delete Product',
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
                      widget.isEditEnabled ? 'Edit product' : 'Add new product',
                      style: ZojatechTextStyle.size24.copyWith(
                        color: zojatechColor2,
                      ),
                    ),
                  ],
                ),
                const YMargin(24),
                const YMargin(18),
                CustomTextFormField(
                  hintText: 'Enter product name',
                  fillColor: zojatechWhite,
                  enabledBorderColor: zojatechColor8,
                  errorBorderColor: zojatechColor8,
                  focusedBorderColor: zojatechColor8,
                  controller: nameController,
                  validator: (val) => validateEmptyTextField(val),
                ),
                const YMargin(20),
                CustomTextFormField(
                  hintText: 'Enter product category',
                  fillColor: zojatechWhite,
                  enabledBorderColor: zojatechColor8,
                  errorBorderColor: zojatechColor8,
                  focusedBorderColor: zojatechColor8,
                  controller: categoryController,
                  validator: (val) => validateEmptyTextField(val),
                ),
                const YMargin(20),
                CustomTextFormField(
                  hintText: 'Enter product status',
                  fillColor: zojatechWhite,
                  enabledBorderColor: zojatechColor8,
                  errorBorderColor: zojatechColor8,
                  focusedBorderColor: zojatechColor8,
                  controller: statusController,
                  validator: (val) => validateEmptyTextField(val),
                ),
                const YMargin(20),
                CustomTextFormField(
                  hintText: 'Enter product description',
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
                  title:
                      widget.isEditEnabled ? 'Update Product' : 'Add Product',
                  buttonColor: zojatechBlack,
                  borderColor: zojatechBlack,
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    if (_formKey.currentState!.validate()) {
                      final product = ProductModel(
                        nameController.text,
                        descriptionController.text,
                        statusController.text,
                        categoryController.text,
                        DateTime.now().toString(),
                        widget.isEditEnabled
                            ? widget.product!.id
                            : Random().nextInt(1000),
                      );

                      widget.isEditEnabled
                          ? prod.updateProduct(
                              ctx: context,
                              onFailure: () {},
                              onSuccess: () {
                                context.pop();
                              },
                              product: product,
                            )
                          : prod.addProduct(
                              ctx: context,
                              onFailure: () {},
                              onSuccess: () {
                                context.pop();
                              },
                              product: product,
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
