part of 'sliver_app_bar_scroll_cubit.dart';

class SliverAppBarScrollState extends Equatable {
  final bool showLargeTitle;
  final double dividerOpacity;

  const SliverAppBarScrollState({
    this.showLargeTitle = true,
    this.dividerOpacity = 0,
  });

  @override
  List<Object> get props => [showLargeTitle, dividerOpacity];
}
