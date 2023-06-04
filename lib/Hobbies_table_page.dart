import 'package:flutter/material.dart';
import 'user_model.dart';
import 'global_state.dart';

class HobbiesTablePage extends StatefulWidget {
  final List<User> users;

  const HobbiesTablePage({Key? key, required this.users}) : super(key: key);

  @override
  _HobbiesTablePageState createState() => _HobbiesTablePageState();
}

class _HobbiesTablePageState extends State<HobbiesTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hobbies Table'),
      ),
      body: Column(
        children: [
          _buildStatsSection(),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('User count: ${GlobalState.userCount}'),
          Text('Average age: ${GlobalState.avgAge.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildTable() {
    Map<String, int> hobbyCounts = _calculateHobbyCounts();

    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Hobby',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Count',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: hobbyCounts.entries.map((entry) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(entry.key),
                      onTap: () {
                        // Implement your logic here
                      },
                    ),
                    DataCell(
                      Text(entry.value.toString()),
                      onTap: () {
                        // Implement your logic here
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, int> _calculateHobbyCounts() {
    Map<String, int> hobbyCounts = {};

    for (User user in widget.users) {
      String? hobby = user.interest;

      if (hobbyCounts.containsKey(hobby)) {
        hobbyCounts[hobby] = hobbyCounts[hobby]! + 1;
      } else {
        hobbyCounts[hobby] = 1;
      }
    }

    return hobbyCounts;
  }
}
