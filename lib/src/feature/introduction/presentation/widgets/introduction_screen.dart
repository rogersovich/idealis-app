import 'package:flutter/material.dart';
import 'package:idealis_app/src/feature/home/presentation/screens/home_screen.dart';
// import 'package:idealis_app/routes.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Introduction Page')),
  //     body: Center(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.pushNamed(context, Routes.home);
  //             },
  //             child: const Text('Go to Details'),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
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

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Color(0xff2483fb)),
      pageColor: Colors.white,
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      bodyAlignment: Alignment.topCenter,
      imageAlignment: Alignment.bottomCenter,
      imagePadding: EdgeInsets.only(bottom: 0),
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
              child: const Text("Let's Go!"),
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
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xff2483fb),
        activeSize: Size(28.0, 10.0),
        activeShape: RoundedRectangleBorder(
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
