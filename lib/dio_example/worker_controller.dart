import 'package:dio/dio.dart';
import '../consts.dart';
import '../dio_example/worker_model.dart';

// =============================================================================
class DioClient {
// -----------------------------------------------------------------------------
// function to get all workers
  Future<List<Worker>> fetchWorkers() async {
    try {
      Response response = await Dio().get(apiUrl);
      List<dynamic> data = response.data;
      List<Worker> workers =
          data.map((worker) => Worker.fromJson(worker)).toList();
      return workers;
    } catch (error) {
      throw Exception('Failed to fetch workers: $error');
    }
  }
}
