import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class Connection {
  Future<bool> get isConnected;
}

class NetworkInfo extends Connection {
  final DataConnectionChecker connectionChecker;

  NetworkInfo({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
