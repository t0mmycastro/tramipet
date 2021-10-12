import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(
            builder: (_, ref, __) {
              final user = ref.watch(sessionProvider).user!;
              return Text(user.displayName ?? '');
            },
          ),
          const Text("Home page"),
        ],
      ),
    );
  }
}
