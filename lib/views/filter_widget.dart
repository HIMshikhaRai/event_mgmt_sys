import 'package:event_mgmt_sys/utils/color_constants.dart';
import 'package:event_mgmt_sys/utils/status_enum.dart';
import 'package:event_mgmt_sys/utils/string_constants.dart';
import 'package:event_mgmt_sys/view_models/event_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Provider.of<EventViewModel>(context, listen: false)
                .address
                ?.isNotEmpty ??
            false) {
          _showDialog(context);
        } else {
          Fluttertoast.showToast(
              msg: "Search by address first to apply filter");
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(
          Icons.filter_alt_outlined,
          size: 32,
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              selectDate,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            content: Consumer<EventViewModel>(
              builder: (ctx, provider, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => _selectDate(context, provider, "start"),
                      child: _getField(context, provider.selectedStartDate),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => _selectDate(context, provider, "end"),
                      child: _getField(context, provider.selectedEndDate),
                    )
                  ],
                );
              },
            ),
            actions: [
              TextButton(
                child: Text(
                  cancel,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: buttonColor),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(
                  apply,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: buttonColor),
                ),
                onPressed: () {
                  EventViewModel eventViewModel =
                      Provider.of<EventViewModel>(context, listen: false);
                  if (eventViewModel.selectedStartDate != null &&
                      eventViewModel.selectedStartDate != null) {
                    Navigator.of(context).pop();
                    eventViewModel.filterEventsByDate();
                  } else {
                    Fluttertoast.showToast(msg: "Please enter date");
                  }
                },
              )
            ],
          );
        });
  }

  Future<void> _selectDate(
      BuildContext context, EventViewModel provider, String type) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: (type == "start"
              ? provider.selectedStartDate
              : provider.selectedEndDate) ??
          DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
    );

    if (picked != null &&
        picked !=
            (type == "start"
                ? provider.selectedStartDate
                : provider.selectedEndDate)) {
      if (type == "start") {
        provider.selectedStartDate = picked;
      } else {
        provider.selectedEndDate = picked;
      }
    }
  }

  InputDecorator _getField(BuildContext context, DateTime? dateTime) =>
      InputDecorator(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateTime == null
                  ? selectStartDate
                  : '${dateTime.year}-${dateTime.day}-${dateTime.month}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: cardColor),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      );
}
