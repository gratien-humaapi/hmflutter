//
import 'package:flutter/material.dart';

import 'flash_message.dart';

// void showOverlay(BuildContext context, {required String text}) async {
//   OverlayState? overlayState = Overlay.of(context);
//   OverlayEntry overlayEntry;
//   overlayEntry = OverlayEntry(builder: (context) {
//     return Positioned(
//       left: MediaQuery.of(context).size.width * 0.1,
//       top: MediaQuery.of(context).size.height * 0.5,
//       child: Material(
//         color: Colors.transparent,
//         child: Align(
//           alignment: Alignment.center,
//           // heightFactor: 1.0,
//           child: Container(
//             child: Dismissible(
//               key: const Key('dismissible'),
//               direction: DismissDirection.up,
//               resizeDuration: null,
//               onDismissed: (DismissDirection direction) {
//                 print("object");
//                 // removeHighlightOverlay();
//               },
//               child: FlashMessage(
//                 onDismissed: () {
//                   // removeHighlightOverlay();
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   });
//   //  animationController!.addListener(() {
//   //    overlayState!.setState(() {});
//   //  });
//   // inserting overlay entry
//   overlayState!.insert(overlayEntry);
//   //  animationController!.forward();
//   await Future.delayed(const Duration(seconds: 3))
//       //  .whenComplete(() => animationController!.reverse())
//       // removing overlay entry after stipulated time.
//       .whenComplete(() => overlayEntry.remove());
// }
// //

OverlayEntry? _previousEntry;
//
void createHighlightOverlay(BuildContext context,
    {EdgeInsets padding = const EdgeInsets.only(top: 0, left: 15, right: 15)}
    // required Color borderColor,
    ) {
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry? overlayEntry;

  // Remove the OverlayEntry.
  void removeHighlightOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  // Remove the existing OverlayEntry.
  removeHighlightOverlay();

  overlayEntry = OverlayEntry(
    // Create a new OverlayEntry.
    builder: (BuildContext context) {
      // Align is used to position the highlight overlay
      // relative to the NavigationBar destination.
      return Positioned(
        top: padding.top,
        left: padding.left,
        right: padding.right,
        bottom: padding.bottom != 0 ? padding.bottom : null,
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Material(
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.center,
              // heightFactor: 1.0,
              child: Container(
                child: Dismissible(
                  key: const Key('dismissible'),
                  direction: DismissDirection.up,
                  resizeDuration: null,
                  onDismissed: (DismissDirection direction) {
                    print("object");
                    removeHighlightOverlay();
                  },
                  child: FlashMessage(
                    onDismissed: () {
                      removeHighlightOverlay();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  // Add the OverlayEntry to the Overlay.
  // Overlay.of(context).insert(overlayEntry);
  // overlayState.insert(overlayEntry);
  WidgetsBinding.instance
      .addPostFrameCallback((_) => overlayState.insert(overlayEntry!));
  //
}
