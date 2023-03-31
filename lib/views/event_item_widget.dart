import 'package:event_mgmt_sys/models/event.dart';
import 'package:event_mgmt_sys/utils/color_constants.dart';
import 'package:event_mgmt_sys/utils/custom_date_utils.dart';
import 'package:event_mgmt_sys/utils/route_constants.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  final Event? event;

  const EventItemWidget(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, eventDetailRoute, arguments: event),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "${event?.eventPicture}",
                height: 64,
                width: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${event?.address}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${event?.ticketPrice}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: buttonColor, fontWeight: FontWeight.w600),
                  ),
                  Text("From : ${CustomDateUtils().getDateTime(event?.startDate ?? DateTime.now())}"),
                  Text("To: ${CustomDateUtils().getDateTime(event?.endDate ?? DateTime.now())}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
