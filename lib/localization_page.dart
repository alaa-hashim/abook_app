import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_ui_app/classes/language.dart';
import 'package:from_ui_app/localization/language_constants.dart';
import 'package:from_ui_app/main.dart';
import 'l10n/l10n.dart';

class localization extends StatefulWidget {
  @override
  _localizationState createState() => _localizationState();
}

class _localizationState extends State<localization> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Text('Select Country',style: TextStyle(fontSize: 20),),
            ListTile(
              leading:  Text(
              flag,
              style: TextStyle(fontSize: 32),
            ),


            ),
            Divider(thickness: 3.0,),
            ListTile(
              leading:  Text(
                flag,
                style: TextStyle(fontSize: 32),
              ),


            ),
            Divider(thickness: 3.0,),
            ListTile(
              title: Text('Language'),
              leading: DropdownButton<Language>(
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.blue,
                ),
    onChanged: (Language language) {
    _changeLanguage(language);},
                  items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
      ) ,

          ]
        )
      ),


        );





  }
}
