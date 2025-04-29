import 'package:flutter/material.dart';

class FireAlertTicker extends StatefulWidget {
  const FireAlertTicker({super.key});

  @override
  State<FireAlertTicker> createState() => _FireAlertTickerState();
}

class _FireAlertTickerState extends State<FireAlertTicker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<String> _alerts = [
    'İstanbul, Beşiktaş',
    'Antalya, Manavgat',
    'İzmir, Bornova',
    'Muğla, Marmaris',
    'Aydın, Kuşadası',
  ];

  double _getContentWidth(BuildContext context) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        children: _alerts.map((alert) => TextSpan(
          text: '  $alert  ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )).toList(),
      ),
    );
    textPainter.layout();
    return textPainter.width + (_alerts.length * 32); // Extra space for padding and margins
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: -1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        final contentWidth = _getContentWidth(context);
        
        return ClipRect(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(
                        _animation.value * contentWidth,
                        0,
                      ),
                      child: Row(
                        children: [
                          ..._buildAlertItems(),
                          if (contentWidth < containerWidth * 2)
                            ..._buildAlertItems(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> _buildAlertItems() {
    return _alerts.map((alert) {
      return Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFF3B30),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          alert,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      );
    }).toList();
  }
} 