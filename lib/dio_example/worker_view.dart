import 'package:dioexample/widgets/list_item.dart';

import '../dio_example/worker_model.dart';
import 'package:flutter/material.dart';

import 'worker_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Workers'),
        ),
        body: Center(
          child: FutureBuilder<List<Worker>>(
            future: _client.fetchWorkers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show a loading indicator while fetching data
              } else if (snapshot.hasError) {
                return Text(
                    'Error: ${snapshot.error}'); // Show an error message if there's an error
              } else if (!snapshot.hasData) {
                return const Text(
                    'No data available'); // Show a message if there's no data
              } else {
                List<Worker>? workers = snapshot.data;
                return ListView.builder(
                  itemCount: workers!.length,
                  itemBuilder: (context, index) {
                    Worker worker = workers[index];
                    return ListDataItem(
                      title: worker.name!,
                      subtitle: worker.services!,
                      phone: worker.tel1!,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
