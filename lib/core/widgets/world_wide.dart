import 'package:flutter/material.dart';

import '/models/status_panel.dart';
import 'status_panel.dart';

class WorldWidePanel extends StatelessWidget {
  final List<StatusPanel> statusPanels;
  const WorldWidePanel({required this.statusPanels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: statusPanels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2),
          itemBuilder: (context, index) => StatusPanelWidget(
            statusPanel: statusPanels[index],
          ),
        ),
      );
}
