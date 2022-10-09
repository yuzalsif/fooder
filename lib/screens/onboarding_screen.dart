import 'package:flutter/material.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Getting Started',
            style: TextStyle(color: rwColor),
          ),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 35,
            color: rwColor,
          ),
          onTap: () {},
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(child: buildOnBoardingPage()),
          buildIndicator(),
          buildActionButton(),
        ]),
      ),
    );
  }

  Widget buildActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false)
                .completeOnboarding();
          },
          child: const Text('Skip'),
        ),
      ],
    );
  }

  Widget buildOnBoardingPage() {
    return PageView(
      controller: controller,
      children: [
        buildOnBoardingImages(
            const AssetImage('assets/fooderlich_asset/recommend.png'),
            'Check out weekly recommended recipes and what your friends are cooking!'),
        buildOnBoardingImages(
            const AssetImage('assets/fooderlich_asset/sheet.png'),
            'Cook with step by step instructions!'),
        buildOnBoardingImages(
            const AssetImage('assets/fooderlich_asset/list.png'),
            'Keep track of what you need to buy'),
      ],
    );
  }

  Widget buildOnBoardingImages(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(
        40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(
        activeDotColor: rwColor,
      ),
    );
  }
}
