import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'animated_value.dart';

class TabBar1 extends StatefulWidget {
  final Function(int page) callback;
  final List<String> tabs;
  const TabBar1({super.key, required this.callback, required this.tabs});

  @override
  State<TabBar1> createState() => _TabBarState1();
}

class _TabBarState1 extends State<TabBar1> with TickerProviderStateMixin {
  Color selectedColor = Colors.orangeAccent;
  Color disabledColor = Colors.orangeAccent.withOpacity(.25);
  late List<GlobalKey> tabKeys;
  late AnimationController tabIndicatorAnimationCon;
  late AnimationController stretchingAnimationCon;
  late Animation<double> tabIndicatorAnimation;
  late Animation<double> stretchingAnimation;
  late Tween<double> tabIndicatorTween;
  bool forward = true;
  late int index;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabIndicatorAnimationCon = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    tabIndicatorTween = Tween(begin: 0.0, end: 0.0);
    tabIndicatorAnimation = tabIndicatorTween.animate(CurvedAnimation(
        parent: tabIndicatorAnimationCon, curve: Curves.easeInOutQuad));
    stretchingAnimationCon = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    stretchingAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: stretchingAnimationCon,
        curve: Curves.easeInOutQuad,
        reverseCurve: Curves.easeOutQuad));
    stretchingAnimation.addListener(() {
      if (stretchingAnimation.isCompleted) {
        stretchingAnimationCon.reverse();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        tabIndicatorTween.begin = tabIndicatorTween.end = getX(0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    index = 0;
    tabKeys = [];
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.08,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              widget.tabs.length,
              (index) => SizedBox(
                width: screenSize.width * .25,
                child: tab(title: widget.tabs[index]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedBuilder(
              animation: tabIndicatorAnimation,
              builder: (context, _) => Transform.translate(
                offset: Offset(tabIndicatorAnimation.value, -8.0),
                child: AnimatedBuilder(
                  animation: stretchingAnimation,
                  builder: (context, _) => Transform.translate(
                    offset: Offset(
                        forward ? stretchingAnimation.value * -46.0 : 0.0, 0.0),
                    child: Container(
                      width: 8 + (stretchingAnimation.value * 46),
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: selectedColor,
                          boxShadow: [
                            BoxShadow(color: selectedColor, blurRadius: 8.0)
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void animateIndicator(int index) {
    double x = getX(index);
    tabIndicatorTween.end! < x ? forward = true : forward = false;
    tabIndicatorTween.begin = tabIndicatorTween.end;
    tabIndicatorAnimationCon.reset();
    tabIndicatorTween.end = x;
    tabIndicatorAnimationCon.forward();
    setState(() {
      forward = currentIndex < index;
      currentIndex = index;
    });
    stretchingAnimationCon.forward();
  }

  double getX(int index) {
    final RenderBox renderObject =
        tabKeys[index].currentContext?.findRenderObject() as RenderBox;
    var size = renderObject.size;
    var translation =
        renderObject.localToGlobal(Offset((size.width / 2) - 4.0, 0.0));
    debugPrint('${translation.dx}');
    return translation.dx;
  }

  Widget tab({required String title}) {
    tabKeys.add(GlobalKey());
    int iconIndex = index++;
    return GestureDetector(
      onTap: () {
        animateIndicator(iconIndex);
        widget.callback(iconIndex);
      },
      child: Stack(children: [
        Container(
          key: tabKeys[iconIndex],
          child: Text(
            title,
            style: montserratStyle.copyWith(
                fontSize: 14.0,
                color: Colors.transparent,
                fontWeight: FontWeight.w600),
          ),
        ),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          style: montserratStyle.copyWith(
              fontSize: 14.0,
              color: iconIndex == currentIndex ? selectedColor : disabledColor,
              fontWeight: FontWeight.w600),
          child: Text(
            title,
          ),
        ),
      ]),
    );
  }
}

class TabBar2 extends ConsumerStatefulWidget {
  final List<String> tabs;
  final Function(int tab)? callback;
  final int? initialPage;
  const TabBar2({super.key, required this.tabs, this.callback, this.initialPage});

  @override
  ConsumerState<TabBar2> createState() => _TabBar2State();
}

class _TabBar2State extends ConsumerState<TabBar2> {
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    currentTab = widget.initialPage??0;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
          height: screenSize.height * .04,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.tabs.length,
              itemBuilder: (context, index) => _tab(index))),
    );
  }

  Widget _tab(int index) {
    final theme = ref.watch(applicationThemeProvider);

    return GestureDetector(
      onTap: () => setState(() {
        currentTab = index;
        widget.callback?.call(index);
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: AnimatedDefaultTextStyle(
                style: outfitStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color:
                      currentTab == index ? primaryColor : theme.hintTextColor,
                ),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Text(
                  widget.tabs[index],
                ),
              ),
            ),
            AnimatedValue(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              val: currentTab == index ? 1.0 : 0.0,
              builder: (val) => Transform.translate(
                offset: const Offset(0.0, -1.0),
                child: Transform.scale(
                  scaleX: val as double?,
                  child: Container(
                    height: 1.5,
                    width: widget.tabs[index].length * 8.0,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(2.0),
                        boxShadow: const [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 4.0,
                          )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabBar3 extends ConsumerStatefulWidget {
  final List<String> tabs;
  final Function(int tab)? callback;
  final int? initialPage;
  const TabBar3({super.key, required this.tabs, this.callback, this.initialPage});

  @override
  ConsumerState<TabBar3> createState() => _TabBar3State();
}

class _TabBar3State extends ConsumerState<TabBar3> {
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    currentTab = widget.initialPage??0;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
          height: screenSize.height * .04,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: List.generate(widget.tabs.length , (index) => SizedBox(
                width: screenSize.width * .25,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => setState(() {
                    currentTab = index;
                    widget.callback?.call(index);
                  }),
                  child: Center(
                    child: AnimatedDefaultTextStyle(

                      style: outfitStyle.copyWith(
                        fontSize: currentTab == index ?18.0:14.0,
                        fontWeight:  currentTab == index ?FontWeight.w800:FontWeight.w400,
                        color:
                        currentTab == index ? primaryColor : theme.hintTextColor,
                      ),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutBack,
                      child: Text(
                        widget.tabs[index],
                      ),
                    ),
                  ),
                ),
              )))),
    );
  }

}




class Selector4 extends ConsumerStatefulWidget {
  final List<String> tabs;
  final Function(List<int> tabs)? callback;
  const Selector4({super.key, required this.tabs, this.callback});

  @override
  ConsumerState<Selector4> createState() => _Selector4State();
}

class _Selector4State extends ConsumerState<Selector4> {
  List<int> currentTabs = [];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
        height: screenSize.height * .0325,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.tabs.length,
            itemBuilder: (context, index) => _tab(index)));
  }

  Widget _tab(int index) {
    final theme = ref.watch(applicationThemeProvider);

    return GestureDetector(
      onTap: () => setState(() {
        currentTabs.contains(index) ?  currentTabs.remove(index):currentTabs.add(index);
        widget.callback?.call(currentTabs);
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: AnimatedDefaultTextStyle(
                style: outfitStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color:
                  currentTabs.contains(index) || currentTabs.isEmpty? primaryColor : theme.hintTextColor,
                ),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Text(
                  widget.tabs[index],
                ),
              ),
            ),
            AnimatedValue(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              val: currentTabs.contains(index) || currentTabs.isEmpty ? 1.0 : 0.0,
              builder: (val) => Transform.translate(
                offset: const Offset(0.0, -1.0),
                child: Transform.scale(
                  scaleX: val as double?,
                  child: Container(
                    height: 1.5,
                    width: widget.tabs[index].length * 8.0,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(2.0),
                        boxShadow: const [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 4.0,
                          )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
