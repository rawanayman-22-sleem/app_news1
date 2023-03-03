import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import '../../../constant.dart';
import '../home/LayoutScreen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  late Material materialButton;
  late int index;
  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle, ), ), ),);
  }
  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return LayoutScreen();
          }));
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Get Started',
            style: defaultProceedButtonTextStyle,),),),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: [
          PageModel(
            widget: DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Image.asset("assets/imags/Ims.png"),
                      Positioned(
                        width: 250,
                        child: RichText(
                          text: TextSpan(
                            text: 'Get the latest news from ',
                            style: TextStyle( fontSize: 40, color: white,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: 'reliable sources',
                                style: TextStyle(fontSize: 40, color: mainColor),),
                            ],
                          ),
                        ),
                        bottom: 100,),
                    ],
                  ),),),),
          ),
          PageModel(
            widget: DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Image.asset("assets/imags/Ims (1).png"),
                      Positioned(
                        child: RichText(
                          text: TextSpan(
                            text: 'Get the latest news from ',
                            style: TextStyle( fontSize: 40, color: white, fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'reliable sources',
                                  style: TextStyle(fontSize: 40, color: mainColor)),
                            ],),),
                        bottom: 100,
                      ),
                    ],
                  ),),),),
          ),
          PageModel(
            widget: DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Image.asset("assets/imags/Ims (2).png"),
                      Positioned(
                        child: RichText(
                          text: TextSpan(
                            text: 'Get the latest news from ',
                            style: TextStyle(
                                fontSize: 40,
                                color: white,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'reliable sources',
                                  style: TextStyle(fontSize: 40, color: mainColor)),
                            ],
                          ),
                        ),
                        bottom: 200,
                      ),
                    ],
                  ),),),),),
        ],
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: background,
              border: Border.all(
                width: 0.0,
                color: background,
              ),
            ),
            child: ColoredBox(
              color: background,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        indicatorDesign: IndicatorDesign.line(
                          lineDesign: LineDesign(
                            lineType: DesignType.line_uniform,
                          ),
                        ),
                      ),
                    ),
                    index == pagesLength - 1
                        ? _signupButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}