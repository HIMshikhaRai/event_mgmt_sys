import 'package:event_mgmt_sys/utils/color_constants.dart';
import 'package:event_mgmt_sys/utils/status_enum.dart';
import 'package:event_mgmt_sys/utils/string_constants.dart';
import 'package:event_mgmt_sys/view_models/event_view_model.dart';
import 'package:event_mgmt_sys/views/event_item_widget.dart';
import 'package:event_mgmt_sys/views/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider.of<EventViewModel>(context, listen: false).init();
    Provider.of<EventViewModel>(context, listen: false).getAllEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _addressController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val?.isEmpty ?? false) {
                      return addressEmptyMsg;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (val) => _searchClick(),
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cardColor,
                    hintText: searchAddress,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    suffixIcon: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32),
                            bottomRight: Radius.circular(32)),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () => _searchClick(),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.search,
                                size: 32,
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            thickness: 1,
                          ),
                          const FilterWidget(),
                        ],
                      ),
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    focusedErrorBorder: _getOutlineBorder(),
                    enabledBorder: _getOutlineBorder(),
                    focusedBorder: _getOutlineBorder(),
                    errorBorder: _getOutlineBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer<EventViewModel>(
              builder: (ctx, provider, child) {
                if (provider.status == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.events?.isNotEmpty ?? false) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.events?.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return EventItemWidget(provider.events?[index]);
                        }),
                  );
                }
                return Center(
                  child: Text(
                    eventNotFound,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _searchClick() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      EventViewModel eventViewModel =
          Provider.of<EventViewModel>(context, listen: false);
      eventViewModel.initializeDate();
      eventViewModel.getEvents(_addressController.text.trim()).then((value) {
        if (eventViewModel.status == Status.success) {
          _showSnackBar(eventSuccessMsg);
        } else {
          _showSnackBar(eventViewModel.dataError!.message, type: "error");
        }
      });
    }
  }

  _showSnackBar(String msg, {String type = "info"}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
      ),
      backgroundColor: type == "info" ? Colors.green : Colors.red,
    ));
  }

  _getOutlineBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(32), borderSide: BorderSide.none);
}
