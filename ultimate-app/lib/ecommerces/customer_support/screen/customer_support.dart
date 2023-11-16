import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

List<String> suggest = [
  'Any discount?',
  'Can I get it today?',
  'Other same',
  'Any discount?',
  'Can I get it today?',
  'Other same'
];

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  TextEditingController commentCtl = TextEditingController();
  FocusNode commentFn = FocusNode();
  bool hide = false;
  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: grey100),
        borderRadius: BorderRadius.circular(16));
  }

  List<Map<String, String>> messages = [
    {'message': 'Hello! Product still available?', 'owner': 'me'},
    {'message': 'Yes! Can I help you. Please let me know :D', 'owner': 'you'},
    {'message': 'Hello! Product still available?', 'owner': 'me'},
    {'message': 'Yes! Can I help you. Please let me know :D', 'owner': 'you'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: true,
          hasPop: true,
          onTap: () {},
          action: Image.asset(
            circlesFour,
            width: 24,
            height: 24,
            color: grey1100,
          )),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, index) {
                  return AnimationClick(
                    function: () {
                      setState(() {
                        messages
                            .add({'message': suggest[index], 'owner': 'me'});
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: grey200),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          suggest[index],
                          style: subhead(color: grey800),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 4,
                    ),
                itemCount: suggest.length),
          ),
          const SizedBox(height: 8),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                AnimationClick(
                    child: Image.asset(plusCircle, width: 40, height: 40)),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        controller: commentCtl,
                        focusNode: commentFn,
                        onSubmitted: (value) {
                          commentFn.unfocus();
                        },
                        style: body(color: grey1100),
                        decoration: InputDecoration(
                          hintText: 'Leave comment',
                          hintStyle: subhead(color: grey400),
                          fillColor: grey100,
                          filled: true,
                          contentPadding: const EdgeInsets.only(left: 16),
                          suffixIcon: AnimationClick(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset(
                                paperPlaneTilte,
                                width: 16,
                                height: 16,
                                color: grey1100,
                              ),
                            ),
                          ),
                          focusedBorder:
                              createInputDecoration(context, color: emerald1),
                          enabledBorder: createInputDecoration(context),
                          errorBorder: createInputDecoration(context,
                              color: radicalRed1),
                        )))
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(4),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.asset(
                    avtFemale,
                    width: 56,
                    height: 56,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        'No13designs shop',
                        style: const TextStyle(
                            fontSize: 24,
                            height: 1,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SpaceGrotesk'),
                        gradient: LinearGradient(colors: [
                          const Color(0xFFCFE1FD).withOpacity(0.9),
                          const Color(0xFFFFFDE1).withOpacity(0.9),
                        ]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Online 7 mins ago',
                        style: body(color: grey800),
                      )
                    ],
                  ),
                ),
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: primary),
                    child: Image.asset(
                      icArrowRight,
                      width: 24,
                      height: 24,
                      color: grey1100,
                    ),
                  ),
                )
              ],
            ),
          ),
          hide
              ? const SizedBox()
              : Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(french_fries_2,
                                    width: 80, height: 80),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Ice Cream Jolibee',
                                      style: title4(color: grey1100),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$2.34',
                                          style: title4(color: corn1),
                                        ),
                                        Text(
                                          '⭐️ 4/5',
                                          style: subhead(
                                              color: grey1100,
                                              fontWeight: '400'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AppWidget.divider(context,
                              vertical: 16, color: grey400),
                          Row(
                            children: [
                              Expanded(
                                child: AppWidget.typeButtonStartAction(
                                    context: context,
                                    input: 'Add To Bag',
                                    borderColor: grey300,
                                    onPressed: () {},
                                    bgColor: grey300,
                                    textColor: grey1100),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 2,
                                child: AppWidget.typeButtonStartAction(
                                    context: context,
                                    input: 'Buy Now',
                                    borderColor: primary,
                                    onPressed: () {},
                                    bgColor: primary,
                                    textColor: grey1100),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        right: 8,
                        top: 8,
                        child: AnimationClick(
                          function: () {
                            setState(() {
                              hide = true;
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            size: 24,
                            color: grey800,
                          ),
                        ))
                  ],
                ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                itemBuilder: (context, index) {
                  final bool isMe = messages[index]['owner'] == 'me';
                  return Row(
                    children: [
                      if (isMe) ...[
                        const Expanded(child: SizedBox()),
                      ],
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16),
                                topRight: const Radius.circular(16),
                                bottomLeft: Radius.circular(isMe ? 16 : 0),
                                bottomRight: Radius.circular(isMe ? 0 : 16)),
                            color: isMe ? green : grey400),
                        child: Column(
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              messages[index]['message']!,
                              style: body(color: grey1100),
                            ),
                            if (index == 1) ...[
                              const SizedBox(height: 8),
                              AnimationClick(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  decoration: BoxDecoration(
                                      color: grey300,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Text(
                                    'Check shop',
                                    style: subhead(color: grey1100),
                                  ),
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                      if (!isMe) ...[
                        const Expanded(child: SizedBox()),
                      ]
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: index < messages.length - 1 &&
                              messages[index]['owner'] !=
                                  messages[index + 1]['owner']
                          ? 24
                          : 8,
                    ),
                itemCount: messages.length),
          ),
        ],
      ),
    );
  }
}
