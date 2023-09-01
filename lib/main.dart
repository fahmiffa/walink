import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: WhatsAppForm(),
  ));
}

class WhatsAppForm extends StatefulWidget {
  @override
  _WhatsAppFormState createState() => _WhatsAppFormState();
}

class _WhatsAppFormState extends State<WhatsAppForm> {
  TextEditingController phoneNumberController = TextEditingController();
  Future<void> _launchUrl(phoneNumber) async {
    // final Uri _url = Uri.parse('https://wa.me/$phoneNumber');
    // final Uri _url = Uri.parse('https://api.whatsapp.com/send?phone=$phoneNumber');
    final Uri _url = Uri.parse('whatsapp://send?phone=$phoneNumber');
    
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WALink'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 150.0), // Spacer
            TextField(
              cursorColor: Colors.green,
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Number',
                labelStyle: TextStyle(
                  color: Colors.green, // Change to your desired green color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.green), // Change to your desired green color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.green), // Change to your desired green color
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green), // Change to your desired green color
              ),
              onPressed: () {
                final phoneNumber = phoneNumberController.text;
                final number = (phoneNumber.isNotEmpty && phoneNumber[0] == '0')
                    ? '62' + phoneNumber.substring(1)
                    : phoneNumber;
                print(number);
                _launchUrl(number);
              },
              child: Text('Open'),
            ),
          ],
        ),
      ),
    );
  }
}
