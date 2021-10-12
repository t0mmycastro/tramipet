import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;

    final displayName = user.displayName ?? '';
    final letra = displayName.isNotEmpty ? displayName[0] : "";

    return ListView(
      children: [
        CircleAvatar(
          radius: 75,
          child: Text(
            letra,
            style: TextStyle(fontSize: 65),
          ),
          backgroundImage:
              user.photoURL != null ? NetworkImage(user.photoURL!) : null,
        ),
        Text(displayName),
        Text(user.email ?? ''),
      ],
    );
  }
}
