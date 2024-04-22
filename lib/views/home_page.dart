import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/components/enums.dart';
import 'package:rock_paper_scissors/service/rpa_service.dart';
import 'package:rock_paper_scissors/widgets/my_alert_dialog.dart';
import 'package:rock_paper_scissors/widgets/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Rpa? choicePhone;
  Rpa? choice;
  bool isStart = false;
  int? isKnow;
  int? highest;
  int counter = 0;
  late final SharedPreferences prefs;

  @override
  void initState() {
    initilaze();
    super.initState();
  }

  initilaze() async {
    prefs = await SharedPreferences.getInstance();
    highest = prefs.getInt('highest') ?? 0;
    setState(() {});
  }

  Future<void> scores(int? isTrue) async {
    int number = 0;
    switch (isTrue) {
      case 0:
        number = prefs.getInt('draw') ?? 0;
        number++;
        await prefs.setInt('draw', number);
        break;
      case 1:
        number = prefs.getInt('lose') ?? 0;
        number++;
        counter = 0;
        await prefs.setInt('lose', number);
        break;
      case 2:
        number = prefs.getInt('win') ?? 0;
        number++;
        counter++;
        if (counter > (prefs.getInt('highest') ?? 0)) {
          await prefs.setInt('highest', counter);
          highest = prefs.getInt('highest');
        }
        await prefs.setInt('win', number);
        break;
    }
    setState(() {});
  }

  void handleButton(Rpa selectedOption) async {
    choice = selectedOption;
    choicePhone = RpaService().phoneChoice();
    isKnow = RpaService().compareToChoose(choicePhone, selectedOption);
    isStart = true;
    await scores(isKnow);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Highest Score: ${highest ?? 0}',
            style: Theme.of(context).textTheme.labelSmall),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return MyAlertDialog(
                      win: prefs.getInt('win') ?? 0,
                      lose: prefs.getInt('lose') ?? 0,
                      draw: prefs.getInt('draw') ?? 0,
                    );
                  },
                );
              },
              icon: const Icon(Icons.align_vertical_bottom_outlined))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                choicePhone == null
                    ? 'Choice of Phone: '
                    : 'Choice of Phone: ${choicePhone!.description}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Choose option: ',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      onPressed: () {
                        handleButton(Rpa.rock);
                        setState(() {});
                      },
                      text: 'Rock'),
                  MyButton(
                      onPressed: () {
                        handleButton(Rpa.paper);

                        setState(() {});
                      },
                      text: 'Paper'),
                  MyButton(
                    onPressed: () {
                      handleButton(Rpa.scissors);
                      setState(() {});
                    },
                    text: 'Scissors',
                  ),
                ],
              ),
              const SizedBox(height: 35),
              isStart
                  ? Text(
                      RpaService().result(isKnow) ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          isStart = false;
          choicePhone = null;
          await prefs.setInt('draw', 0);
          await prefs.setInt('lose', 0);
          await prefs.setInt('win', 0);
          await prefs.setInt('highest', 0);
          highest = 0;
          counter = 0;
          setState(() {});
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
