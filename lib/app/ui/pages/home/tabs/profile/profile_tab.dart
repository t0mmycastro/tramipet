import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/domain/repositories/authentication_repository.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

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
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 75,
          child: Text(
            letra,
            style: const TextStyle(fontSize: 65),
          ),
          backgroundImage:
              user.photoURL != null ? NetworkImage(user.photoURL!) : null,
        ),
        const SizedBox(height: 10),
        Center(
            child: Text(
          displayName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        Center(child: Text(user.email ?? '')),
        const SizedBox(height: 50),
        const Center(
            child: Text("Información del usuario",
                style: TextStyle(fontWeight: FontWeight.w500))),
        const SizedBox(height: 20),
        LabelButton(label: "Nombre", value: displayName),
        LabelButton(label: "Email", value: user.email ?? ''),
        const LabelButton(label: "Solicitudes pedidas", value: ''),
        const SizedBox(height: 100),
        LabelButton(
          label: "Salir",
          value: "",
          onPressed: () async {
            await sessionProvider.read.signOut();
            router.pushNamedAndRemoveUntil(Routes.LOGIN);
          },
        ),
      ],
    );
  }
}

class LabelButton extends StatelessWidget {
  final String label, value;
  final VoidCallback? onPressed;
  const LabelButton(
      {Key? key, required this.label, required this.value, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onPressed,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        leading: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.w300)),
            const SizedBox(width: 5),
            const Icon(
              Icons.chevron_right_rounded,
              size: 22,
            )
          ],
        ),
      );
}
