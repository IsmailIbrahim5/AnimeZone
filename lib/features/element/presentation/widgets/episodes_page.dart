import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/core/widgets/not_found.dart';
import 'package:animezone/features/element/presentation/widgets/episode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/providers.dart';
import '../providers/providers.dart';

class EpisodesPage extends ConsumerWidget {
  final int animeId;
  const EpisodesPage({super.key, required this.animeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodes = ref.watch(animeEpisodesProvider(id: animeId));
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return episodes.when(
      data: (data) {
        data.sort(
          (a, b) => a.malId - b.malId,
        );
        return data.isEmpty
            ? const NotFound()
            : SingleChildScrollView(
                child: Column(
                  children: List.generate(data.length,
                      (index) => EpisodeWidget2(episode: data[index])),
                ),
              );
      },
      error: (error, stackTrace) =>const Error1(),
      loading: () => SizedBox(
          height: screenSize.height * .4,
          child: const LoadingWidget(
            color: primaryColor,
          )),
    );
  }
}
