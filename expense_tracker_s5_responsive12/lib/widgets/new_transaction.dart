import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx, {Key? key}) : super(key: key);
  Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final String title = _titleController.text;
    final double amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) return;
    widget.addTx(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
        FocusManager.instance.primaryFocus?.unfocus();
      });
    });
  }

  Widget makeDissmissable({required Widget child}) => GestureDetector(
        child: GestureDetector(
          child: child,
          onTap: () {},
        ),
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
      );

  @override
  Widget build(BuildContext context) {
    return makeDissmissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    10), //pulls up the TextField when softkeyboard blocks the view
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (val) {
                    //   String s = val;
                    // },
                    controller: _titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                  //Date picker-->
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? "No date selected"
                              : "Selected date: ${DateFormat.yMMMd().format(_selectedDate as DateTime)}",
                        ),
                        TextButton(
                          onPressed: _presentDatePicker,
                          child: Text(
                            "Select date",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //print(_titleController.text);
                      //print(_amountController.text);
                      _submitData();
                    },
                    child: Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
