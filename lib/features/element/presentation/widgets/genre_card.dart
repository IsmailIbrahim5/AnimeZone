import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/pages/collection_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreCard extends ConsumerWidget {
  final Color color;
  final String title;
  final String image;
  final ElementType type;
  const GenreCard({super.key, required this.color, required this.title, required this.image , required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () =>  Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
              opacity: animation,
              child: CollectionDetails(genre: title.replaceAll('\n', ' ') , elementType:type),
            ),
      )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        height: screenSize.height * .1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(.75),
              color
            ]
          ),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  color: color.withOpacity(.25),
                  blurRadius: 8.0,
                  spreadRadius: 4.0
              )
            ]
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FractionalTranslation(
                translation: const Offset(-0.1 , -.15),
                child: Transform.scale(
                  scale: 1.3,
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    title,
                    style: montserratStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
