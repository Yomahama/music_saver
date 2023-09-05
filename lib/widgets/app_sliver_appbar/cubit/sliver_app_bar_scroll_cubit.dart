import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:music_saver/utils/misc_utils.dart';
import 'package:music_saver/widgets/app_sliver_appbar/app_sliver_app_bar.dart';

part 'sliver_app_bar_scroll_state.dart';

class SliverAppBarScrollCubit extends Cubit<SliverAppBarScrollState> {
  SliverAppBarScrollCubit() : super(const SliverAppBarScrollState());

  void onScroll(FlexibleSpaceBarSettings? settings) {
    final minExtent = settings?.minExtent ?? 0;
    final maxExtent = settings?.maxExtent ?? 0;
    final currentExtent = settings?.currentExtent ?? 0;

    final max = maxExtent - minExtent;
    final current = currentExtent - minExtent;

    final showLargeTitle = current > AppSliverAppBar.titleBotPadding;

    final dividerOpacity =
        showLargeTitle ? MiscUtils.getPercent(current, max - AppSliverAppBar.titleBotPadding) : 1.0;

    emit(SliverAppBarScrollState(showLargeTitle: showLargeTitle, dividerOpacity: dividerOpacity));
  }
}
