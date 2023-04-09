import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heydocapp/domain/models/clinic_model.dart';
import 'package:heydocapp/presentation/meet%20booking/book_session_vm.dart';
import 'package:intl/intl.dart';

class BookSession extends ConsumerStatefulWidget {
  final ClinicModel _clinicModel;
  const BookSession(this._clinicModel, {super.key});
  @override
  ConsumerState<BookSession> createState() => _BookSessionState();
}

class _BookSessionState extends ConsumerState<BookSession> {
  @override
  void initState() {
    ref.read(bookSessionVMProvider).clinicModel = widget._clinicModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookSessionVM = ref.watch(bookSessionVMProvider);
    return bookSessionVM.isLoading
        ? const SpinKitSpinningLines(
            color: Colors.purple,
            size: 64,
          )
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text('Schedule Session'),
            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Padding(padding: EdgeInsets.only(top: 16)),
              Container(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: ListTile(
                  title: Text(bookSessionVM.bookingDate),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_month_outlined),
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateFormat('yMMMd')
                            .parse(bookSessionVM.bookingDate),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2099),
                      );
                      bookSessionVM.onSelectDate(selectedDate);
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: ListTile(
                  title: Text(bookSessionVM.bookingTime),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_month_outlined),
                    onPressed: () async {
                      TimeOfDay? selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(DateFormat('jm')
                              .parse(bookSessionVM.bookingTime)));
                      bookSessionVM.onSelectTime(selectedTime);
                    },
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Container(
                padding: const EdgeInsets.only(right: 32, left: 32),
                child: ElevatedButton(
                    onPressed: () {
                      bookSessionVM.makePayment();
                    },
                    child: const Center(child: Text('Send Request'))),
              ),
            ]),
          );
  }
}
