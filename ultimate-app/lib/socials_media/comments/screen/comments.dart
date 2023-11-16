import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/unfocus_click.dart';

List<Map<String, String>> comments = [
  {
    'name': 'Albert Flores',
    'comment': 'Obsessed: Building a Brand People Love from Day One',
    'avt': avtMale5,
    'heart': '139',
    'reply': '248',
    'time': '15:00'
  },
  {
    'name': 'Esther Howard',
    'comment': 'The Art of Doing Nothing',
    'avt': avtMale4,
    'heart': '139',
    'reply': '248',
    'time': '13:00'
  },
  {
    'name': 'Leslie Alexander',
    'comment':
        'Confronting Ageism in the Creative Industry: 5 Invaluable Lessons Learned from Getting Older',
    'avt': avtMale3,
    'heart': '139',
    'reply': '248',
    'time': '12:00'
  },
  {
    'name': 'Cody Fisher',
    'comment':
        'How to Channel a Daily Vision into a 20-Year Photography Career',
    'avt': avtMale2,
    'heart': '139',
    'reply': '248',
    'time': '7:00'
  },
  {
    'name': 'Albert Flores',
    'comment': 'Obsessed: Building a Brand People Love from Day One',
    'avt': avtMale,
    'heart': '139',
    'reply': '248',
    'time': '5:00'
  },
];

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  TextEditingController commentCtl = TextEditingController();
  FocusNode commentFn = FocusNode();
  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: grey100),
        borderRadius: BorderRadius.circular(16));
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        appBar: AppWidget.createSimpleAppBar(
            context: context,
            hasLeading: true,
            hasPop: true,
            title: '508 Comments'),
        body: Column(
          children: [
            const SizedBox(height: 8),
            AnimationClick(
              child: Container(
                width: width,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage(
                          avtMale5,
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sing a song 13',
                            style: title4(color: grey100),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Jane Cooper',
                            style: subhead(color: grey400),
                          ),
                        ],
                      ),
                    ),
                    AnimationClick(
                        child: Image.asset(
                      playCircle,
                      width: 40,
                      height: 40,
                      color: grey100,
                    ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemCount: comments.length,
                separatorBuilder: (context, index) => AppWidget.divider(context,
                    vertical: 16, color: grey300.withOpacity(0.5)),
                itemBuilder: (context, index) => AnimationClick(
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage(
                                  comments[index]['avt']!,
                                )),
                            Positioned(
                                bottom: 2,
                                right: 0,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: grey1100,
                                      borderRadius: BorderRadius.circular(32)),
                                  child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                          color: stPatricksBlue,
                                          borderRadius:
                                              BorderRadius.circular(32))),
                                ))
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      comments[index]['name']!,
                                      style: headline(color: grey1100),
                                    ),
                                  ),
                                  Text(
                                    comments[index]['time']!,
                                    style: subhead(color: grey600),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                comments[index]['comment']!,
                                style: subhead(color: grey800),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  AnimationClick(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          heart2,
                                          width: 20,
                                          height: 20,
                                          color: grey600,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          comments[index]['heart']!,
                                          style: subhead(color: grey600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: AnimationClick(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            chatCircleDots,
                                            width: 20,
                                            height: 20,
                                            color: grey600,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            comments[index]['reply']!,
                                            style: subhead(color: grey600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
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
            )
          ],
        ),
      ),
    );
  }
}
