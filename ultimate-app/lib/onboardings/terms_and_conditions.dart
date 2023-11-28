import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/route/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TermsAndConditionsPage(),
    );
  }
}

class TermsAndConditionsPage extends StatefulWidget {
  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool agree = false;

  List<String> termTitles = [
    '1. Acceptance of Terms',
    '2. Use of Our Services',
    '3. User Accounts',
    '4. Content and Copyright',
    '5. Changes to Terms and Conditions',
    '6. Limitation of Liability',
    '7. Governing Law',
    '8. Contact Information'
  ];
  List<String> termDescriptions = [
    'By accessing or using our application, you agree to be bound by these terms and conditions. If you disagree with any part of these terms, you may not use our services.',
    'You must follow any guidelines or policies associated with our services. Misuse of our services may result in suspension or termination of your account.',
    'When creating an account with us, you must provide accurate and complete information. You are responsible for safeguarding your account credentials and for any activity occurring under your account.',
    'You may not modify, adapt, or reproduce our content without our written permission. All content on our platform is protected by copyright laws.',
    'We reserve the right to update or modify these terms and conditions at any time. Please check these terms periodically for changes.',
    'Our application is provided "as is" without any warranties, express or implied. We shall not be liable for any indirect, special, or consequential damages arising out of your use of our services.',
    'These terms and conditions are governed by and construed in accordance with the laws of [Your Jurisdiction]. Any disputes shall be subject to the exclusive jurisdiction of the courts in [Your Jurisdiction].',
    'If you have any questions about these terms and conditions, please contact us at [Your Contact Email].'
  ];

  // This function is triggered when the button is clicked
  void onAccept() {
    Navigator.pushReplacementNamed(context, Routes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 13,
            ),
            const Text(
              'Terms and Ccondtions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Last updated on June 23, 2023',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              height: 0.5,
              color: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: termTitles
                    .length, // Specify the number of items in the list
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        termTitle(termTitles[index]),
                        const SizedBox(height: 5),
                        termDescription(termDescriptions[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: agree,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) {
                            return agree ? primary! : Colors.transparent!;
                          },
                        ),
                        onChanged: (value) {
                          setState(() {
                            agree = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'I have read and accept terms and conditions',
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(20.0),
                        ),
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) {
                            if (agree) {
                              return primary;
                            }
                            // Default color
                            return Colors.grey;
                          },
                        ),
                      ),
                      onPressed: agree ? onAccept : null,
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text termDescription(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17.0,
        color: Color.fromARGB(255, 154, 152, 152),
      ),
    );
  }

  Text termTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
