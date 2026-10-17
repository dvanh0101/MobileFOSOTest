import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final DateTime endTime;
  final VoidCallback? onFinished;
  final Color boxColor;
  final Color textColor;

  const CountdownTimer({
    super.key,
    required this.endTime,
    this.onFinished,
    this.boxColor = const Color(0xFFD7263D),
    this.textColor = Colors.white,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  late Duration _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = _calc();
    _start();
  }

  @override
  void didUpdateWidget(covariant CountdownTimer old) {
    super.didUpdateWidget(old);
    if (old.endTime != widget.endTime) {
      _remaining = _calc();
      _start();
    }
  }

  Duration _calc() {
    final d = widget.endTime.difference(DateTime.now());
    return d.isNegative ? Duration.zero : d;
  }

  void _start() {
    _timer?.cancel();
    if (_remaining == Duration.zero) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final next = _calc();
      if (!mounted) return;
      setState(() => _remaining = next);
      if (next == Duration.zero) {
        t.cancel();
        widget.onFinished?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final h = _remaining.inHours;
    final m = _remaining.inMinutes.remainder(60);
    final s = _remaining.inSeconds.remainder(60);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _box(_two(h)),
        _colon(),
        _box(_two(m)),
        _colon(),
        _box(_two(s)),
      ],
    );
  }

  Widget _box(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
    decoration: BoxDecoration(
      color: widget.boxColor,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: widget.textColor,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
    ),
  );

  Widget _colon() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3),
    child: Text(':',
        style: TextStyle(
            color: widget.boxColor,
            fontWeight: FontWeight.w700,
            fontSize: 14)),
  );
}
