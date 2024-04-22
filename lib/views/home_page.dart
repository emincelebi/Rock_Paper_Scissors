import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/components/enums.dart';
import 'package:rock_paper_scissors/service/rpa_service.dart';
import 'package:rock_paper_scissors/widgets/my_button.dart';

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

  void handleButton(Rpa selectedOption) {
    setState(() {
      choice = selectedOption;
      choicePhone = RpaService().phoneChoice();
      isKnow = RpaService().compareToChoose(choicePhone, selectedOption);
      isStart = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
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
                      onPressed: () => handleButton(Rpa.rock), text: 'Rock'),
                  MyButton(
                      onPressed: () => handleButton(Rpa.paper), text: 'Paper'),
                  MyButton(
                    onPressed: () => handleButton(Rpa.scissors),
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
    );
  }
}
