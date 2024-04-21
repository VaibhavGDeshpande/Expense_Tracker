import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(Expense());
}

class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Graph Screen'),
        ),
        body: GraphBody(),
      ),
    );
  }
}

class GraphBody extends StatefulWidget {
  @override
  _GraphBodyState createState() => _GraphBodyState();
}

class _GraphBodyState extends State<GraphBody> {
  bool _showIncome = true;

  Map<String, double> dataMap = {
    'Income': 5000,
    'Expenses': 3000,
  };

  List<Color> colorList = [
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 1.5,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText: 'Budget Overview',
                legendOptions: const LegendOptions(
                  showLegendsInRow: true,
                  legendPosition: LegendPosition.bottom,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showIncome = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: _showIncome ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Income',
                    style: TextStyle(
                      color: _showIncome ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showIncome = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: !_showIncome ? Colors.red : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Expense',
                    style: TextStyle(
                      color: !_showIncome ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemCount: _showIncome ? incomeItems.length : expenseItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_showIncome ? incomeItems[index] : expenseItems[index]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount: \₹${_showIncome ? incomeAmounts[index] : expenseAmounts[index]}'),
                    Text('Date: ${_showIncome ? incomeDates[index] : expenseDates[index]}'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Add functionality to navigate to item details screen
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

List<String> incomeItems = ['Food', 'Transport', 'Education'];
List<String> expenseItems = ['Food', 'Transport', 'Entertainment'];

List<double> incomeAmounts = [2000, 1500, 1500];
List<double> expenseAmounts = [500, 1000, 1500];

List<String> incomeDates = ['April 15, 2024', 'April 18, 2024', 'April 20, 2024'];
List<String> expenseDates = ['April 16, 2024', 'April 17, 2024', 'April 19, 2024'];
