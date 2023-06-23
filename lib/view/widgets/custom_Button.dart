import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final double width;
  final VoidCallback onPressed;
  String text;

   AnimatedButton({required this.width, required this.onPressed , required this.text});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _widthAnimation = Tween<double>(
      begin: widget.width,
      end: widget.width * 0.1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    print(_widthAnimation.value);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTapDown: (_) => _animationController.forward(),
      // onTapUp: (_) {
      //   _animationController.reverse();
      //   widget.onPressed();
      // },

      // onTapCancel: () => _animationController.reverse(),
      onTap: () async{
        _animationController.forward();
      await  Future.delayed(Duration(seconds: 2));
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return 
          _widthAnimation.value > 80 ? Container (
            width: _widthAnimation.value ,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                                  
                                  ),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ) : CircularProgressIndicator();
        },
      ),
    );
  }
}
