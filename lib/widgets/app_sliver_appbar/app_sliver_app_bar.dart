import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_saver/constants/theme/animation_durations.dart';
import 'package:music_saver/constants/theme/colors.dart';
import 'package:music_saver/constants/theme/text_styles.dart';
import 'package:music_saver/utils/device_utils.dart';
import 'package:music_saver/utils/misc_utils.dart';
import 'package:music_saver/widgets/app_back_button.dart';
import 'package:music_saver/widgets/app_divider.dart';
import 'package:music_saver/widgets/app_sliver_appbar/cubit/sliver_app_bar_scroll_cubit.dart';

class AppSliverAppBar extends StatelessWidget {
  final String title;
  const AppSliverAppBar({required this.title, super.key});

  static const titleBotPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliverAppBarScrollCubit(),
      child: _AppSliverAppBarView(title: title),
    );
  }
}

class _AppSliverAppBarView extends StatefulWidget {
  final String title;
  const _AppSliverAppBarView({required this.title});

  @override
  State<_AppSliverAppBarView> createState() => _AppSliverAppBarViewState();
}

class _AppSliverAppBarViewState extends State<_AppSliverAppBarView> {
  late final Text _defaultTitle;
  late final Text _largeTitle;

  Size _largeTitleSize = const Size.fromHeight(AppSliverAppBar.titleBotPadding);

  @override
  void initState() {
    super.initState();

    _defaultTitle = Text(widget.title);
    _largeTitle = Text(widget.title, style: AppTextStyles.black30w600);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      const hPadding = 15.0;
      final width = DeviceUtils.getWidth(context) - hPadding * 2;
      setState(() => _largeTitleSize = MiscUtils.getTextSize(_largeTitle, width));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _largeTitleSize.height + kToolbarHeight + AppSliverAppBar.titleBotPadding,
      leading: const AppBackButton(),
      stretch: true,
      pinned: true,
      title: BlocBuilder<SliverAppBarScrollCubit, SliverAppBarScrollState>(
        buildWhen: (p, c) => p.showLargeTitle != c.showLargeTitle,
        builder: (_, state) {
          return AnimatedOpacity(
            duration: Animations.duration200,
            opacity: state.showLargeTitle ? 0 : 1,
            child: _defaultTitle,
          );
        },
      ),
      flexibleSpace: Builder(
        builder: (context) {
          final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
          context.read<SliverAppBarScrollCubit>().onScroll(settings);

          return Stack(
            children: [
              Positioned(
                bottom: AppSliverAppBar.titleBotPadding,
                left: 15,
                right: 15,
                child: _largeTitle,
              ),
              const _SliverAppBarForeground(),
              const _SliverAppBarDivider(),
            ],
          );
        },
      ),
    );
  }
}

class _SliverAppBarForeground extends StatelessWidget {
  const _SliverAppBarForeground();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: kToolbarHeight + DeviceUtils.viewPadding(context).top,
        color: AppColors.white,
      ),
    );
  }
}

class _SliverAppBarDivider extends StatelessWidget {
  const _SliverAppBarDivider();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight + DeviceUtils.viewPadding(context).top - 1,
      left: 0,
      right: 0,
      child: BlocBuilder<SliverAppBarScrollCubit, SliverAppBarScrollState>(
        buildWhen: (p, c) => p.dividerOpacity != c.dividerOpacity,
        builder: (context, state) {
          return Opacity(
            opacity: state.dividerOpacity,
            child: const AppDivider(color: AppColors.grey200),
          );
        },
      ),
    );
  }
}
