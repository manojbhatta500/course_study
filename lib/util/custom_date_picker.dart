import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime) onDateSelected;
  final TextEditingController? dateController;
  final String? hintText;

  const CustomDatePicker(
      {Key? key,
      this.initialDate,
      required this.onDateSelected,
      this.hintText,
      this.dateController})
      : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.dateController,
      hintText: widget.hintText,
      fillColor: primaryColor,
      onTap: () {
        _selectDate(context);
      },
      keyBoardType: TextInputType.text,
    );
  }
}
