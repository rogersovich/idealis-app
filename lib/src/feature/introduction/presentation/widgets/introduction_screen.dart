import 'package:flutter/material.dart';
import 'package:idealis_app/src/core/constant/color_constant.dart';
import 'package:idealis_app/src/feature/home/presentation/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0);

    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor),
      pageColor: Colors.white,
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      bodyAlignment: Alignment.topCenter,
      imageAlignment: Alignment.bottomCenter,
      imagePadding: const EdgeInsets.only(bottom: 0),
      bodyFlex: 1,
      imageFlex: 2,
      footerFlex: 0,
    );

    List<PageViewModel> listPagesViewModel(BuildContext context) {
      return [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('illus_4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('illus_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('illus_3.png'),
          decoration: pageDecoration,
          footer: Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () => _onIntroEnd(context),
              style: ElevatedButton.styleFrom(
                  foregroundColor: kPrimaryColor,
                  backgroundColor: kPrimaryColor.withOpacity(
                      0.1), // This is the color of the text and icons
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        4), // Set the border radius to 0 for no border
                  ),
                  elevation: 0),
              child: const Text(
                "Let's Go!",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        )
      ];
    }

    return IntroductionScreen(
      pages: listPagesViewModel(context),
      showBackButton: false,
      showNextButton: false,
      showDoneButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      globalBackgroundColor: Colors.white,
      controlsPadding: const EdgeInsets.only(bottom: 30),
      dotsDecorator:  DotsDecorator(
        size: const Size(10.0, 10.0),
        color: kGrayColor,
        activeColor: kPrimaryColor,
        activeSize: const Size(28.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
