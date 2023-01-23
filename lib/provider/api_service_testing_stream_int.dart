import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceTestingStreamIntProvider =
    Provider<ApiServiceTestingStreamInt>((ref) {
  return ApiServiceTestingStreamInt();
});
final streamIntProvider = StreamProvider.autoDispose<int>((ref) {
  final apiServiceTestingStreamIntWatch = ref.watch(apiServiceTestingStreamIntProvider);
  return apiServiceTestingStreamIntWatch.getStream();
});

class ApiServiceTestingStreamInt {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (count) => count++);
  }
}
