import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageURL;

  SlideInfo(
      {required this.title, required this.caption, required this.imageURL});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Buscar la comida',
      caption: 'Anim duis adipisicing laboris ea est fugiat est elit velit.',
      imageURL: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rápida',
      caption:
          'Anim aliqua minim enim sint irure dolor commodo aute labore laborum nostrud deserunt.',
      imageURL: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption: 'Ipsum non id id amet.',
      imageURL: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics:
                const BouncingScrollPhysics(), //Para tener el mismo comportamiento en IOS y Android
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageURL: slideData.imageURL))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Omitir'),
                onPressed: () => context.pop(),
              )),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageURL;
  const _Slide(
      {required this.title, required this.caption, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageURL)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
