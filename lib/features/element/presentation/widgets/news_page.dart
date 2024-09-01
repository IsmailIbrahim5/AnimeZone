import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/articles/domain/models/news.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../articles/presenation/pages/discussion_details.dart';

class NewsPage extends ConsumerWidget {
  final int id;
  final ElementType elementType;
  const NewsPage({super.key ,required this.id , required this.elementType});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final news = ref.watch(elementNewsProvider(id: id , elementType: elementType));
    return news.when(
      data: (data) =>data.isNotEmpty? ListView.separated(
        itemCount: data.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder:  (context, index) => NewsWidget(news: data[index],),

        separatorBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0 , horizontal: 48.0),
          height: .5,
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                accentColor,
                Colors.transparent,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
          ),
        ),
      ): SizedBox(
        height: screenSize.height * .4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: screenSize.height * .125,
                child: Image.asset(
                    'assets/images/not_found.png'
                )
            ),
            const SizedBox(height: 8.0,),
            Text(
              "Couldn't find anything",
              style: outfitStyle.copyWith(
                  color: theme.textColor,
                  fontWeight: FontWeight.w300
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => const Error1(),
      loading: () => SizedBox(
          height: screenSize.height * .4,
          child: const LoadingWidget(color: primaryColor,),
      ),
    );
  }
}
class NewsWidget extends ConsumerStatefulWidget {
  final News news;
  final bool mini;
  const NewsWidget({super.key, required this.news, this.mini = false});

  @override
  ConsumerState<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends ConsumerState<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DiscussionDetails(id: int.parse(widget.news.forumUrl.split('=')[1]),),));
      },
      child: SizedBox(
        height: screenSize.height * (widget.mini  ? .2:.3),
        child: Container(
          width: screenSize.width,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenSize.width * .25,
                height: screenSize.height * (widget.mini  ? .2:.3),

                decoration: const BoxDecoration(
                ),

                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: widget.news.image.imageUrl ?? '',
                  placeholder: (context, url) =>  const LoadingWidget(color: primaryColor,),
                  errorWidget: (context, url, error) => const Background(),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('by ${widget.news.authorUsername}' ,

                        style: montserratStyle.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: (widget.mini ? 8.0 :10.0)

                        )),

                        Text(widget.news.title ,

                            style: montserratStyle.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                                fontSize: (widget.mini ? 12.0 :14.0)
                        )),
                    const SizedBox(height: 8.0),

                    Text(DateFormat.yMMMd().format(DateTime.tryParse(widget.news.date)??DateTime.now()), style: montserratStyle.copyWith(
                        color: theme.hintTextColor,
                        fontSize:(widget.mini ? 8.0 :10.0)
                    )),
                    const SizedBox(height: 2.0),

                    Expanded(
                      child: Text(
                        widget.news.excerpt,
                        overflow: TextOverflow.clip,
                        style: montserratStyle.copyWith(
                          color: theme.titleTextColor,
                          fontSize: (widget.mini ? 8.0 :11.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenSize.width),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/icons/comment.png',
                              color: primaryColor,
                              width:(widget.mini ? 10.0 :14.0) ,
                              height: (widget.mini ? 10.0 :14.0),
                            ),
                            const SizedBox(width: 4.0,),
                            Text(
                              widget.news.comments.toString(),
                              style: montserratStyle.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: (widget.mini ? 7.0 :10.0)
                              ),

                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

