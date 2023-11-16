import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List<Map<String, dynamic>> orders = [
    <String, dynamic>{
      'image': chicken_bucket,
      'name': 'Dark & Stormy',
      'amount': 1,
      'balance': 8.5
    },
    <String, dynamic>{
      'image': coffee,
      'name': 'BBQ Rib Dinner',
      'amount': 1,
      'balance': 7.4
    },
    <String, dynamic>{
      'image': french_fries_2,
      'name': 'Fried Chicken Dinne',
      'amount': 1,
      'balance': 6.5
    },
  ];
  List<Map<String, dynamic>> payments = [
    <String, dynamic>{
      'icon': card_holder,
      'title': 'Payment method',
      'color': green
    },
    <String, dynamic>{
      'icon': gift,
      'title': 'Offer Discount',
      'color': emerald1
    }
  ];
  double total = 0;

  @override
  void initState() {
    for (var element in orders) {
      total += element['amount'] * element['balance'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        center: Text(
          'My Order',
          style: title4(color: grey1100),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                filter,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  icSearch,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
            color: grey200,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: title4(color: grey1100),
                ),
                Text(
                  '\$$total',
                  style: title4(color: corn1),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Place Order',
                  borderColor: primary,
                  onPressed: () {},
                  bgColor: primary,
                  textColor: grey1100),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery to',
                        style: caption1(color: grey900),
                      ),
                      AnimationClick(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              avt_female,
                              width: 24,
                              height: 24,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AnimationClick(
                    child: Row(
                      children: [
                        Text(
                          '21 Pentrefelin, LL68 9PE',
                          style: headline(color: grey1100),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          icKeyboardRight,
                          width: 24,
                          height: 24,
                          color: grey600,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24),
            child: GradientText(
              'Order Sumary',
              style: const TextStyle(
                  fontSize: 28,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 4, top: 16, right: 4, bottom: 16),
            itemCount: orders.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) => AnimationClick(
              child: Container(
                decoration: BoxDecoration(
                  color: grey200,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          orders[index]['image'],
                          width: 56,
                          height: 56,
                        ),
                        Positioned(
                            left: -8,
                            top: -12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: grey1100),
                                  color: green,
                                  borderRadius: BorderRadius.circular(24)),
                              child: Text(
                                'x${orders[index]['amount']}',
                                style: subhead(color: grey1100),
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders[index]['name'],
                            style: headline(color: grey1100),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AnimationClick(
                                    function: () {
                                      total = 0;
                                      setState(() {
                                        orders[index]['amount'] += 1;
                                        for (var element in orders) {
                                          total += element['amount'] *
                                              element['balance'];
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: grey600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      orders[index]['amount'].toString(),
                                      style: body(
                                          color: grey1100, fontWeight: '700'),
                                    ),
                                  ),
                                  AnimationClick(
                                    function: () {
                                      if (orders[index]['amount'] == 0) {
                                        return;
                                      }
                                      total = 0;
                                      setState(() {
                                        orders[index]['amount'] -= 1;
                                        for (var element in orders) {
                                          total += element['amount'] *
                                              element['balance'];
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: grey600,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$' +
                                    double.tryParse((orders[index]['amount'] *
                                                orders[index]['balance'])
                                            .toString())!
                                        .toStringAsFixed(2),
                                style: body(color: corn1, fontWeight: '700'),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16, top: 24),
            child: GradientText(
              'Payments Details',
              style: const TextStyle(
                  fontSize: 28,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
            itemCount: payments.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) => AnimationClick(
              child: Container(
                decoration: BoxDecoration(
                  color: grey200,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: grey300,
                              borderRadius: BorderRadius.circular(16)),
                          child: Image.asset(
                            payments[index]['icon'],
                            width: 28,
                            height: 28,
                            color: payments[index]['color'],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          payments[index]['title'],
                          style: headline(color: grey1100),
                        )
                      ],
                    ),
                    Image.asset(
                      icKeyboardRight,
                      width: 24,
                      height: 24,
                      color: grey600,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
