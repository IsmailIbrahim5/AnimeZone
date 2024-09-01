import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/articles/domain/models/forum.dart';
import 'package:animezone/features/element/presentation/pages/element_details.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../articles/presenation/pages/discussion_details.dart';

class ForumsPage extends ConsumerWidget {
  final int id;
  final ElementType elementType;
  const ForumsPage({super.key ,required this.id , required this.elementType});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final forum = ref.watch(elementForumProvider(id: id , elementType: elementType));
    return forum.when(
      data: (data) => ListView.separated(
        itemCount: data.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder:  (context, index) => ForumWidget(forum: data[index],),

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
      ),
      error: (error, stackTrace) => const Error1(),
      loading: () => SizedBox(
        height: screenSize.height * .4,
        child: const LoadingWidget(color: primaryColor,),
      ),
    );
  }
}
class ForumWidget extends ConsumerStatefulWidget {
  final Forum forum;
  const ForumWidget({super.key, required this.forum});

  @override
  ConsumerState<ForumWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends ConsumerState<ForumWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DiscussionDetails(id: widget.forum.malId,)));
      },
      child: Container(
        width: screenSize.width,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.forum.title,
                    style: outfitStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 4.0,),
                  Row(
                    children: [
                      if(widget.forum.entry!=null)
                        ...[Flexible(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ElementDetails(elementType: widget.forum.entry!['type'] == 'anime' ? ElementType.anime : ElementType.manga, id: widget.forum.entry!['id'] as int,),)),
                            child: AutoSizeText(
                              '${widget.forum.entry!['name']}',maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: outfitStyle.copyWith(
                                  color: primaryColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w200
                              ),
                            ),
                          ),
                        ),
                          Container(
                            decoration: const BoxDecoration(
                                color: primaryColor,
                              shape: BoxShape.circle
                            ),
                            height: 4.0,
                            width: 4.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          )
                        ],
                      Text(
                        widget.forum.authorUsername,
                        style: outfitStyle.copyWith(
                            color: theme.textColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Container(
                        decoration:  BoxDecoration(
                            color: theme.textColor,
                            shape: BoxShape.circle
                        ),
                        height: 4.0,
                        width: 4.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      ),
                      Text(
                        DateFormat.yMMMd().format(DateTime.parse(widget.forum.date)),
                        style: outfitStyle.copyWith(
                            color: theme.textColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/comment.png',
                  width: 16.0,
                  height: 16.0,
                  color: primaryColor,
                ),
                const SizedBox(width: 4.0,),
                Text(
                  '${widget.forum.comments}',
                  style: outfitStyle.copyWith(
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      
      ),
    );
  }
}

