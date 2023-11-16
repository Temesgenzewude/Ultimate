import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/dropdown.dart';
import '../widget/my_outline_button.dart';
import '../widget/product_widget.dart';
import '../widget/tabbar.dart';

final List<String> products = [shoes, shoe_2, glove, shoes];
final List<String> options = [
  'Product details',
  'Size Fit',
  'Looking After Me',
  'About Shop'
];

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                chat_tear_drop,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  shareNetwork,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            height: height / 4,
            child: BlocBuilder<SliderBloc, int>(
              builder: (context, state) {
                return PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  onPageChanged: (value) {
                    if (value > state) {
                      sliderBloc.add(SwipeRight());
                    } else {
                      sliderBloc.add(SwipeLeft());
                    }
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Image.asset(
                        products[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(99)),
                  child: Row(
                    children: [
                      const Text(
                        '❤️',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '400',
                        style: subhead(color: grey800),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SliderBloc, int>(
                    builder: (context, state) {
                      return ProductWidget.createIndicator(
                          lengthImage: products.length, currentImage: state);
                    },
                  ),
                ),
                AnimationClick(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(24)),
                      child: Image.asset(
                        play,
                        width: 20,
                        height: 20,
                      )),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 24, bottom: 4),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$79',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      '\$268',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: grey600,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    'Cypressme · Tennis shoes in leather',
                    style: title4(color: grey1100),
                  ),
                ),
                Row(
                  children: const [
                    Expanded(child: DropDown(items: ['White', 'Black'])),
                    SizedBox(width: 8),
                    Expanded(
                        child:
                            DropDown(items: ['Size M', 'Size L', 'Size XL'])),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AnimationClick(
                        child: MyOutlinedButton(
                            gradient: LinearGradient(colors: [
                              const Color(0xFFCFE1FD).withOpacity(0.9),
                              const Color(0xFFFFFDE1).withOpacity(0.9),
                            ]),
                            child: GradientText(
                              'Add To Bag',
                              style: const TextStyle(
                                  fontSize: 18,
                                  height: 1,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'SpaceGrotesk'),
                              gradient: LinearGradient(colors: [
                                const Color(0xFFCFE1FD).withOpacity(0.9),
                                const Color(0xFFFFFDE1).withOpacity(0.9),
                              ]),
                            )),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppWidget.typeButtonStartAction(
                          context: context,
                          input: 'Buy Now',
                          borderColor: primary,
                          icon: icArrowRight,
                          colorAsset: grey1100,
                          onPressed: () {},
                          bgColor: primary,
                          textColor: grey1100),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => AnimationClick(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              options[index],
                              style: body(color: grey1100),
                            ),
                          ),
                          const Icon(
                            Icons.add,
                            size: 32,
                            color: grey600,
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    AppWidget.divider(context, vertical: 16, color: grey300),
                itemCount: options.length),
          ),
          const SizedBox(height: 24),
          const TabBarCustom()
        ],
      ),
    );
  }
}
