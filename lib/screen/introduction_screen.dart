import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'HELLO!',
        body: 'Lorem ipsum doior sit amet,consectetur adipiscing elit,esd do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim minim veniam.',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Model'),
          ),
        ),
        image: Image.network(
            'https://img.lovepik.com/element/40100/6243.png_300.png'),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
    PageViewModel(
        title: 'WORKPLACE',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, esd do eiusmod tempor incididunt ut labore et dolore magna aloqua.Ut ad minim veniam.',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Model'),
          ),
        ),
        image: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqRR3GCadBod3BFDNWvipgrVsSXFedQ0bfQ9oXPhwhmFzVPF7f35vgOmqQrsQJL7ew5Mc&usqp=CAU'),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
    PageViewModel(
        title: 'OUR TEAM',
        body: 'Lorem ipsum dolor sit amet, consectetur adipscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ailqua.Ut enim at minim veniam.',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Model'),
          ),
        ),
        image: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmFX1cdwJx1zObB1EY6J1oHP53bPr9KvvvWA&usqp=CAU'),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOBILE & CLOUD COMPUTING'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: Text('Skiz'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  HomeScreen(),
      ),
    );
  }
}
