import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../app/widget_support.dart';
import '../common/route/routes.dart';

final List<Map<String, String>> routers = [
  {'title': 'Main Seller', 'route': Routes.main_seller},
  {'title': 'List Product', 'route': Routes.list_product},
  {'title': 'Payment Processing', 'route': Routes.payment_processing},
  {'title': 'Inventory', 'route': Routes.inventory},
  {'title': 'Customer Manager', 'route': Routes.customer_manager},
  {'title': 'Earning', 'route': Routes.earning},
  {'title': 'Product Details', 'route': Routes.product_detail},
  {'title': 'Customer Support', 'route': Routes.customer_support},
  {'title': 'Order Management', 'route': Routes.order_management},
  {'title': 'Card Product', 'route': Routes.card_product}
];

class MenuEcommerceNavigation extends StatefulWidget {
  const MenuEcommerceNavigation({Key? key}) : super(key: key);

  @override
  State<MenuEcommerceNavigation> createState() =>
      _MenuEcommerceNavigationState();
}

class _MenuEcommerceNavigationState extends State<MenuEcommerceNavigation> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              logo,
              width: 48,
              height: 48,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(32),
                      itemBuilder: (context, index) {
                        return AnimationClick(
                          function: () {
                            Navigator.of(context)
                                .pushNamed(routers[index]['route']!);
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                routers[index]['title']!,
                                style: title3(
                                    color: selected == index ? corn1 : grey600),
                              ),
                              selected == index
                                  ? Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: corn1,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 32),
                      itemCount: routers.length),
                  Positioned(
                      bottom: 16,
                      right: 0,
                      child: Image.asset(
                        menu,
                        height: height / 4,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
