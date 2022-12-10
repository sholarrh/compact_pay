import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../widgets/my_button.dart';

class ElectricityPage extends StatefulWidget {
  const ElectricityPage({Key? key}) : super(key: key);

  @override
  State<ElectricityPage> createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage> {
  String selected = "first";
  String _selected = '';

  final networkProviders = [
    'Ibadan Electricty Distribution',
    'Ikeja Electricity Distribution',
    'Lagos Electricity Distribution',
    'Ogun Electricity Distribution',
    'Kano Electricity Distribution',
    'Port harcourt Electricity Distribution'
  ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: black_13,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8),
                      MyText(
                        'Electricity',
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                MyText(
                  'Meter Type',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'first';
                        });
                      },
                      child: Container(
                        width: 161,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: selected == 'first' ? lightBlue : white,
                        ),
                        child: Center(
                          child: MyText(
                            'Prepaid',
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: mainBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'second';
                        });
                      },
                      child: Container(
                        width: 161,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: selected == 'second' ? lightBlue : white,
                        ),
                        child: Center(
                          child: MyText(
                            'Postpaid',
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: black2121,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                MyText(
                  'Service Provider',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                const SizedBox(height: 8),
                InputField3(
                  inputController: data.chooseProvider,
                  hintText: 'Choose Provider',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          color: ash3,
                          child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 30, right: 20),
                              decoration: const BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText(
                                        'Choose Provider',
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: black2121,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        iconSize: 17,
                                        color: black_13,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 2,
                                    thickness: 2,
                                    color: ashColor,
                                  ),
                                  Expanded(
                                    child: ListView.separated(
                                      itemCount: networkProviders.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/Ellipse 195.png'),
                                          ),
                                          title: Text(networkProviders[index]),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const Divider();
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                MyText(
                  'Meter Number',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                InputField3(
                  inputController: data.meterNumber,
                  hintText: 'Enter Meter Number',
                  keyBoardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                MyText(
                  'Amount',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                const SizedBox(height: 8),
                InputField3(
                  inputController: data.amount,
                  hintText: 'Enter Amount',
                  keyBoardType: TextInputType.number,
                ),
                const SizedBox(height: 70),
                MyButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        color: ash3,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, top: 30, right: 20),
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 123),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(
                                      'Input PIN',
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black2121,
                                    ),
                                    const SizedBox(width: 100),
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      iconSize: 17,
                                      color: black_13,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              PinCodeTextField(
                                appContext: context,
                                length: 4,
                                obscureText: true,
                                autoFocus: true,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  print(value);
                                },
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(10),
                                  fieldHeight: 54,
                                  fieldWidth: 54,
                                  inactiveColor: ash2,
                                  activeColor: mainBlue,
                                ),
                              ),
                              const SizedBox(height: 10),
                              MyText(
                                'Forgot PIN?',
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: mainBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: MyText(
                        'Confirm',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
