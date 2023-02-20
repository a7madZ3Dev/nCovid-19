import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/utils/colors.dart';
import '/core/utils/questions_and_answers.dart';
import '/core/utils/size_config.dart';
import '/core/widgets/info_panel.dart';
import '/core/widgets/most_affected_panel.dart';
import '/core/widgets/quote_widget.dart';
import '/core/widgets/regional_widget.dart';
import '/core/widgets/world_wide.dart';
import '/providers/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<Data>(context, listen: false).updateData(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('COVID-19'),
          backgroundColor: kprimaryBlack,
          actions: <Widget>[
            IconButton(
                icon: Icon(Theme.of(context).brightness == Brightness.light
                    ? Icons.lightbulb_outline
                    : Icons.highlight),
                onPressed: () {
                  DynamicTheme.of(context)?.setTheme(
                      Theme.of(context).brightness == Brightness.light
                          ? AppThemes.dark
                          : AppThemes.light);
                })
          ]),
      body: Provider.of<Data>(context).allCountries.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () =>
                  Provider.of<Data>(context, listen: false).updateData(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const QuoteWidget(quote: headerQuote),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            'Worldwide',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          RegionalWidget(),
                        ],
                      ),
                    ),
                    Consumer<Data>(
                      builder: (context, data, _) =>
                          WorldWidePanel(statusPanels: data.worldWide),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      child: Text(
                        'Most affected Countries',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Consumer<Data>(
                      builder: (context, data, _) => MostAffectedPanel(
                        countryData: data.mostAffected,
                      ),
                    ),
                    const InfoPanel(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Center(
                          child: Text(
                        'WE STAND TOGETHER TO FIGHT AGAINST THIS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).brightness == Brightness.light
                      ? kprimaryBlack
                      : Colors.white),
            ),
    );
  }
}
