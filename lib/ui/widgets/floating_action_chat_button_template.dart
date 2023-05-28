// import 'package:flutter/material.dart';
//
// import '../../core/services/bus_event.dart';
//
// class FloatingActionChatButton extends StatefulWidget {
//   const FloatingActionChatButton({Key? key}) : super(key: key);
//
//   @override
//   State<FloatingActionChatButton> createState() =>
//       _FloatingActionChatButtonState();
// }
//
// class _FloatingActionChatButtonState extends State<FloatingActionChatButton>
//     with TickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   final GlobalKey<_FloatingCenterButtonState> _floatingCenterButtonStateKey =
//   GlobalKey<_FloatingCenterButtonState>();
//   final GlobalKey<_CenterButtonsState> _centerButtonsState =
//   GlobalKey<_CenterButtonsState>();
//   OverlayState? _overlayState;
//   OverlayEntry? _overlayEntry;
//   CircleButtonAnimationState _circleButtonAnimationState =
//       CircleButtonAnimationState.idle;
//
//   /// [eventBus] property is use to send or listen the events.
//   static late EventBus eventBus;
//
//   @override
//   void initState() {
//     _initializeEventBus();
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     _overlayState = Overlay.of(context);
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//
//   /// [_initializeEventBus] Here we initialize the event bus for the events.
//   void _initializeEventBus() {
//     eventBus = EventBusImpl();
//     eventBus.stream.listen(_listenEvent);
//   }
//
//   /// [_listenEvent] On tap of item this method will be execute and performs the animation.
//   void _listenEvent(dynamic event) {
//     if (event is ItemClickBusEvent) {
//       _handleOnTap();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 45.0),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: GestureDetector(
//           onTap: _handleOnTap,
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             height: 50,
//             width: 50,
//             curve: Curves.easeOut,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: const Color(0xff000000),
//             ),
//             child: Center(
//               child: RotationTransition(
//                 turns:
//                     Tween(begin: 0.0, end: 1.0).animate(_animationController),
//                 child: const Icon(
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _initialize() {
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//       upperBound: 0.5,
//     );
//     _animationController.addListener(() {
//       if (_animationController.isCompleted) {
//         //TODO: implement final VoidCallback? onAnimationComplete;
//         // widget.onAnimationComplete?.call();
//         () {
//           _handleOnTap();
//         }.call();
//       }
//     });
//   }
//
//   void reverseAnimation() {
//     _animationController.reverse(from: .5);
//   }
//
//   void forwardAnimation() {
//     _animationController.forward(from: .0);
//   }
// }
//
// void _handleOnTap() {
//   // if (_circleButtonAnimationState == CircleButtonAnimationState.running)
//   //   return;
//   // _circleButtonAnimationState = CircleButtonAnimationState.running;
//   // Future.delayed(
//   //     Duration(
//   //         milliseconds: Dimens.animationDurationHigh *
//   //             widget.bottomBarCenterModel.centerIconChild.length), () {
//   //   _circleButtonAnimationState = CircleButtonAnimationState.idle;
//   // });
//   //
//   // if (_overlayEntry == null) {
//   //   _showCenterButtons();
//   // } else {
//   //   _removeCenterButtons();
//   // }
//   //
//   // _updateAnimation(_overlayEntry != null);
// }
//
// // void _showCenterButtons() {
// //   RenderBox _renderBox = _floatingCenterButtonStateKey.currentContext
// //       ?.findRenderObject() as RenderBox;
// //   Offset _position = _renderBox.localToGlobal(Offset.zero);
// //   _overlayEntry = OverlayEntry(builder: (context) {
// //     return CenterButtons(
// //       bottomBarCenterModel: widget.bottomBarCenterModel,
// //       position: _position,
// //       onTap: () {},
// //       key: _centerButtonsState,
// //     );
// //   });
// //   if (_overlayEntry != null) _overlayState?.insert(_overlayEntry!);
// // }
// //
// // void _removeCenterButtons() {
// //   _overlayEntry?.remove();
// //   _overlayEntry = null;
// // }
//
// // void _updateAnimation(bool isOverlayVisible) {
// //   _floatingCenterButtonStateKey.currentState?._animationController
// //       .addListener(() {});
// //   (isOverlayVisible)
// //       ? _floatingCenterButtonStateKey.currentState?.forwardAnimation()
// //       : _floatingCenterButtonStateKey.currentState?.reverseAnimation();
// // }
