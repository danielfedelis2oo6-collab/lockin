import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lockin/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/constants/sizes.dart';

// ---------------------------------------------------------------------------
// VaultSlider
//
// Design: the dark hero image fills the whole card; the dot-indicator row is
// overlaid at the bottom using a Stack so the dots sit ON TOP of the image,
// matching the picture exactly.
//
// How to customise a slide
// ────────────────────────
// [contents] accepts plain strings for now (rendered as centred white text
// over the dark background).  Replace the inner builder widget with any
// widget (e.g. Image, custom illustration) without touching the Stack/dots
// logic.
//
// Height of the card
// ──────────────────
// Change [slideHeight] — default 160 — to whatever fits your design.
// ---------------------------------------------------------------------------

class VaultSlider extends StatefulWidget {
  const VaultSlider({
    super.key,
    required this.contents,
    this.slideHeight = 160.0,
  });

  final List<String> contents;

  /// Height of the dark slide card. Shorter than before to match the image.
  final double slideHeight;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UiSizes.defaultSpace),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // ── Hero carousel (background) ──────────────────────────────
          CarouselSlider(
            options: CarouselOptions(
              height: widget.slideHeight,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, _) => _currentIndex.value = index,
            ),
            items: widget.contents
                .map((text) => _SlideCard(text: text))
                .toList(),
          ),

          // ── Dot indicator overlay (foreground) ──────────────────────
          Positioned(
            bottom: UiSizes.sm,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentIndex,
              builder: (_, currentIndex, __) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.contents.length; i++)
                    OycirculerContainer(
                      width: currentIndex == i ? 20 : 8,
                      height: 6,
                      radius: 100,
                      margin: const EdgeInsets.only(right: UiSizes.xs),
                      backgroundColor: currentIndex == i
                          ? UiColors.white
                          : UiColors.white.withAlpha(90),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Individual slide card
// ---------------------------------------------------------------------------

/// Replace the body of this widget to customise what each slide looks like.
/// The dark rounded container and the text layout are separate concerns so
/// you can swap the text for an Image without touching the outer shell.
class _SlideCard extends StatelessWidget {
  const _SlideCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: UiColors.darkGrey,
        borderRadius: BorderRadius.circular(UiSizes.cardRadiusLg),
        // Subtle texture overlay — remove if asset is missing
        image: const DecorationImage(
          image: AssetImage('assets/images/password_card_bg.png'),
          fit: BoxFit.cover,
          opacity: 0.20,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(
        UiSizes.lg,
        UiSizes.lg,
        UiSizes.lg,
        UiSizes.xl, // extra bottom pad so dots don't overlap text
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: UiColors.white,
          fontSize: UiSizes.fontSizeLg,
          fontWeight: FontWeight.w600,
          height: 1.35,
        ),
      ),
    );
  }
}
