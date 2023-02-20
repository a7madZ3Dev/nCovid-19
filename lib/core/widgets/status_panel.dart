import 'package:flutter/material.dart';

import '/core/utils/size_config.dart';
import '/models/status_panel.dart';

class StatusPanelWidget extends StatelessWidget {
  final StatusPanel statusPanel;

  const StatusPanelWidget({
    required this.statusPanel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: statusPanel.panelColor,
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(10),
        height: 80,
        width: SizeConfig.safeBlockHorizontal * 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              statusPanel.title!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: statusPanel.textColor),
            ),
            Text(
              statusPanel.count!.toString(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: statusPanel.textColor),
            )
          ],
        ),
      );
}
