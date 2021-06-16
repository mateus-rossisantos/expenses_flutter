import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    Future.delayed(Duration.zero, () async {
      widget.onSubmit(title, value, _selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AdaptativeTextField(
              controller: titleController,
              //fn: _submitForm(),
              label: 'Título',
            ),
            AdaptativeTextField(
              label: 'Valor R\$:',
              controller: valueController,
              //fn: _submitForm(),
              keyboard: TextInputType.numberWithOptions(decimal: true),
            ),
            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateChange: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton(
                  label: 'NovaTransação',
                  onPressed: _submitForm,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
