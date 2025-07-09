import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({super.key});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(0, 0, 0, 0.3),
      ),
      height: MediaQuery.sizeOf(context).height * .1,
      width: MediaQuery.sizeOf(context).width * .3,

      child: Center(
        child: const SpinKitFadingCircle(color: Colors.white, size: 40.0),
      ),
    );
  }
}
