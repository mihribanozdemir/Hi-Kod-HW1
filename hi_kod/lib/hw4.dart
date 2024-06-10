import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Week6 extends StatefulWidget {
  @override
  _formuDoldur createState() => _formuDoldur();
}

class _formuDoldur extends State<Week6> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _gender = 'Erkek';
  bool _isAdult = false;
  bool _isSmoker = false;
  double _cigarettesPerDay = 0;
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişilik Anketi'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Adınız ve Soyadınız'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen adınızı giriniz';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: _gender,
                    decoration:
                        InputDecoration(labelText: 'Cinsiyetinizi seçiniz'),
                    items: ['Erkek', 'Kadın', 'Belirtmek istemiyorum']
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  CheckboxListTile(
                    title: Text('Reşit misiniz?'),
                    value: _isAdult,
                    onChanged: (value) {
                      setState(() {
                        _isAdult = value!;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Sigara kullanıyor musunuz?'),
                    value: _isSmoker,
                    onChanged: (value) {
                      setState(() {
                        _isSmoker = value!;
                      });
                    },
                  ),
                  if (_isSmoker)
                    Column(
                      children: [
                        Text('Günde kaç tane sigara kullanıyorsunuz?'),
                        Slider(
                          value: _cigarettesPerDay,
                          min: 0,
                          max: 40,
                          divisions: 40,
                          label: _cigarettesPerDay.round().toString(),
                          onChanged: (value) {
                            setState(() {
                              _cigarettesPerDay = value;
                            });
                          },
                        ),
                      ],
                    ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          _isSubmitted = true;
                        });
                      }
                    },
                    child: Text('Bilgilerimi gönder'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            if (_isSubmitted)
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Adınız ve Soyadınız: $_name'),
                    Text('Cinsiyetiniz: $_gender'),
                    Text('Reşit misiniz?: ${_isAdult ? "Evet" : "Hayır"}'),
                    Text(
                        'Sigara kullanıyor musunuz?: ${_isSmoker ? "Evet" : "Hayır"}'),
                    if (_isSmoker)
                      Text(
                          'Günde kaç tane sigara kullanıyorsunuz?: ${_cigarettesPerDay.round()}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
