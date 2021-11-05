import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';
import 'package:tramipet/app/ui/global_controllers/theme_controller.dart';
import 'package:tramipet/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tramipet/app/ui/pages/home/tabs/profile/widgets/label_button.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import '../../../../utils/dark_mode_extension.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final sessionController = ref.watch(sessionProvider);
    final isDark = context.isDarkModeAlias;
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
          //  backgroundImage:
          //    user.photoURL != null ? NetworkImage(user.photoURL!) : null,      - Configuro cuando sepa manejar mejor la API
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Modo oscuro"),
              CupertinoSwitch(
                value: isDark,
                activeColor: isDark ? Colors.cyan : Colors.blue,
                onChanged: (_) {
                  themeProvider.read.toggle();
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        LabelButton(
          label: "Salir",
          value: "",
          onPressed: () async {
            ProgressDialog.show(context);
            await sessionProvider.read.signOut();
            router.pushNamedAndRemoveUntil(Routes.LOGIN);
          },
        ),
      ],
    );
  }
}
