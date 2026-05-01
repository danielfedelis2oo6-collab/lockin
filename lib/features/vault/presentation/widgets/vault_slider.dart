import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lockin/common/widgets/cards/md_rounded_card.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';
import 'package:lockin/utils/helpers/helper_functions.dart';

class VaultSlider extends StatefulWidget {
  const VaultSlider({super.key, required this.contents});
  final List<String> contents;

  @override
  State<VaultSlider> createState() => _VaultSliderState();
}

class _VaultSliderState extends State<VaultSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => _currentIndex.value = index,
          ),
          items: widget.contents
              .map(
                (cardContent) => MdRoundedCard(
                  cardContents: cardContent,
                  height: 200,
                  width: double.infinity,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: UiSizes.spaceBtwItems),
        ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (_, currentIndex, __) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.contents.length; i++)
                OycirculerContainer(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.only(right: UiSizes.sm),
                  backgroundColor: isDark
                      ? currentIndex == i
                            ? UiColors.white
                            : UiColors.grey
                      : currentIndex == i
                      ? UiColors.darkerGrey
                      : UiColors.lightGrey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
