import 'package:event_mgmt_sys/models/event.dart';
import 'package:event_mgmt_sys/utils/custom_date_utils.dart';
import 'package:event_mgmt_sys/utils/string_constants.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final Event event;

  const EventDetailPage({required this.event, Key? key}) : super(key: key);

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(eventDetailPage),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "${widget.event.eventPicture}",
                  height: 64,
                  width: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _richText(eventDescription, "${widget.event.description}"),
            _richText(eventAddress, "${widget.event.address}"),
            _richText(
                eventStartDate,
                CustomDateUtils()
                    .getDateTime(widget.event.startDate ?? DateTime.now())),
            _richText(
                eventEndDate,
                CustomDateUtils()
                    .getDateTime(widget.event.endDate ?? DateTime.now())),
            _richText(eventTicketType, "${widget.event.ticketType}"),
            _richText(eventTicketPrice, "${widget.event.ticketPrice}"),
            const SizedBox(
              height: 32,
            ),
            Center(
                child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(buy))))
          ],
        ),
      ),
    );
  }

  RichText _richText(String title, String value) => RichText(
          text: TextSpan(
              text: title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              children: [
            TextSpan(
              text: value,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            )
          ]));
}
