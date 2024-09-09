import 'package:flutter/material.dart';
import 'package:taller1/widgets/widgets.dart';

class SliderShowScreen extends StatelessWidget {
  const SliderShowScreen({Key? key}) : super(key: key);
  static const nameRoute = '/slider-show-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliderShowScreen'),
      ),
      body:  const Column(
        children: [
          Expanded(
            child: _SliderOne(),
          ),
            Expanded(
            child: _SliderTwo(),
          ),
        ],
      ),
    );
  }
}

class _SliderTwo extends StatelessWidget {
  const _SliderTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSliderShow(
      colorFocus: const Color.fromARGB(255, 132, 240, 0),
      slides: [
        const Slide('assets/svgs/slide-1.svg'),
        const Slide('assets/svgs/slide-2.svg'),
        const Slide('assets/svgs/slide-3.svg'),
        Container(
          color: Colors.red,
          child: const Center(
            child: Text('Slide 4', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }
}

class _SliderOne extends StatelessWidget {
  const _SliderOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSliderShow(
      colorFocus: Colors.pink,
      slides: [
        const Slide('assets/svgs/slide-1.svg'),
        const Slide('assets/svgs/slide-2.svg'),
        const Slide('assets/svgs/slide-3.svg'),
        Container(
          color: Colors.red,
          child: const Center(
            child: Text('Slide 4', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }
}


