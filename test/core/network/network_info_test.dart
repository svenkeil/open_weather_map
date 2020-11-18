import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:open_weather_map/core/network/network_info.dart';
import 'package:test/test.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImplementation networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImplementation(mockDataConnectionChecker);
  });

  group('is connected', () {
    test('should foward the call to DataConnectionChecker.hasConnection', () {
      final tHasActiveNetworkFuture = Future.value(true);
      // Assert
      when(networkInfo.hasActiveNetwork)
          .thenAnswer((_) => tHasActiveNetworkFuture);

      // Act
      final result = networkInfo.hasActiveNetwork;

      // Assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasActiveNetworkFuture);
    });
  });
}
