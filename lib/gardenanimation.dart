import 'dart:async';
import 'dart:math';
import 'package:communitygarden/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:communitygarden/screens/registrationpage/gardenfirst.dart';

class GardenLeafFallAnimation extends StatefulWidget {
  const GardenLeafFallAnimation({super.key});

  @override
  State<GardenLeafFallAnimation> createState() =>
      _GardenLeafFallAnimationState();
}

class _GardenLeafFallAnimationState extends State<GardenLeafFallAnimation>
    with TickerProviderStateMixin {
  late AnimationController _leafController;
  late AnimationController _textController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _leafController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_textController);

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutBack),
    );

    Future.delayed(const Duration(seconds: 2), () {
      _textController.forward();
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Gardenfirst()),
      );
    });
  }

  @override
  void dispose() {
    _leafController.dispose();
    _textController.dispose();
    super.dispose();
  }

  Widget fallingLeaf(double startX, double delay) {
    return AnimatedBuilder(
      animation: _leafController,
      builder: (context, child) {
        double progress = (_leafController.value + delay) % 1;

        return Positioned(
          top: progress * MediaQuery.of(context).size.height,
          left: startX + sin(progress * 2 * pi) * 30,
          child: Transform.rotate(
            angle: progress * 4 * pi,
            child: const Icon(Icons.eco, size: 28, color: Colors.orange),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: Stack(
        alignment: Alignment.center,
        children: [
          fallingLeaf(60, 0),
          fallingLeaf(160, 0.3),
          fallingLeaf(260, 0.6),

          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Center(
                  child: const Text(
                    "EcoBloom",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.green,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
