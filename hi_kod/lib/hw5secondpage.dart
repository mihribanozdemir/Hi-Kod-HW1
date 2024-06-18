import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userInput =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Sonucunuz',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ad ve Soyad: ${userInput['name']}',
                  style: TextStyle(color: Colors.white)),
              Text('Cinsiyetiniz: ${userInput['gender']}',
                  style: TextStyle(color: Colors.white)),
              Text(
                  'Sigara içiyor musun?: ${userInput['isSmoker'] ? 'Evet' : 'Hayır'}',
                  style: TextStyle(color: Colors.white)),
              if (userInput['isSmoker'])
                Text(
                    'Günde kaç adet sigara içiyorsun?: ${userInput['cigaretteCount']}',
                    style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
