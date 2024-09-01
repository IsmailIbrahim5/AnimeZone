import 'dart:math';

import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/sequence_animation_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/styles/styles.dart';


class BottomAppBar6 extends ConsumerStatefulWidget {
  final PageController controller;
  final Function(int page) callback;
  const BottomAppBar6({super.key,required this.controller, required this.callback});

  @override
  ConsumerState<BottomAppBar6> createState() => _BottomAppBarState6();
}

double iconSize = 0.0;
Color disabledColor = const Color(0xFFCECECE);


class _BottomAppBarState6 extends ConsumerState<BottomAppBar6>
    with SingleTickerProviderStateMixin {

  final List<Tab> tabs = [
    Tab(primaryColor, const AssetImage('assets/icons/anime.png'), 'Anime'),
    Tab(primaryColor, const AssetImage('assets/icons/manga.png'), 'Manga'),
    Tab(primaryColor, const AssetImage('assets/icons/articles.png'), 'News'),
    Tab(primaryColor, const AssetImage('assets/icons/library.png'), 'Library'),
  ];

  Size? screenSize;
  late final AnimationController animationController;
  late final Animation<double> animation;
  double page = 0.0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this , duration: const Duration(milliseconds: 600));
    animation = CurvedAnimation(parent: animationController, curve: SineCurve());
    animationController.addListener(() {
      if(animationController.isCompleted){
        animationController.reset();
      }
    });
    widget.controller.addListener((){
      if((widget.controller.page ?? 0.0 ) < page) {
        if (widget.controller.page?.floor() != currentIndex) {
          setState(() {
            currentIndex = widget.controller.page!.floor();
          });
        }
      }else{
        if (widget.controller.page?.ceil() != currentIndex) {
          setState(() {
            currentIndex = widget.controller.page!.ceil();
          });
        }
      }
      page = widget.controller.page??0.0;
    },);
  }


  @override
  Widget build(BuildContext context) {
    if(screenSize == null) {
      screenSize = MediaQuery
          .of(context)
          .size;
      iconSize = screenSize!.width / 15;
    }
    final theme = ref.watch(applicationThemeProvider);
    return Container(
      decoration:  BoxDecoration(
          color: theme.foregroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0))
      ),
      child: Stack(alignment: Alignment.center, children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                List.generate(tabs.length, (index) => tabIcon(index))),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            List.generate(tabs.length, (index) => tabText(index))),
      ]),
    );
  }


  Widget tabIcon(int index) {
    return GestureDetector(
      onTap: () {

       animationController.forward(from: animationController.value);
       widget.callback(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutQuad,
        padding: EdgeInsets.symmetric(vertical: iconSize / 4, horizontal: iconSize / 2),
        decoration: BoxDecoration(
            color: tabs[index]
                .color
                .withOpacity(index == currentIndex ? 0.2 : 0.0),
            borderRadius: BorderRadius.circular(iconSize)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Transform.scale(
                scale: 1.0 + ((index ==  currentIndex ? animation.value > 0 ? 0.1: 0.25:0.0) * animation.value),
                child: child,
              ),
              child: IconAnimated(
                icon: tabs[index].icon,
                color: index ==  currentIndex ? tabs[index].color : disabledColor,
                size: iconSize,
              ),
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutQuart,
              padding: EdgeInsets.symmetric(horizontal: index ==  currentIndex ? iconSize / 2 : 0.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutQuart,
                    style: montserratStyle.copyWith(
                      color: Colors.transparent,
                      fontWeight: FontWeight.w600,
                      fontSize: index == currentIndex ? iconSize / 2.5 : 0.0,
                    ),
                    child: Text(
                      tabs[index].title,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget tabText(int index) {
    return IgnorePointer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: iconSize / 4, horizontal: iconSize / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: tabs[index].icon,
              color: Colors.transparent,
              height: iconSize,
              width: iconSize,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: index ==  currentIndex ? iconSize / 2 : 0.0),
              child:index ==  currentIndex?
                TextToCharacters(text: tabs[index].title , color: tabs[index].color,): const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}


class IconAnimated extends StatefulWidget {
  final Color color;
  final AssetImage icon;
  final double size;
  const IconAnimated({required this.color ,required this.icon , required this.size, super.key});

  @override
  State<IconAnimated> createState() => _IconAnimatedState();
}

class _IconAnimatedState extends State<IconAnimated> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Color?> animation;
  Color prevColor = disabledColor;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    animation = ColorTween(begin: prevColor, end: prevColor).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    if(prevColor != widget.color){
      animation = ColorTween(begin: prevColor, end: widget.color).animate(animationController);
      animationController.forward(from: 0.0);
      prevColor = widget.color;
    }
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) =>  Image(
        image: widget.icon,
        color: animation.value,
        height: widget.size,
        width: widget.size,
      ),
    );
  }
}


class SineCurve extends Curve{
  @override
  double transformInternal(double t) => -sin(2 * pi * t);
}

class Tab {
  final Color color;
  final AssetImage icon;
  final String title;

  Tab(this.color, this.icon, this.title);
}


class TextToCharacters extends StatelessWidget {
  final String text;
  final Color color;
  const TextToCharacters({required this.text , required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return SequenceAnimationBuilder(
      animations: text.length,
      repeat: false,
      duration: const Duration(milliseconds: 200),
      delay: .5,
      builder: (values, [child]) =>  Row(
        children: List.generate(
          text.length,
              (index) => Transform.scale(
                      scale: values[index],
                      child: Text(
                        text[index],
                            style:montserratStyle.copyWith(
                              color:color,
                              fontWeight: FontWeight.w600,
                              fontSize: iconSize / 2.5,
                            ),
                      ),

          ),
        ),
      ),
    );
  }
}

