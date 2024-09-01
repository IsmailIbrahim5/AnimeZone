import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/icon_switcher.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../element/presentation/widgets/element_widget.dart';

class CollectionDetails extends ConsumerStatefulWidget {
  final String title;

  final List<int> elementIds;
  final ElementType elementType;
  const CollectionDetails(
      {super.key,
        required this.title,
        required this.elementIds, required this.elementType});

  @override
  ConsumerState<CollectionDetails> createState() => _CollectionDetailsState();
}

class _CollectionDetailsState extends ConsumerState<CollectionDetails> {
  bool grid = false;

  int page =1;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return Material(
      color: theme.backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * (7 / 63),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.foregroundColor,
                        borderRadius: BorderRadius.circular(18.0),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(.25),
                            blurRadius: 8.0,
                          )
                        ],
                      ),
                      margin: const EdgeInsets.only(left: 16.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: primaryColor,
                          size: 22.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.title,
                      style: outfitStyle.copyWith(
                        color: theme.titleTextColor,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 4.0,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:   Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: IconButton(
                        highlightColor: accentColor.withOpacity(.2),
                        icon: IconSwitcher(
                          icon: Icon(
                            key: Key('grid_icon_$grid'),
                            grid ? Icons.list_rounded : Icons.grid_view_rounded,
                            color: primaryColor,
                            size: 22.0,
                          ),
                        ),
                        onPressed: () => setState(() {
                          grid = !grid;
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Expanded(
            child:  AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: grid
          ? GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: screenSize.height * .435),
          scrollDirection: Axis.vertical,
          itemCount: widget.elementIds.length,
          itemBuilder: (context, index) =>
          ElementWidget1(id: widget.elementIds[index], elementType: widget.elementType,),
          )
              : ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
    itemCount: widget.elementIds.length,
    itemBuilder: (context, index) =>
    ElementWidget2(id: widget.elementIds[index], elementType: widget.elementType,),
    ),
    )
          )
        ],
      ),
    );
  }
}
