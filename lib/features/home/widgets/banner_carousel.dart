import 'dart:async';
import 'package:flutter/material.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../theme/app_colors.dart';

class BannerItem {
  final String id;
  final String imageUrl;
  const BannerItem({required this.id, required this.imageUrl});
}

/// Banner quảng cáo tự chuyển trang + chấm chỉ báo (chấm đang chọn kéo dài).
class BannerCarousel extends StatefulWidget {
  final List<BannerItem> banners;
  final void Function(BannerItem banner)? onBannerTap;
  final double aspectRatio;
  final Duration autoPlayInterval;
  final bool autoPlay;
  final EdgeInsetsGeometry padding;

  const BannerCarousel({
    super.key,
    required this.banners,
    this.onBannerTap,
    this.aspectRatio = 2.1,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlay = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _controller = PageController();
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    if (!widget.autoPlay || widget.banners.length < 2) return;
    _timer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!_controller.hasClients) return;
      final next = (_index + 1) % widget.banners.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: widget.padding,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              NotificationListener<UserScrollNotification>(
                onNotification: (_) {
                  _startTimer();
                  return false;
                },
                child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.banners.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (_, i) {
                    final b = widget.banners[i];
                    return GestureDetector(
                      onTap: () => widget.onBannerTap?.call(b),
                      child: SizedBox.expand(
                        child: AppNetworkImage(url: b.imageUrl, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              if (widget.banners.length > 1)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 8,
                  child: _Dots(count: widget.banners.length, index: _index),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final int index;
  const _Dots({required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: active ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
