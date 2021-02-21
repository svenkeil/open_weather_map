import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'network_info.dart';

part 'network_info_implementation.g.dart';

@Injectable()
class NetworkInfoImplementation implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImplementation(this.connectionChecker);

  @override
  Future<bool> get hasActiveNetwork => connectionChecker.hasConnection;
}
