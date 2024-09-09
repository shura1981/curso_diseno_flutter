import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_slider/provider/page_view_provider.dart';

 

class SliderShowScreen extends StatelessWidget {
  const SliderShowScreen({Key? key}) : super(key: key);
  static const nameRoute = '/slider-show-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliderShowScreen'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => PageViewProvider(),
        child: Center(
          child: Column(
            children: [Expanded(child: _Slides()), const _Dots()],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageViewProvider>(context, listen: false);
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => provider.setCurrentPage(0), child: const _Dot(0)),
          GestureDetector(
              onTap: () => provider.setCurrentPage(1), child: const _Dot(1)),
          GestureDetector(
              onTap: () => provider.setCurrentPage(2), child: const _Dot(2)),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageViewProvider>(context);
const sizeCurrent= 12.0;
const size= 10.0;


    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: provider.currentPage == index ? sizeCurrent : size,
      height: provider.currentPage == index ? sizeCurrent : size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: index == provider.currentPage ? Colors.blue : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: PageView(
        controller: Provider.of<PageViewProvider>(context, listen: false).controller,
        children: const [
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-2.svg'),
          _Slide('assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.svg);

  final String svg;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
