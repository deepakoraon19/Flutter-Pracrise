import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = "";
  List<Widget> buttons() {
    List<Widget> arr = [];
    List<String> keys = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '*',
      '0',
      '#'
    ];
    for (var i = 0; i < keys.length; i++) {
      arr.add(NumPad(
        text: keys[i].toString(),
        onPressed: () {
          setState(() {
            text += keys[i].toString();
          });
        },
      ));
    }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          height: 200,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 0.64 * MediaQuery.of(context).size.height,
          child: GridView.count(
            crossAxisCount: 3,
            children: buttons(),
          ),
        ),
      ]),
    );
  }
}

class NumPad extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const NumPad({super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.amber),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 232, 215, 214))))),
        child: Text(text),
      ),
    );
  }
}
