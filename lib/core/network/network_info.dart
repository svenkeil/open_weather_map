import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get hasActiveNetwork;
}

class NetworkInfoImplementation implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImplementation(this.connectionChecker);

  @override
  Future<bool> get hasActiveNetwork => connectionChecker.hasConnection;
}
