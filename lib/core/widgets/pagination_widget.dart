import 'dart:async';

import 'package:animezone/config/styles/styles.dart';
import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  final int length;
  final int initialPage;
  final Function(int index) callback;
  const Pagination(
      {super.key,
      required this.length,
      this.initialPage = 0,
      required this.callback});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  late final PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
  }

  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Stack(alignment: Alignment.center, children: [
      FutureBuilder(
        future: initializeController(),
        builder: (context, snapshot) => snapshot.hasData
            ? Positioned(
                right: screenSize.width / 2 + screenSize.width * .075 + 8.0,
                child: AnimatedScale(
                  scale: _currentPage == 0 ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: _currentPage == 0
                      ? Curves.easeOut
                      : Curves.easeOutBack,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentPage--;
                      });
                      _pageController.animateToPage(_currentPage,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut);
                      widget.callback(_currentPage+1);
                    },
                    child: Container(
                        width: screenSize.width * .1,
                        height: screenSize.width * .1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            color: Colors.white),
                        padding: const EdgeInsets.all(
                          4.0,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: primaryColor,
                          size: 14.0,
                        )),
                  ),
                ),
              )
            : const SizedBox(),
      ),
      Center(
        child: AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) => Container(
              width: screenSize.width * .15,
              height: screenSize.width * .15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      primaryColor,
                      accentColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              child: PageView.builder(
                itemCount: widget.length,
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: outfitStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.white),
                    child: Text(
                      '${index+1}',
                    ),
                  ),
                ),
              )),
        ),
      ),
      FutureBuilder(
        future: initializeController(),
        builder: (context, snapshot) => snapshot.hasData
            ? Positioned(
                left: screenSize.width / 2 + screenSize.width * .075 + 8.0,
                child: AnimatedScale(
                  scale: _currentPage == widget.length-1 ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: _currentPage == widget.length-1
                      ? Curves.easeOut
                      : Curves.easeOutBack,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentPage++;
                      });
                      _pageController.animateToPage(_currentPage,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut);
                      widget.callback(_currentPage+1);
                    },
                    child: Container(
                        width: screenSize.width * .1,
                        height: screenSize.width * .1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            color: Colors.white),
                        padding: const EdgeInsets.all(
                          4.0,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primaryColor,
                          size: 14.0,
                        )),
                  ),
                ),
              )
            : const SizedBox(),
      )
    ]);
  }
}
