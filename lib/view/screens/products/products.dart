import 'package:zojatech/data/provider/product_provider.dart';
import 'package:zojatech/res/import/import.dart';
import 'package:zojatech/view/screens/products/widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
      backgroundColor: zojatechSubColor,
      body: Padding(
        padding: REdgeInsets.fromLTRB(24, 95, 24, 0),
        child: Consumer<ProductsProvider>(builder: (context, prod, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'All Products',
                        style: ZojatechTextStyle.size20.copyWith(
                            fontWeight: FontWeight.w400, color: zojatechColor2),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.goNamed(
                            RouteNames.addProduct,
                            queryParameters: {
                              'isEditEnabled': false.toString()
                            },
                            extra: ProductModel('', '', '', '', '', 0),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: zojatechPrimaryColor,
                            ),
                            Text(
                              'Add product',
                              style: ZojatechTextStyle.size14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: zojatechPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const YMargin(30),
                  SizedBox(
                    height: 44.sp,
                    child: CustomTextFormField(
                      hintText: 'Search by name ',
                      prefixIcon: Padding(
                        padding: REdgeInsets.fromLTRB(23, 0, 5, 0),
                        child: SvgPicture.asset('search'.mobilesvg),
                      ),
                      fillColor: zojatechColor13,
                      errorBorderColor: zojatechColor13,
                      focusedBorderColor: zojatechColor13,
                      enabledBorderColor: zojatechColor13,
                      borderRadius: 100,
                    ),
                  ),
                ],
              ),
              const YMargin(27),
              const YMargin(20),
              Expanded(
                child: (prod.products != null && prod.products!.isNotEmpty)
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: prod.products?.length ?? 0,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) => const YMargin(10),
                        itemBuilder: (context, index) {
                          return RequestListWidget(
                            title: prod.products?[index].title ?? '',
                            desc: prod.products?[index].category ?? '',
                            status: prod.products?[index].status ?? '',
                            date: formatSystemDate(
                                prod.products?[index].date ?? ''),
                            onPressed: () {
                              context.goNamed(
                                RouteNames.addProduct,
                                queryParameters: {
                                  'isEditEnabled': true.toString()
                                },
                                extra: prod.products?[index],
                              );
                            },
                          );
                        },
                      )
                    : const Center(child: Text('No data found')),
              ),
            ],
          );
        }),
      ),
    );
  }
}
