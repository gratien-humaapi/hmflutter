import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

enum HMImageType { file, network }

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({
    super.key,
    required this.imagePath,
    required this.imageType,
    required this.tag,
  });

  final String imagePath;
  final Object tag;
  final HMImageType imageType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: HMIconButton(
                icon: const Icon(Icons.close_rounded),
                iconColor: Colors.white,
                buttonVariant: HMButtonVariant.transparent,
                radius: HMRadius.xl,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: Hero(
                tag: tag,
                child: Center(
                  child: imageType == HMImageType.file
                      ? Image.file(
                          File(imagePath),
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                  child: Text(
                            'Image not dound',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )),
                        )
                      : Image.network(
                          imagePath,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                  child: Text(
                            'Image not dound',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
