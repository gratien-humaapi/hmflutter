import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFD0CB),
          border: Border(
            left: BorderSide(color: Colors.red, width: 10),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 60,
              child: Center(
                child: Icon(Icons.error_outline_rounded,
                    color: Colors.red, size: 30),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Error",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            // Close button
            const SizedBox(
              width: 60,
              child: Icon(
                Icons.close_rounded,
                size: 25,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFC5F7DD),
          border: Border(
            left: BorderSide(color: Colors.green, width: 10),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 60,
              child: Center(
                child: Icon(Icons.check_circle_outline_rounded,
                    color: Colors.green, size: 30),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Success",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
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

class WarningMessage extends StatelessWidget {
  const WarningMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFE8C3),
          border: Border(
            left: BorderSide(color: Colors.orange, width: 10),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 60,
              child: Center(
                child: Icon(Icons.warning_amber_rounded,
                    color: Colors.orange, size: 30),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Warning",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
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

class InfoMessage extends StatelessWidget {
  const InfoMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFCCE3FE),
          border: Border(
            left: BorderSide(color: Colors.blue, width: 10),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 60,
              child: Center(
                child: Icon(Icons.info_outline, color: Colors.blue, size: 30),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Information",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
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

class CustomMessage extends StatelessWidget {
  const CustomMessage({
    super.key,
    required this.message,
    this.backgroundColor,
    this.borderColor,
    this.hasCloseButton = true,
    this.icon,
    required this.title,
  });
  final String title;
  final String message;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? icon;
  final bool hasCloseButton;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xFFE9E8EB),
          border: const Border(
            left: BorderSide(color: Colors.blueGrey, width: 10),
          ),
        ),
        child: Row(
          children: [
            if (icon != null)
              SizedBox(
                width: 60,
                child: Center(
                  child: IconTheme(
                      data: Theme.of(context)
                          .iconTheme
                          .copyWith(color: Colors.blueGrey, size: 30),
                      child: icon!),
                ),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
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
