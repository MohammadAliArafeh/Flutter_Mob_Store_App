import 'package:flutter/material.dart';
import 'package:mob_store_app/modules/login/login_screen.dart';
import 'package:mob_store_app/shared/components/components.dart';
import 'package:mob_store_app/shared/network/local/cache_helper.dart';
import 'package:mob_store_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  late final String image;
  late final String title;
  late final String subtitle;

  BoardingModel(
      {required this.image, required this.title, required this.subtitle});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var onBoardController = PageController();

  List<BoardingModel> boardingItems = [
    BoardingModel(
        image: 'assets/images/onBoarding_1.jfif',
        title: 'title 1',
        subtitle: 'subtitle 1'),
    BoardingModel(
        image: 'assets/images/onBoarding_2.jfif',
        title: 'title 2',
        subtitle: 'subtitle 2'),
    BoardingModel(
        image: 'assets/images/onBoarding_3.png',
        title: 'title 3',
        subtitle: 'subtitle 3'),
  ];

  bool isLast = false;

  void submit(){
    CacheHelper.setData(key: 'onBoarding', value: true).then((value) {
      pushAndFinish(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                onPressed: submit,
                child: const Text('Skip')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: onBoardController,
                itemCount: boardingItems.length,
                itemBuilder: (context, index) =>
                    buildOnBoardingPage(boardingItems[index]),
                onPageChanged: (index) {
                  if (index == boardingItems.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  }
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: onBoardController,
                  count: boardingItems.length,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        onBoardController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn);
                      }
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingPage(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(model.title),
          const SizedBox(
            height: 30,
          ),
          Text(model.subtitle),
          const SizedBox(
            height: 64,
          ),
        ],
      );
}
