import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

//значения радиокнопок - гречка, липа, каштан
enum HoneyType { buckwheat, linden, chestnut }

class _NavigationDrawerState extends State<NavigationDrawer> {

  HoneyType? _honeyType = HoneyType.buckwheat;

  void _onRadioChanged(HoneyType? value) {
    setState(() {
      _honeyType = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    //стиль текстовой кнопки в AppBar
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme
        .of(context)
        .colorScheme
        .onPrimary);

    //стиль текста радиокнопок
    const TextStyle textStyle = TextStyle(
        color: Color(0xFF753014),
        fontSize: 25.0,
        fontWeight: FontWeight.bold);

    return MaterialApp(
      //scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.brown,
            title: const Text('Мёд'),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
              TextButton(onPressed: () {},
                child: const Text('Настройки'),
                style: buttonStyle,)
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.brown),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50.0))),
                        child: const Image(
                            image: AssetImage('assets/images/vinni.png')),
                      ),
                      const Text('Мёд есть.',
                        style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('ВСЕ-ВСЕ-ВСЕ'),
                ),
                const Divider(color: Colors.brown, thickness: 2.0),
                ListTile(
                  leading: const Icon(Icons.android),
                  title: const Text('Пятачок'),
                  onTap: () {},
                ),
                const Divider(color: Colors.brown),
                ListTile(
                  leading: const Icon(Icons.adb_sharp),
                  title: const Text('Сова'),
                  onTap: () {},
                ),
                const Divider(color: Colors.brown),
                ListTile(
                  leading: const Icon(Icons.android_sharp),
                  title: const Text('Ослик'),
                  onTap: () {},
                ),
                const Divider(color: Colors.brown),
                ListTile(
                  leading: const Icon(Icons.account_box_outlined),
                  title: const Text('Кролик'),
                  onTap: () {},
                ),
                const Divider(color: Colors.brown, thickness: 1.5),
              ],
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bees.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 55),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioListTile<HoneyType>(
                  activeColor: const Color(0xFF753014),
                  title: const Text('Гречишный', style: textStyle),
                  value: HoneyType.buckwheat,
                  groupValue: _honeyType,
                  onChanged: _onRadioChanged
                  ),
                RadioListTile<HoneyType>(
                  activeColor: const Color(0xFF753014),
                  title: const Text('Липовый', style: textStyle),
                  value: HoneyType.linden,
                  groupValue: _honeyType,
                  onChanged: _onRadioChanged
              ),
                RadioListTile<HoneyType>(
                    activeColor: const Color(0xFF753014),
                    title: const Text('Каштановый', style: textStyle),
                    value: HoneyType.chestnut,
                    groupValue: _honeyType,
                    onChanged: _onRadioChanged
                ),
             ],
            ),
          ),
        ),
    );
  }
}
