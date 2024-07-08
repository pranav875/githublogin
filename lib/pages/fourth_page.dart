import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  String _status = '';
  String _address = '';
  String _gender = '';
  String _motherTongue = '';
  DateTime _dateOfBirth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _age = int.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Status'),
                onSaved: (value) => _status = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) => _address = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gender'),
                onSaved: (value) => _gender = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mother Tongue'),
                onSaved: (value) => _motherTongue = value!,
              ),
              ListTile(
                title: Text("Date of Birth"),
                subtitle: Text("${_dateOfBirth.toLocal()}".split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _dateOfBirth,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _dateOfBirth)
                    setState(() {
                      _dateOfBirth = picked;
                    });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the data
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}