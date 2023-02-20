import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:url_launcher/url_launcher.dart';

import '/core/widgets/panel_row.dart';
import '/screens/faqs.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            RowPanel(
              onTap: () => getx.Get.to(
                () => const FAQ(),
                transition: getx.Transition.rightToLeftWithFade,
              ),
              title: 'FAQS',
            ),
            RowPanel(
              onTap: () => launch('https://covid19responsefund.org/'),
              title: 'DONATE ',
              subTitle: '(open WHO website)',
            ),
            RowPanel(
              onTap: () => launch(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters'),
              title: 'MYTH BUSTERS ',
              subTitle: '(rumors busted)',
            ),
          ],
        ),
      );
}
