import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/welcome/components/intro_widget.dart';
import 'package:frontenddermora/util/styles.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double screenWidth = 0.0;
  double screenheight = 0.0;
  int currentPageValue = 0;
  int previousPageValue = 0;

  late PageController controller;
  double _moveBar = 0.0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPageValue);
  }

  void getChangedPageAndMoveBar(int page) {
    print('page is $page');

    if (previousPageValue == 0) {
      previousPageValue = page;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < page) {
        previousPageValue = page;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = page;
        _moveBar = _moveBar - 0.14;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    final List<Widget> introWidgetsList = <Widget>[
      IntroWidget(
          screenWidth: screenWidth,
          screenheight: screenheight,
          image: 'assets/images/illustration-1.png',
          secImage: 'assets/images/logo.png',
          type: 'Welcome To Dermora',
          startGradientColor: kBlue,
          endGradientColor: kPruple,
          subText: 'Your personal assistant for all of your skin care needs'),
      IntroWidget(
          screenWidth: screenWidth,
          screenheight: screenheight,
          image: 'assets/images/yellow.png',
          secImage: 'assets/images/logo.png',
          type: 'Spa',
          startGradientColor: kOrange,
          endGradientColor: kYellow,
          subText: 'FEEL THE MAGIC OF WELLNESS'),
    ];

    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return introWidgetsList[index];
            },
            controller: controller,
            itemCount: introWidgetsList.length,
            onPageChanged: (int page) {
              getChangedPageAndMoveBar(page);
            },
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var i in introWidgetsList) slidingBar(),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn,
                margin:
                    EdgeInsets.only(bottom: 35, left: screenWidth * _moveBar),
                child: movingBar(),
              )
            ],
          )
        ],
      ))),
    );
  }

  Container movingBar() {
    return Container(
      height: 5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: screenWidth * 0.1,
      decoration: BoxDecoration(color: kwhiteGrey),
    );
  }

  Widget slidingBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 5,
      width: screenWidth * 0.1,
      decoration: BoxDecoration(color: klightGrey),
    );
  }
}
