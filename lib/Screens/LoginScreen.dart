import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/models/LoginResponse.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Enter email",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Enter password"),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => onSubmit(),
                child: Container(
                  height: 40,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    LoginApi(1, emailController.text, passwordController.text, (onresponse) {
      getUserDetail(1, 'Bearer ' + onresponse.replaceAll("\"", ""));
    }, "", "a");
  }

  Future<void> getUserDetail(int reDirectType, String response) async {
    Map<String, dynamic> data = {'Content-Type':'application/json',"Authorization": response};
    print(data);
    var result = await Dio().get(
        "http://opso.dev.drcsystems.ooo/magento-projects/annabelle-web-api/rest/V1/customers/me",
        options: Options(headers: data));
    if (result.statusCode == 200) {
      var list = loginResponseFromJson(result.data);
      print(list);
    } else {
      print("error");
    }
  }

  void LoginApi(
      int reDirectType,
      String email,
      String password,
      Function(String) onResponse,
      String BuildVersion,
      String DeviceType) async {
    Map<String, dynamic> LoginData = {
      "username": email,
      "password": password,
      "devicetoken": "",
      "devicetype": DeviceType,
      "deviceid": await getId()
    };
    var result = await Dio().request(
        "http://opso.dev.drcsystems.ooo/magento-projects/annabelle-web-api/rest/V1/integration/customer/customtoken",
        queryParameters: LoginData,
        options: Options(method: "POST",));
    if (result.statusCode == 200) {
      onResponse(result.data);
    }
  }

  getId() async {
    var deviceInfo = DeviceInfoPlugin();
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId;
  }
}
