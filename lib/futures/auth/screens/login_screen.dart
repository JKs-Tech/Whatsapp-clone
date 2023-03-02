import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/common_file/utils/utils.dart';
import 'package:whatsapp/common_file/widgets/my_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp/futures/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/loginScreen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickcontery() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneToOTP() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, "+${country!.phoneCode}$phoneNumber");
      showSnackbar(context: context, content: "OTP sent Succesfully");
    } else {
      showSnackbar(
          context: context, content: "Kindely Fill out All the Fileds");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Verify your phone number"),
          elevation: 0,
          backgroundColor: backgroundColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Text(
                "WhatsApp will send an SMS message to verify your phone number.",
                style: TextStyle(height: 1.5),
                textAlign: TextAlign.center,
              ),
              Text(
                "Choose your contery code and enter your phone number",
                style: TextStyle(height: 1.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: (() {
                    pickcontery();
                  }),
                  child: Text("Pick Contery")),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  if (country != null)
                    Text(
                      "+${country!.phoneCode}",
                      style: TextStyle(fontSize: 18),
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: "Enter Phone number",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              SizedBox(
                width: size.width * 0.30,
                child: MyButton(
                  text: 'Next',
                  onPressed: () {
                    sendPhoneToOTP();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
