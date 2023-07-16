import 'dart:developer';
import 'dart:math';
import 'dart:ui';
import 'package:animated_icon/animated_icon.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:resumemaker/models/singleResume.dart';
import 'package:resumemaker/utils/const/textStyle.dart';
import 'package:resumemaker/utils/helper/homePageHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resumemaker/utils/loginPageAnimation.dart';
import 'package:resumemaker/view/widgets/listDetail.dart';
import 'package:resumemaker/view/widgets/resume_item.dart';
import 'package:showcaseview/showcaseview.dart';

import '../utils/const/size.dart';

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
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      //   centerTitle: true,
      //   title: Container(
      //     width: 300.0,
      //     child: Center(
      //       child: DefaultTextStyle(
      //         textAlign: TextAlign.center,
      //         style: TextStyle1(
      //             color: Colors.white, fontWeight: FontWeight.bold, size: 15),
      //         child: AnimatedTextKit(
      //           isRepeatingAnimation: true,
      //           repeatForever: true,
      //           animatedTexts: [
      //             TypewriterAnimatedText(
      //               'Build your resume',
      //               speed: Duration(milliseconds: 200),
      //             ),
      //             TypewriterAnimatedText('make your future',
      //                 speed: Duration(milliseconds: 200)),
      //           ],
      //           onTap: () {
      //             print("Tap Event");
      //           },
      //         ),
      //       ),
      //     ),
      //   ),

      //   // Text('Resumes  List',
      //   //           style: TextStyle1(
      //   //               color: Colors.white,
      //   //               size: 15,
      //   //            //   fontWeight: FontWeight.bold
      //   //               )),
      // ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              color:  Color.fromRGBO(143, 148, 251, 1),
             // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
            ),

            height: DeviceSize.getHeight(context) * 0.15,
            width:DeviceSize.getWidth(context) ,
            child:
           
                Center(
                  child: DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: TextStyle1(
                        color: Colors.white, fontWeight: FontWeight.bold, size: 15),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Build your resume',
                          speed: Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText('make your future',
                            speed: Duration(milliseconds: 200)),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
           
            ),
        
        
          //  Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // children: [
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
          //     Container(
          //   height: 70,
          //  // padding: const EdgeInsets.symmetric(vertical: 10),

          //  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //   child: SafeArea(
          //     child: Center(
          //       child: Text('Resumes List',
          //           style: TextStyle1(
          //               color: Colors.black,
          //               size: 15,
          //               fontWeight: FontWeight.bold)),
          //     ),
          //   ),
          // ),
          //  ],
          // ),
          //  Padding(
          //   padding: EdgeInsets.all(20),
          //   child: frostedGlassEffectDemo(context)
          //   ),
      
        Container(
              
             margin: EdgeInsets.only(top: 85),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25) , topRight: Radius.circular(25)),
                 color: Colors.white,
                 
              ),
              child: Container(
               margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25) , topRight: Radius.circular(25)),
              //   color: Colors.white,
                 
              ),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 5),
                 
                    
                  itemCount: 7,
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return FadeAnimation(
                        0.2,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 10),
                          child: ResumeTile(
                            index: index,
                            showCaseKey: _two,
                            resume: Resumes.first,
                            showCaseDetail: true,
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      child: FadeAnimation(
                          0.2,
                          ResumeTile(
                            index: index,
                            showCaseKey: _two,
                            resume: Resumes[index % Resumes.length],
                          )),
                    );
                  },
                ),
              ),
            ),
         
        ],
      ),
      // ),
      floatingActionButton: Showcase(
        key: _one,
        title: 'making resume',
        description: 'Click here to make resume',
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton.extended(
          label: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  // width: 250.0,
                  child: DefaultTextStyle(
                    style: TextStyle1(
                      color: Colors.white,
                      size: 15,
                    ),
                    child: Container(
                      width: 70,
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText('create',
                              speed: Duration(milliseconds: 200)),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                ),
              ),
              AnimateIcon(
                color: Colors.purple[100]!,
                //key: UniqueKey(),
                onTap: () {},
                iconType: IconType.continueAnimation,
                height: 20,
                width: 20,
                // color:

                animateIcon: AnimateIcons.edit,
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
