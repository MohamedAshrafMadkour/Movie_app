import 'package:flutter/material.dart';
import 'package:movie_app/features/ready/presentation/view/widget/ready_view_body.dart';

class ReadyView extends StatelessWidget {
  const ReadyView({super.key});
  static const routeName = 'ready_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const ReadyViewBody());
  }
}
