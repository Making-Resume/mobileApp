// import 'package:flutter/material.dart';

// class AnimatedButton extends StatefulWidget {
//   final double width;
//   final VoidCallback onPressed;
//   String text;
//   final AnimationController? animationController;

//    AnimatedButton({required this.width, required this.onPressed , required this.text , this.animationController});

//   @override
//   _AnimatedButtonState createState() => _AnimatedButtonState();
// }

// class _AnimatedButtonState extends State<AnimatedButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _widthAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );

//     _widthAnimation = Tween<double>(
//       begin: widget.width,
//       end: widget.width * 0.1,
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeOut,
//       ),
//     );
//     print(_widthAnimation.value);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(

//       onTap:
//       () 
//       async{
//         _animationController.forward();
//           widget.onPressed;
//         _animationController.reverse();
//       },
//       child: AnimatedBuilder(
//         animation: _animationController,
//         builder: (context, child) {
//           return 
//           _widthAnimation.value > 80 ? Container (
//             width: _widthAnimation.value ,
//             height: 50.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25.0),
//                                   gradient: LinearGradient(colors: [
//                                     Color.fromRGBO(143, 148, 251, 1),
//                                     Color.fromRGBO(143, 148, 251, .6),
//                                   ]
                                  
//                                   ),
//             ),
//             child: Center(
//               child: Text(
//                 widget.text,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ) : CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }
// import 'package:any_animated_button/any_animated_button.dart';
// import 'package:flutter/material.dart';

// class MinimalisticButton extends CustomAnyAnimatedButton {
//   MinimalisticButton({
//     required this.onTap,
//     required this.text,
//     this.enabled = true,
//     this.width,
//     this.bloc,
//     Key? key,
//   }) : super(key: key);

//   @override
//   final AnyAnimatedButtonBloc? bloc;
//   final VoidCallback onTap;
//   final String text;
//   final bool enabled;
//   final double? width;

//   final BorderRadius _borderRadius = BorderRadius.circular(22.0);

//   @override
//   AnyAnimatedButtonParams get defaultParams => AnyAnimatedButtonParams(
//         width: width,
//         height: 56.0,
//         decoration: BoxDecoration(
//           color: enabled ? Colors.blue : Colors.grey,
//           borderRadius: _borderRadius,
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: enabled ? onTap : null,
//             borderRadius: _borderRadius,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     text,
//                     style: const TextStyle(color: Colors.white),
//                     maxLines: 1,
//                     softWrap: false,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
// }