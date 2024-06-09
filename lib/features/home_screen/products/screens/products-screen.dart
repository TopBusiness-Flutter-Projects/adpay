import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/styles.dart';
import '../../component/catogreyCard.dart';
import '../../component/custom_product_widget.dart';
import '../cubit/products_cubit.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key, this.id});
  String? id;
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // int selectedCategoryIndex = 0;
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, statee) {
        ProductsCubit cubit = ProductsCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back)),
                      ),
                      title: Text("products".tr(),
                          style: Styles.style20.copyWith(color: Colors.black)),
                    ),
                  ),
                  CategoryCard(
                    currentId: int.parse(widget.id ?? '0'),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        padding: EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: cubit.productsModel?.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                              height: 200.h,
                              child: CustomProductWidget(
                                product: cubit.productsModel?.data?[index],
                              ));
                        },
                      )),
                ],
              ),
            ),
          ),
        );
      }
      // }
      // else {
      //   return const Center(child: Text("no data"));
      // }
      ,
    );
  }
}
