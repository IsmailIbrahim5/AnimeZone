import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Selector extends ConsumerStatefulWidget {
  final List<String> values;
  final String? initialValue;
  final Function(int index) callback;
  final bool dismissible;
  const Selector({super.key, required this.values, required this.callback,  this.initialValue , this.dismissible = true});

  @override
  ConsumerState<Selector> createState() => _SelectorState();
}

class _SelectorState extends ConsumerState<Selector> {
  int selectedIndex = -1;
  @override
  void initState() {
    super.initState();
    if(widget.initialValue != null) selectedIndex = widget.values.indexOf(widget.initialValue!);
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: screenSize.height * .06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: theme.foregroundColor,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad,
              left:
                  (constraints.maxWidth / widget.values.length) * selectedIndex,
              width: constraints.maxWidth / widget.values.length,
              top: 0,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0 , vertical:4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: primaryColor,
                    boxShadow: const [
                      BoxShadow(color: primaryColor, blurRadius: 4.0)
                    ]),
              ),
            ),
            Row(
              children: List.generate(
                widget.values.length,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex == index && widget.dismissible) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                        }
                        widget.callback(selectedIndex);
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                            style: outfitStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : theme.hintTextColor,
                            ),
                            child: Text(
                              widget.values[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Selector2 extends ConsumerStatefulWidget {
  final List<String> values;
  final String? initialValue;
  final Function(int index)? callback;
  const Selector2({super.key, required this.values, this.callback,  this.initialValue});

  @override
  ConsumerState<Selector2> createState() => _Selector2State();
}

class _Selector2State extends ConsumerState<Selector2> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    if(widget.initialValue != null) selectedIndex = widget.values.indexOf(widget.initialValue!);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(applicationThemeProvider);
    return Column(
        children: List.generate(
      (widget.values.length / 4).round(),
      (row) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: List.generate(
            (row == (widget.values.length / 4).round() - 1
                ? widget.values.length % 4
                : 4),
            (column) => Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => setState(() {
                  if(selectedIndex == (row * 4) + column){
                    selectedIndex = -1;
                  }
                  else{
                    selectedIndex = (row * 4) + column;
                  }
                  widget.callback?.call(selectedIndex);
                }),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutQuad,
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                            color: selectedIndex == (row * 4) + column
                                ? primaryColor
                                : theme.hintTextColor),
                        color: primaryColor.withOpacity( selectedIndex == (row * 4) + column
                            ? 1.0
                            : 0.0)
                      ),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOutBack,
                        scale: selectedIndex == (row * 4) + column ? 1.0 : 0.0,
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutQuad,
                      style: outfitStyle.copyWith(
                          color: selectedIndex == (row * 4) + column
                              ? primaryColor
                              : theme.hintTextColor,
                        fontSize: 14.0
                      ),
                      child: Text(
                        widget.values[(row * 4) + column],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
