import 'package:flutter/material.dart';
import 'package:satellite/components/longButton.dart';
import 'package:satellite/models/navbar.dart';

class LogOrSign extends StatefulWidget {
  const LogOrSign({Key? key}) : super(key: key);

  @override
  _LogOrSignState createState() => _LogOrSignState();
}

class _LogOrSignState extends State<LogOrSign>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.1, end: 0.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 43),
      body: SafeArea(
        child: Column(
          children: [
            // Satellite text at the top
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 20.0),
              child: Text(
                "Satellite",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded area for image and gradient
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Animated gradient glow
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.center,
                            radius: 0.7,
                            colors: [
                              Colors.purple.withOpacity(_animation.value),
                              Colors.blue.withOpacity(_animation.value),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                      );
                    },
                  ),
                  // Background image with opacity
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      "assets/background.png",
                      fit: BoxFit.cover,
                      alignment: Alignment(0.3, -0.5),
                    ),
                  ),
                ],
              ),
            ),
            // Texts and buttons at the bottom
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Daily Digest",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Trustworthy news from reputable",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1,
                      ),
                    ),
                    const Text(
                      "publications",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1,
                      ),
                    ),
                    const Spacer(),
                    LongButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWithNavBar(),
                          ),
                        );
                      },
                      text: "Get Started",
                      color: Colors.blueAccent,
                      borderColor: Colors.blueAccent,
                      borderWidth: 1,
                    ),
                    const SizedBox(height: 20),
                    LongButton(
                      onTap: () {},
                      text: "Log back in",
                      color: Colors.transparent,
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
