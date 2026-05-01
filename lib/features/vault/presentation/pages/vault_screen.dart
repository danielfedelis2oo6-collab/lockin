import 'package:flutter/material.dart';
import 'package:lockin/constants/colors.dart';
import 'package:lockin/features/vault/presentation/widgets/vault_appbar.dart';

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.darkGrey20,
      body: SafeArea(
        child: SingleChildScrollView(child: Column(children: [VaultAppbar()])),
      ),
    );
  }
}
