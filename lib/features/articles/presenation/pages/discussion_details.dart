import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/core/widgets/pagination_widget.dart';
import 'package:animezone/features/articles/domain/models/discussion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/error.dart';
import '../providers/providers.dart';

class DiscussionDetails extends ConsumerStatefulWidget {
  final int id;
  const DiscussionDetails({super.key, required this.id});

  @override
  ConsumerState<DiscussionDetails> createState() => _DiscussionDetailsState();
}

class _DiscussionDetailsState extends ConsumerState<DiscussionDetails> {
  final _controller = ScrollController();
  final Map<int, bool> spoilers = {};
  final Map<int, bool> spoilersBuild = {};
  int page = 1;

  Discussion? cachedDiscussion;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(applicationThemeProvider);
    final discussion = ref.watch(discussionProvider(id: widget.id, page: page));
    print(page);
    final screenSize = MediaQuery.sizeOf(context);
    return Material(
      child: Stack(
        children: [
          const Background(),
          Positioned(
              left: 16.0,
              right: 16.0,
              top: 0,
              bottom: 0,
              child: SingleChildScrollView(
                controller: _controller,
                padding: EdgeInsets.only(top: screenSize.height * .125),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cachedDiscussion == null
                        ? discussion.when(
                            data: (data) {
                              cachedDiscussion ??= data;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildMainContainer(cachedDiscussion!.topic),
                                  Container(
                                    height: 6.0,
                                    width: screenSize.width * .35,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        color: theme.foregroundColor),
                                  ),
                                ],
                              );
                            },
                            error: (error, stackTrace) => const Error1(),
                            loading: () => const Center(child: LoadingWidget()),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildMainContainer(cachedDiscussion!.topic),
                              Container(
                                height: 6.0,
                                width: screenSize.width * .35,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: theme.foregroundColor),
                              ),
                            ],
                          ),
                    discussion.when(
                      data: (data) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(
                              data.replies.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: _buildMainContainer(data.replies[index]),
                              ),
                            )
                          ],
                        );
                      },
                      error: (error, stackTrace) => const Error1(),
                      loading: () => const Center(child: LoadingWidget()),
                    ),
                  ],
                ),
              )),
          Positioned(
            top: 32.0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.of(context).pop(),
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
                Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: discussion.when(
                        data: (data) => Padding(
                          padding:
                              const EdgeInsets.only(left: 4.0, right: 16.0),
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) => AnimatedContainer(
                              height: screenSize.height * .0575,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0),
                              duration: const Duration(milliseconds: 300),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: theme.foregroundColor.withOpacity(
                                    _controller.offset > screenSize.height * .05
                                        ? 1.0
                                        : 0.0),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: accentColor.withOpacity(
                                        _controller.offset >
                                                screenSize.height * .05
                                            ? 0.25
                                            : 0.0),
                                    blurRadius: 8.0,
                                  )
                                ],
                              ),
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: outfitStyle.copyWith(
                                  color: _controller.offset >
                                          screenSize.height * .05
                                      ? primaryColor
                                      : Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                                child: AutoSizeText(data.title, maxLines: 2),
                              ),
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => const Error1(),
                        loading: () => const SizedBox(),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
              child: cachedDiscussion != null
                  ? Pagination(
                      callback: (index) => setState(() {
                        page = index;
                      }),
                      length: cachedDiscussion!.lastVisiblePage,
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMainContainer(DiscussionElement element) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 18.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: element.userIcon == null
                        ? Container(
                            color: primaryColor,
                            child: Transform.scale(
                              scale: .75,
                              child: Image.asset(
                                'assets/icons/character.png',
                                color: Colors.white,
                                width: screenSize.width * .15,
                                height: screenSize.width * .15,
                              ),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: element.userIcon ?? '',
                            fit: BoxFit.cover,
                            width: screenSize.width * .15,
                            height: screenSize.width * .15,
                            placeholder: (context, url) => const LoadingWidget(
                              color: primaryColor,
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        element.userName,
                        style: outfitStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        element.userStatus,
                        style: outfitStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                          color: theme.hintTextColor,
                        ),
                      ),
                      Text(
                        'Joined: ${element.userJoined}',
                        style: outfitStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                          color: theme.hintTextColor,
                        ),
                      ),
                      Text(
                        'Posts: ${element.postsCount}',
                        style: outfitStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                          color: theme.hintTextColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                DateFormat.yMMMd()
                    .format(DateTime.fromMillisecondsSinceEpoch(element.date)),
                style: outfitStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.0,
                  color: theme.hintTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          if (element.reply != null)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: primaryColor.withOpacity(.2)),
              margin: const EdgeInsets.only(bottom: 12.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/reply.png',
                        color: primaryColor,
                        width: 14.0,
                        height: 14.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        element.reply!['target'] as String,
                        style: outfitStyle.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 10.0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    element.reply!['replyBody'] as String,
                    style: outfitStyle.copyWith(
                        color: theme.textColor, fontSize: 11.0),
                  )
                ],
              ),
            ),
          RichText(
            text: TextSpan(
                children: List.generate(
              element.content.length,
              (index) => _buildContentWidget(
                element.content[index],
                style: outfitStyle.copyWith(
                    color: theme.textColor, fontSize: 12.0),
              ),
            )),
          ),
          if (element.followContent != null)
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 48.0),
                  height: .5,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      accentColor,
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
                ),
                RichText(
                  text: TextSpan(
                      children: List.generate(
                    element.followContent!.length,
                    (index) => _buildContentWidget(
                      element.followContent![index],
                      style: outfitStyle.copyWith(
                          color: theme.textColor, fontSize: 12.0),
                    ),
                  )),
                ),
              ],
            ),
        ],
      ),
    );
  }

  InlineSpan _buildContentWidget(
    Map<String, dynamic> json, {
    TextStyle style = outfitStyle,
  }) {
    switch (json.keys.first) {
      case 'text':
        final val = json.values.first as String;

        return val == '\n'
            ? WidgetSpan(
                child: SizedBox(
                height: 0.5 * (style.fontSize ?? 12.0 / 12.0),
                width: MediaQuery.sizeOf(context).width,
              ))
            : TextSpan(
                text: val,
                style: style,
              );
      case 'stylized':
        String styleText = json['stylized']['style'] as String;
        double fontSize = style.fontSize ?? 12.0;
        if (styleText.contains('font-size'))
          fontSize *=
              int.parse(styleText.split(' ').last.split('%').first) / 100;
        final list = List<Map<String, dynamic>>.from(
            (json['stylized'])['content'] as List);

        return TextSpan(
          children: List.generate(
            list.length,
            (index) => _buildContentWidget(
              list[index],
              style: style.copyWith(
                  fontStyle: (json['stylized'])['style'] == 'italic'
                      ? FontStyle.italic
                      : FontStyle.normal,
                  fontWeight: (json['stylized'])['style'] == 'bold'
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontFamily: styleText == 'quote' ? 'ReggaeOne' : 'Outfit',
                  fontSize: fontSize,
                  decoration: (json['stylized'])['style'] == 'underline'
                      ? TextDecoration.underline
                      : TextDecoration.none),
            ),
          ),
        );
      case 'highlighted':
        return TextSpan(
          text: '${json['highlighted'] as String}\n',
          style:
              style.copyWith(color: primaryColor, fontWeight: FontWeight.w700),
        );
      case 'url':
        return TextSpan(
          children: [
            WidgetSpan(
                child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => launchUrlString(
                  (json.values.first as Map<String, dynamic>)['url'] as String),
              child: RichText(
                  text: _buildContentWidget(
                json['url']['content'] as Map<String, dynamic>,
                style: style.copyWith(
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                ),
              )),
            ))
          ],
        );
      case 'item':
        return WidgetSpan(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4.0,
              height: 4.0,
              margin: const EdgeInsets.only(top: 8.0, right: 8.0),
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
            ),
            Expanded(
                child: RichText(
              text: TextSpan(
                  style: style,
                  children: List.generate(
                    (json['item'] as List).length,
                    (index) => _buildContentWidget(
                        List<Map<String, dynamic>>.from(
                            json['item'] as List)[index],
                        style: style),
                  )),
            ))
          ],
        ));
      case 'group':
        return WidgetSpan(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: RichText(
            text: TextSpan(
              style: style,
              children: List.generate(
                (json['group'] as List).length,
                (index) => _buildContentWidget(
                    List<Map<String, dynamic>>.from(
                        json['group'] as List)[index],
                    style: style),
              ),
            ),
          ),
        ));
      case 'container':
        return WidgetSpan(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: primaryColor.withOpacity(.2)),
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: RichText(
              text: TextSpan(
                  children: List.generate(
                (json['container'] as List).length,
                (index) => _buildContentWidget(
                    (List<Map<String, dynamic>>.from(
                        json['container'] as List))[index],
                    style: style),
              )),
            ),
          ),
        );
      case 'align':
        return WidgetSpan(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            alignment: switch (json['align']['align']) {
              'right' => Alignment.centerRight,
              'left' => Alignment.centerLeft,
              _ => Alignment.center,
            },
            // margin: const EdgeInsets.symmetric(vertical: 12.0),
            // padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 12.0),
            child: RichText(
              textAlign: switch (json['align']['align']) {
                'right' => TextAlign.right,
                'left' => TextAlign.left,
                _ => TextAlign.center,
              },
              text: TextSpan(
                style: style,
                children: List.generate(
                  (json['align']['content'] as List).length,
                  (index) => _buildContentWidget(
                      (List<Map<String, dynamic>>.from(
                          json['align']['content'] as List))[index],
                      style: style),
                ),
              ),
            ),
          ),
        );
      case 'spoiler':
        if (spoilers[json.hashCode] == null) spoilers[json.hashCode] = false;
        if (spoilersBuild[json.hashCode] == null)
          spoilersBuild[json.hashCode] = false;
        return WidgetSpan(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  spoilers[json.hashCode] = !spoilers[json.hashCode]!;
                  if (spoilers[json.hashCode]!)
                    spoilersBuild[json.hashCode] = spoilers[json.hashCode]!;
                }),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: primaryColor),
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: Text(
                      json['spoiler']
                              [spoilers[json.hashCode]! ? 'hide' : 'show']
                          as String,
                      style: outfitStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0),
                    )),
              ),
              ClipRect(
                child: AnimatedAlign(
                  heightFactor: spoilers[json.hashCode]! ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  onEnd: () {
                    if (!spoilers[json.hashCode]!) {
                      setState(() {
                        spoilersBuild[json.hashCode] = false;
                      });
                    }
                  },
                  child: RichText(
                    text: TextSpan(
                      style: style,
                      children: spoilersBuild[json.hashCode]!
                          ? List.generate(
                              (json['spoiler']['content'] as List).length,
                              (index) => _buildContentWidget(
                                  (List<Map<String, dynamic>>.from(
                                      json['spoiler']['content']
                                          as List))[index],
                                  style: style),
                            )
                          : [],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      case 'image':
        return WidgetSpan(
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: json.values.first as String,
                placeholder: (context, url) => const LoadingWidget(
                  color: primaryColor,
                ),
                errorWidget: (context, url, error) => Center(
                  child: Image.asset(
                    'assets/images/fail.png',
                    width: 40.0,
                  ),
                ),
              ),
            ),
          ),
        );
      case 'video':
        return WidgetSpan(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: json['video'] as String,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                ),
              ),
              bufferIndicator: const LoadingWidget(
                color: primaryColor,
              ),
              bottomActions: [
                const SizedBox(width: 14.0),
                CurrentPosition(),
                const SizedBox(width: 8.0),
                ProgressBar(
                  isExpanded: true,
                  colors: const ProgressBarColors(
                      bufferedColor: accentColor,
                      playedColor: primaryColor,
                      backgroundColor: Colors.white,
                      handleColor: primaryColor),
                ),
                RemainingDuration(),
              ],
              showVideoProgressIndicator: true,
              progressIndicatorColor: primaryColor,
            ),
          ),
        );
    }
    return const TextSpan(children: []);
  }
}
