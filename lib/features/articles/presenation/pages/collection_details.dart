import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/pagination_widget.dart';
import 'package:animezone/features/articles/domain/models/news.dart';
import 'package:animezone/features/articles/presenation/providers/providers.dart';
import 'package:animezone/features/element/presentation/widgets/forum_page.dart';
import 'package:animezone/features/element/presentation/widgets/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/models/forum.dart';

class CollectionDetails extends ConsumerStatefulWidget {
  final String type;
  final String tag;
  const CollectionDetails({super.key, required this.type , required this.tag});

  @override
  ConsumerState<CollectionDetails> createState() => _CollectionDetailsState();
}

class _CollectionDetailsState extends ConsumerState<CollectionDetails> {
  int? cachedPage;
  int page = 1;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    AsyncValue<dynamic> provider;
    if(widget.type == 'news'){
      if(widget.tag == 'recent'){
        provider = ref.watch(recentNewsProvider(page: page));
      }else{
        provider = ref.watch(tagNewsProvider(tag: widget.tag, page: page));
      }
    }else{

      if(widget.tag == 'recent'){
        provider = ref.watch(forumsProvider(recent: true, page: page));

      }else{
        provider = ref.watch(forumsProvider(isSeries: true,id:widget.tag =='anime' ? 1 : 4, page: page));
      }
    }
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
                      '${widget.tag.toUpperCase()} ${widget.type.toUpperCase()}',
                      style: outfitStyle.copyWith(
                        color: theme.titleTextColor,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 4.0,
                        fontSize: 14.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                provider.when(
                  data: (data) {
                    if(cachedPage == null){
                      setState(() {
                        cachedPage = data.lastVisiblePage as int;
                      });
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemCount: data.data.length as int? ??0,
                      itemBuilder: (context, index) =>Padding(

                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: switch(data.data[index]){
                          News news => NewsWidget(news: news,),
                          Forum forum => ForumWidget(forum: forum,),
                          _ => const SizedBox()
                        },
                      ),
                    );
                  },
                  error: (error, stackTrace) => const Error1(),
                  loading: () => const LoadingWidget(
                    color: primaryColor,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  right: 0,
                  left: 0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    switchInCurve:Curves.easeOutBack,
                    transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child,),),
                    child: cachedPage != null ?  Pagination(
                    callback: (index) => setState(() {
                      page = index;
                    }),
                    length: cachedPage!,
                  ): const SizedBox(),)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
