import 'package:flutter/material.dart';
import 'hw5secondpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  bool isSmoker = false;
  double cigaretteCount = 0;
  String selectedGender = "Lütfen Cinsiyet seçiniz.";
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadowColor: Colors.black,
        titleSpacing: 25,
        backgroundColor: Colors.orange,
        title: Text(
          'Kişilik Anketi',
          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    name = text;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: 'Lütfen adınızı ve soyadınızı giriniz.',
                  labelText: 'Adınız ve Soyadınız',
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                controller: nameController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Lütfen cinsiyetinizi seçiniz:'),
                DropdownButton(
                  value: selectedGender,
                  onChanged: (String? newGender) {
                    setState(() {
                      selectedGender = newGender!;
                    });
                  },
                  items: <String>['Lütfen Cinsiyet seçiniz.', 'Kadın', 'Erkek']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SwitchListTile(
                value: isSmoker,
                onChanged: (bool newValue) {
                  setState(() {
                    isSmoker = newValue;
                  });
                },
                activeColor: Colors.deepPurple,
                title: Text(
                  'Sigara içiyor musunuz?',
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            Visibility(
              visible: isSmoker,
              child: Column(
                children: [
                  Text('Günde kaç sigara içiyorsunuz?'),
                  Slider(
                    value: cigaretteCount,
                    activeColor: Colors.orangeAccent,
                    inactiveColor: Colors.black,
                    divisions: 50,
                    max: 50,
                    min: 0,
                    label: cigaretteCount.round().toString(),
                    onChanged: (double newValue) {
                      setState(() {
                        cigaretteCount = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second', arguments: {
                  'name': name,
                  'gender': selectedGender,
                  'isSmoker': isSmoker,
                  'cigaretteCount': cigaretteCount,
                });
              },
              child: Text('Bilgileri Gönder'),
            ),
          ],
        ),
      ),
    );
  }
}
