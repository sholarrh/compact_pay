//ADIGUN SOLAFUNMI

import 'package:compact_pay/widgets/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/show_snackbar.dart';
import '../../widgets/text_form_field.dart';
import '../set_transaction_pin.dart';

class KycVerification extends StatefulWidget {
  const KycVerification({Key? key}) : super(key: key);

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
  String dropdownValue = 'National Identification Number';

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool _kycIsLoading = false;

  final List<bool> _validate = [false, false];

  void _updateFormFieldsFilled(String val, int index) {
    if (val.isEmpty) {
      _validate.isNotEmpty ? _validate.removeAt(index) : null;
      _validate.insert(index, false);
      setState(() {});
    } else {
      //if (validate[index])
      _validate.isNotEmpty ? _validate.removeAt(index) : null;
      _validate.insert(index, true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    data.identificationTextController.text = dropdownValue;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.02799,
                left: width * 0.0533,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: black2121,
                  size: 17,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: width * 0.0533,
                  right: width * 0.0533,
                  top: height * 0.05788,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        'KYC Verification',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.03448,
                                bottom: height * 0.00985),
                            child: MyText(
                              'Address',
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: black2121,
                            ),
                          ),
                          InputField(
                            inputController: data.addressTextController,
                            isPassword: false,
                            hintText: 'Enter Address',
                            hasSuffixIcon: false,
                            keyBoardType: TextInputType.name,
                            validator: validateFullName,
                            onChanged: (value) {
                              _updateFormFieldsFilled(value, 0);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.030788,
                                bottom: height * 0.00985),
                            child: MyText(
                              'Valid Means of Identification',
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: black2121,
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.4),
                                )),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              enableFeedback: true,
                              dropdownColor: white,
                              isExpanded: true,
                              iconSize: 30,
                              iconEnabledColor: black2121.withOpacity(0.9),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: black2121.withOpacity(0.9),
                                fontFamily: 'Poppins',
                              ),
                              items: <String>[
                                'National Identification Number',
                                'Voters Card',
                                'Driver\'s Licence',
                                'International Passport',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: MyText(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  data.identificationTextController.text =
                                      dropdownValue;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.030788,
                                bottom: height * 0.00985),
                            child: MyText(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: black2121,
                              'Number',
                            ),
                          ),
                          InputField(
                            inputController:
                                data.identificationNumberTextController,
                            isPassword: false,
                            hintText: 'Enter number',
                            hasSuffixIcon: false,
                            keyBoardType: TextInputType.number,
                            validator: validateNumber,
                            onChanged: (value) {
                              _updateFormFieldsFilled(value, 1);
                            },
                            inputFormatters: FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.030788,
                                bottom: height * 0.00985),
                            child: MyText(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: black2121,
                              'Bank verification Number (BVN)',
                            ),
                          ),
                          InputField(
                            inputController: data.bvnTextController,
                            isPassword: false,
                            hintText: 'Enter BVN',
                            hasSuffixIcon: false,
                            keyBoardType: TextInputType.number,
                            validator: validateBvnNumber,
                            onChanged: (value) {
                              _updateFormFieldsFilled(value, 2);
                            },
                            inputFormatters: FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: height * 0.061576,
                            ),
                            child: MyButton(
                              height: 54,
                              width: double.infinity,
                              color: _validate.contains(false)
                                  ? unValidated
                                  : mainBlue,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  _kycIsLoading = true;
                                  setState(() {});

                                  Duration waitTime =
                                      const Duration(seconds: 4);
                                  Future.delayed(waitTime, () {
                                    _kycIsLoading = false;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  });

                                  try {
                                    await data.putKycUpdate().then((value) {
                                      if (data.putKycResponse.statusCode ==
                                              200 ||
                                          data.putKycResponse.statusCode ==
                                              201) {
                                        data.addressTextController.clear();
                                        data.passwordTextController.clear();
                                        data.bvnTextController.clear();
                                        data.identificationNumberTextController
                                            .clear();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SetTransactionPin()));
                                      } else {
                                        showSnackBar(context, black2121,
                                            'status code: ${data.putKycResponse.statusCode}\n${data.errorMessage}');
                                      }
                                    });
                                  } catch (e, s) {
                                    if (kDebugMode) {
                                      print(e);
                                    }
                                    if (kDebugMode) {
                                      print(s);
                                    }
                                  }
                                } else {
                                  showSnackBar(context, black2121,
                                      'Please fill the form correctly');
                                }
                              },
                              child: _kycIsLoading == false
                                  ? MyText(
                                      'Continue',
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        color: white,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
