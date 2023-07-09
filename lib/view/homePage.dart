import 'dart:developer';
import 'dart:math';
import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:resumemaker/models/singleResume.dart';
import 'package:resumemaker/utils/const/textStyle.dart';
import 'package:resumemaker/utils/helper/homePageHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resumemaker/view/widgets/listDetail.dart';
import 'package:resumemaker/view/widgets/resume_item.dart';
import 'package:showcaseview/showcaseview.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      onStart: (index, key) {
        //  log('onStart: $index, $key');
      },
      onComplete: (index, key) {
        //log('onComplete: $index, $key');
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
  List<singleResume> Resumes = [];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //Start showcase view after current widget frames are drawn.
    //NOTE: remove ambiguate function if you are using
    //flutter version greater than 3.x and direct use WidgetsBinding.instance
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([
        _one,
        _two,
      ]),
    );
    Resumes = [
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
        picture:
            'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
        picture:
            'https://www.latextemplates.com/actions/action_fetch_template_image?image=1&template=medium-length-professional-cv',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
        picture:
            'https://images.template.net/wp-content/uploads/2015/06/Free-Latex-Resume-Templates-Download.jpg',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
        picture:
            'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
        picture:
            'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
        picture:
            'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
        picture:
            'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
      ),
      singleResume(
        title: 'applyResume',
        description: 'this is a resume',
        type: 'academic',
        date: '1 May',
        picture:
            'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
      ),
      singleResume(
        title: 'jobApply',
        description: 'this is a resume',
        type: 'work',
        date: '2 May',
        picture:
            'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
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
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Center(
                    child: Text('Resumes List',
                        style: TextStyle1(
                            color: Colors.black,
                            size: 15,
                            fontWeight: FontWeight.bold)),
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
                    return ResumeTile(
                    showCaseKey: _two,
                    resume: Resumes.first,
                    showCaseDetail: true,
                  
                  );
                  }
                  return ResumeTile(
                    showCaseKey: _two,
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
        child: FloatingActionButton.extended(
          label: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text('Add Resume'),
              ),
              AnimateIcon(
                color: Colors.purple[100]!,
                //key: UniqueKey(),
                onTap: () {},
                iconType: IconType.continueAnimation,
                height: 30,
                width: 30,
                // color:

                animateIcon: AnimateIcons.add,
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          onPressed: () {
            setState(() {
              /* reset ListView to ensure that the showcased widgets are
               * currently rendered so the showcased keys are available in the
               * render tree. */
              scrollController.jumpTo(0);
              ShowCaseWidget.of(context).startShowCase([_two]);
            });
          },
        ),
      ),
    );
  }

  // GestureDetector showcaseResumeTile(GlobalKey<State<StatefulWidget>> key,
  //     bool showCaseDetail, BuildContext context, singleResume mail) {
  //   return GestureDetector(
  //       onTap: () {
  //         Navigator.push<void>(
  //           context,
  //           MaterialPageRoute<void>(
  //             builder: (_) => const Detail(),
  //           ),
  //         );
  //       },
  //       child: ResumeTile(
  //         resume: mail,
  //         showCaseKey: _two,
  //         showCaseDetail: showCaseDetail,
  //       )
  //       //child:

  //       //  Showcase(
  //       //     key: key,
  //       //     description: 'Tap to check resume',
  //       //     tooltipPosition: TooltipPosition.top,
  //       //     disposeOnTap: true,
  //       //     onTargetClick: () {
  //       //       Navigator.push<void>(
  //       //         context,
  //       //         MaterialPageRoute<void>(
  //       //           builder: (_) => const Detail(),
  //       //         ),
  //       //       );
  //       //     },
  //       //     child:

  //       //),

  //       );
  // }
}
