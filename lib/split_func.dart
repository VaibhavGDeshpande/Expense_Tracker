import 'package:flutter/material.dart';

void main() {
  runApp(SplitScreen());
}

class SplitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Split Screen'),
        ),
        body: SplitBody(),
      ),
    );
  }
}

class SplitBody extends StatefulWidget {
  @override
  _SplitBodyState createState() => _SplitBodyState();
}

class _SplitBodyState extends State<SplitBody> {
  bool _isEqualSplit = true;
  String _selectedCategory = 'Food';
  DateTime _selectedDate = DateTime.now();
  int _numberOfUsers = 1;
  double _amount = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Amount:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _amount = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Split Type:',
              style: TextStyle(fontSize: 16.0),
            ),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: _isEqualSplit,
                  onChanged: (value) {
                    setState(() {
                      _isEqualSplit = value as bool;
                    });
                  },
                ),
                Text('Equal'),
                Radio(
                  value: false,
                  groupValue: _isEqualSplit,
                  onChanged: (value) {
                    setState(() {
                      _isEqualSplit = value as bool;
                    });
                  },
                ),
                Text('Unequal'),
              ],
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: !_isEqualSplit,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number of Users:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _numberOfUsers = int.tryParse(value) ?? 1;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter number of users',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: _isEqualSplit, // Show only for equal split
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number of Users:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _numberOfUsers = int.tryParse(value) ?? 1;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter number of users',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Category:',
              style: TextStyle(fontSize: 16.0),
            ),
            DropdownButtonFormField(
              value: _selectedCategory,
              items: ['Food', 'Transport', 'Education']
                  .map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value.toString();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Date:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _splitAmount();
              },
              child: Text('Split'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _splitAmount() {
    if (_amount <= 0) {
      // Show error message
      return;
    }

    List<double> amounts;

    if (_isEqualSplit) {
      double equalAmount = _amount / _numberOfUsers;
      amounts = List.generate(_numberOfUsers, (index) => equalAmount);
    } else {
      // Add logic for unequal split
      // For demonstration, let's distribute equally among all users
      double equalAmount = _amount / _numberOfUsers;
      amounts = List.generate(_numberOfUsers, (index) => equalAmount);
    }

    // Now you have amounts distributed among users
    // You can proceed with further processing or display
    print('Split amounts: $amounts');
  }
}
