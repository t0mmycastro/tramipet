import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tramipet/app/ui/routes/routes.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50),
          LabelButton(
            label: 'Pedido de certificado de alumno regular',
            value: '',
            onPressed: () {
              router.pushNamed(Routes.FORM1);
            },
          ),
          LabelButton(
            label: 'Pedido de certificado de alumno de retiro',
            value: '',
            onPressed: () {
              router.pushNamed(Routes.FORM2);
            },
          ),
          LabelButton(
            label: 'Solicitud para mesas de febrero',
            value: '',
            onPressed: () {
              router.pushNamed(Routes.FORM3);
            },
          ),
          LabelButton(
            label: 'Solicitud para mesas libres',
            value: '',
            onPressed: () {
              router.pushNamed(Routes.FORM4);
            },
          ),
        ],
      ),
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
