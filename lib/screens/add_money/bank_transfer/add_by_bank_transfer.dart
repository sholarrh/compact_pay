import 'package:compact_pay/screens/add_money/add_money.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/show_snackbar.dart';
import '../../../widgets/text_form_field.dart';
import '../../../widgets/validator.dart';

class AddByBankTransfer extends StatefulWidget {
  const AddByBankTransfer({Key? key}) : super(key: key);

  @override
  State<AddByBankTransfer> createState() => _AddByBankTransferState();
}

class _AddByBankTransferState extends State<AddByBankTransfer> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: backWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 12,
                      color: close,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    MyText(
                      'Add By Transfer',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),
              MyText(
                'Fund your CompactPay account by simply making a transfer from any bank. Just ensure you supply the details below: ',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: black2121,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                      child: MyText(
                        'Bank',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ),
                    InputField(
                      inputController: data.bankNameTextController,
                      isPassword: false,
                      hintText: 'CompactPay Digital Services Limited',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.name,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                      child: MyText(
                        'Account Number',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextFormField(
                      controller: data.accountNumberTextController,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                        fontFamily: 'Poppins',
                      ),
                      validator: validatePhoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffF6F6F6),
                        filled: true,
                        hintText: '2103109448',
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            width: 70,
                            height: 15,
                            decoration: BoxDecoration(
                              color: mainBlue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText(
                                  'Copy',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: black2121,
                                  fontFamily: 'Poppins',
                                ),
                                const SizedBox(
                                  width: 1,
                                ),
                                const Icon(
                                  Icons.content_copy_rounded,
                                  color: mainBlue,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                      child: MyText(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        'Account Name',
                      ),
                    ),
                    InputField(
                      inputController: data.accountNameTextController,
                      isPassword: false,
                      hintText: 'Tola S. Kelechi',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: MyButton(
                        height: 50,
                        width: double.infinity,
                        color: mainBlue,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            data.isLoading = true;
                            setState(() {});
                            data.delay(4);
                            try {
                              data.accountNameTextController.clear();
                              data.accountNumberTextController.clear();
                              data.bankNameTextController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddMoney()));
                            } catch (e, s) {
                              if (kDebugMode) {
                                print(e);
                              }
                              if (kDebugMode) {
                                print(s);
                              }
                            }
                          } else {
                            const ShowSnackBar(
                              text: "There is an error",
                              duration: 5,
                            );
                          }
                        },
                        child: data.isLoading == false
                            ? MyText(
                                'Share',
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
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
