import 'dart:io';
import 'package:dart_mssql/dart_mssql.dart';

void main() async {
  SqlConnection connection = SqlConnection(host:"sql5097.site4now.net", db:"DB_A6C743_zhyar99", user:"DB_A6C743_zhyar99_admin", password:"Zhyarzhyar9991");
  String cmd = "select username from users";
  
  SqlResult result = connection.execute(cmd,[4]);
  result.rows.forEach((e) {
    print("${e.username}");
  });
  print("end of printing.");
  connection.close();
  stdin.readLineSync();
}