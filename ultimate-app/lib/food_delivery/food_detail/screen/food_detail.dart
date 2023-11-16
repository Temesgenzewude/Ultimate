import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  double baseBalance = 12.13;
  double balanceLasted = 0;
  int amount = 1;
  double total = 0;
  double moneySize = 0;
  double moneyTopping = 0;

  List<Map<String, dynamic>> sizes = [
    <String, dynamic>{'title': 'Size S', 'selected': false, 'money': 8},
    <String, dynamic>{'title': 'Size M', 'selected': false, 'money': 10}
  ];
  List<Map<String, dynamic>> topping = [
    <String, dynamic>{'title': 'Cocacola', 'selected': false, 'money': 8},
    <String, dynamic>{'title': 'Bear', 'selected': false, 'money': 10}
  ];

  @override
  void initState() {
    balanceLasted = baseBalance;
    total = amount * balanceLasted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: true,
          hasPop: true,
          onTap: () {},
          action: Image.asset(
            circles_four,
            width: 24,
            height: 24,
            color: grey1100,
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimationClick(
                      function: () {
                        setState(() {
                          amount += 1;
                          total = total + balanceLasted;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: grey600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        amount.toString(),
                        style: body(color: grey1100, fontWeight: '700'),
                      ),
                    ),
                    AnimationClick(
                      function: () {
                        if (amount == 1) {
                          return;
                        }
                        setState(() {
                          amount -= 1;
                          total = total - balanceLasted;
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
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AppWidget.typeButtonStartAction(
                    context: context,
                    input: 'Add to Basket - \$${total.toStringAsFixed(2)}',
                    borderColor: primary,
                    onPressed: () {},
                    bgColor: primary,
                    textColor: grey1100),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Image.asset(
            french_fries_2,
            height: height / 4,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Aloo shimla mirch',
                        style: title4(color: grey1100),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$12.13',
                          style: title3(color: corn1),
                        ),
                        Text(
                          'Base price',
                          style: subhead(color: grey600),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Establish your own food awards and share your favourites with you',
                  style: body(color: grey800),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size',
                  style: title4(color: grey1100),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: sizes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: grey200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimationClick(
                          function: () {
                            for (var element in sizes) {
                              if (element['selected']) {
                                balanceLasted -= element['money'];
                              }
                              element['selected'] = false;
                            }
                            setState(() {
                              sizes[index]['selected'] =
                                  !sizes[index]['selected'];
                              balanceLasted += sizes[index]['money'];
                              total = balanceLasted * amount;
                            });
                          },
                          child: Row(
                            children: [
                              sizes[index]['selected']
                                  ? const Icon(
                                      Icons.check_circle_rounded,
                                      size: 30.0,
                                      color: primary,
                                    )
                                  : const Icon(
                                      Icons.circle_outlined,
                                      size: 30.0,
                                      color: grey600,
                                    ),
                              const SizedBox(width: 16),
                              Text(
                                sizes[index]['title'],
                                style: headline(
                                    color: sizes[index]['selected']
                                        ? grey1100
                                        : grey600),
                              )
                            ],
                          ),
                        ),
                        sizes[index]['selected']
                            ? Text(
                                '+\$${sizes[index]['money']}',
                                style: headline(color: corn1),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Topping',
                  style: title4(color: grey1100),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: topping.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: grey200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimationClick(
                          function: () {
                            setState(() {
                              topping[index]['selected'] =
                                  !topping[index]['selected'];
                              if (topping[index]['selected']) {
                                balanceLasted += topping[index]['money'];
                                total =
                                    total + topping[index]['money'] * amount;
                              } else {
                                balanceLasted -= topping[index]['money'];
                                total =
                                    total - topping[index]['money'] * amount;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              topping[index]['selected']
                                  ? const Icon(
                                      Icons.check_circle_rounded,
                                      size: 30.0,
                                      color: primary,
                                    )
                                  : const Icon(
                                      Icons.circle_outlined,
                                      size: 30.0,
                                      color: grey600,
                                    ),
                              const SizedBox(width: 16),
                              Text(
                                topping[index]['title'],
                                style: headline(
                                    color: topping[index]['selected']
                                        ? grey1100
                                        : grey600),
                              )
                            ],
                          ),
                        ),
                        topping[index]['selected']
                            ? Text(
                                '+\$${topping[index]['money']}',
                                style: headline(color: corn1),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
