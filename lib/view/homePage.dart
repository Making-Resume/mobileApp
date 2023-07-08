import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:resumemaker/models/singleResume.dart';
import 'package:resumemaker/utils/const/textStyle.dart';
import 'package:resumemaker/utils/helper/homePageHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resumemaker/view/widgets/listDetail.dart';
import 'package:showcaseview/showcaseview.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      onStart: (index, key) {
        log('onStart: $index, $key');
      },
      onComplete: (index, key) {
        log('onComplete: $index, $key');
        if (index == 4) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            ),
          );
        }
      },
      blurValue: 1,
      builder: Builder(builder: (context) => const homePage()),
      autoPlayDelay: const Duration(seconds: 3),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  List<singleResume> Resumes = [];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //Start showcase view after current widget frames are drawn.
    //NOTE: remove ambiguate function if you are using
    //flutter version greater than 3.x and direct use WidgetsBinding.instance
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)
          .startShowCase([_one, _two, _three, _four, _five]),
    );
    Resumes = [
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
      ),
    ];
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                //   width: 80,
                //   height: 55,
                //   decoration: BoxDecoration(
                //     // shape: BoxShape.circle,
                //     borderRadius: BorderRadius.circular(10),
                //     color: Color(0xffFCD8DC),
                //     image: DecorationImage(
                //       fit: BoxFit.fill,
                //       image: AssetImage('assets/images/logo.png')
                //     ),
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                  child: Center(
                    child: const Text(
                      'Resumes List',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return showcaseResumeTile(
                        _three, true, context, Resumes.first);
                  }
                  return ResumeTile(
                    resume: Resumes[index % Resumes.length],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Showcase(
        key: _one,
        title: 'making resume',
        description: 'Click here to make resume',
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          onPressed: () {
            setState(() {
              /* reset ListView to ensure that the showcased widgets are
               * currently rendered so the showcased keys are available in the
               * render tree. */
              scrollController.jumpTo(0);
              ShowCaseWidget.of(context)
                  .startShowCase([_one, _two, _three, _four, _five]);
            });
          },
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }

  GestureDetector showcaseResumeTile(GlobalKey<State<StatefulWidget>> key,
      bool showCaseDetail, BuildContext context, singleResume mail) {
    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const Detail(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Showcase(
            key: key,
            description: 'Tap to check resume',
            tooltipPosition: TooltipPosition.top,
            disposeOnTap: true,
            onTargetClick: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const Detail(),
                ),
              ).then((_) {
                setState(() {
                  ShowCaseWidget.of(context).startShowCase([_four, _five]);
                });
              });
            },
            child: ResumeTile(
              resume: mail,
              showCaseKey: _four,
              showCaseDetail: showCaseDetail,
            )),
      ),
    );
  }
}

class SAvatarExampleChild extends StatelessWidget {
  const SAvatarExampleChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 60,
        height: 80,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Color.fromRGBO(143, 148, 251, .6) ,width: 2),
          color:Color.fromRGBO(143, 148, 251, .6),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: NetworkImage(
          //     'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
          //     scale: 10,
          //   ),
          // ),
        ),
        child: AspectRatio(
          aspectRatio: 16/ 9,
          child: Image(
            image: NetworkImage('https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg'),
            fit: BoxFit.contain, // use this
          ),
        ),
      ),
    );
  }
}

class ResumeTile extends StatelessWidget {
   ResumeTile(
      {required this.resume,
      this.showCaseDetail = false,
      this.showCaseKey,
      Key? key})
      : super(key: key);
  final bool showCaseDetail;
  final GlobalKey<State<StatefulWidget>>? showCaseKey;
  final singleResume resume;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 16, top: 8, bottom: 8),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (showCaseDetail)
                  Showcase.withWidget(
                    key: showCaseKey!,
                    height: 50,
                    width: 140,
                    targetShapeBorder: const CircleBorder(),
                    targetBorderRadius: const BorderRadius.all(
                      Radius.circular(150),
                    ),
                    container: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFCD8DC),
                          ),
                          child: Center(
                            child: Text(
                              'S',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Your sender's profile ",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    child: const SAvatarExampleChild(),
                  )
                else
                  const SAvatarExampleChild(),
                const Padding(padding: EdgeInsets.only(left: 8)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        resume.title!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height:10,
                      ),
                      Text(resume.type!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle1(
                            color: Colors.grey,
                            size: 14,
                          )),
                      // Text(
                      //   resume.description!,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.normal,
                      //     color:
                      //         // resume.isUnread
                      //         //     ? Theme.of(context).primaryColor
                      //         //  :
                      //         Colors.black,
                      //     fontSize: 15,
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 50,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Text(
                  resume.date!,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Icon(
                  //  resume.isUnread ? Icons.star :
                  Icons.remove_red_eye,
                  color:
                      //mail.isUnread ? const Color(0xffFBC800) :
                      Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
