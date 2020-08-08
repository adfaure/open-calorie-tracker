import 'package:flutter/material.dart';

class DropdownFormField<T> extends FormField<T> {
  DropdownFormField({
    TextEditingController controller,
    Key key,
    InputDecoration decoration,
    T initialValue,
    List<DropdownMenuItem<T>> items,
    bool autovalidate = false,
    FormFieldSetter<T> onSaved,
    FormFieldValidator<T> validator,
    Widget hint,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          initialValue: items.contains(initialValue) ? initialValue : null,
          builder: (FormFieldState<T> field) {
            final InputDecoration effectiveDecoration = (decoration ??
                    const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);

            return InputDecorator(
              textAlign: TextAlign.right,
              decoration: effectiveDecoration.copyWith(
                  errorText: field.hasError ? field.errorText : null),
              isEmpty: field.value == '' || field.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  icon: Icon(Icons.arrow_drop_down_circle),
                  hint: hint,
                  value: field.value,
                  isDense: true,
                  onChanged: (value) {
                    controller.text = value.toString();
                    field.didChange(value);
                  },
                  items: items.toList(),
                ),
              ),
            );
          },
        );
}
