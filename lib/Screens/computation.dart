import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Screens/download_data.dart';
import 'package:flutterapp/Screens/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutterapp/Screens/upload_data.dart';
import 'package:flutterapp/Screens/setup_screen.dart';
import 'package:flutterapp/Screens/settings_screen.dart';
import 'package:flutterapp/Screens/profile_screen.dart';
class HomeScreen extends StatelessWidget {
  final _qtyController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final _totalController = TextEditingController();

  void _computeTotal() {
    final qty = int.tryParse(_qtyController.text) ?? 0;
    final unitPrice = double.tryParse(_unitPriceController.text) ?? 0.0;
    final total = qty * unitPrice;
    _totalController.text = total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ...
                DataTable(
                  columns: [
                    DataColumn(label: Text('Qty')),
                    DataColumn(label: Text('Unit Price')),
                    DataColumn(label: Text('Total')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          TextField(
                            controller: _qtyController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            onChanged: (_) => _computeTotal(),
                          ),
                        ),
                        DataCell(
                          TextField(
                            controller: _unitPriceController,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            onChanged: (_) => _computeTotal(),
                          ),
                        ),
                        DataCell(
                          TextFormField(
                            controller: _totalController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
