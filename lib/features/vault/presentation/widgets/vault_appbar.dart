import 'package:flutter/material.dart';
import 'package:lockin/common/widgets/appbar/appbar.dart';

class VaultAppbar extends StatelessWidget {
  const VaultAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Text("Vault"),
      actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
    );
  }
}
