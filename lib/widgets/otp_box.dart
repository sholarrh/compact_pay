// Adigun solafunmi

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';

class OtpBox extends StatefulWidget {
  final bool? obscureText;
  final Function? onSaved;
  final Function? onChanged;
  final Function? function;

   const OtpBox({
     Key? key,
    this.obscureText,
    this.onSaved,
    this.onChanged,
    this.function
   })
       : super(key: key);



  @override
  State<OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<OtpBox> {

  final bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Form(
      child: SizedBox(
        height: 54,
        width: 54,
        child: TextFormField(
          onSaved: (value) => widget.onSaved!(value),
          obscureText: _obscureText,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
           data.otpCodeList.add(value);
          },
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            fillColor: cardColor,
            filled: true,
            focusColor: Colors.red,
            contentPadding:
          EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainBlue, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          ),
          ),
        ),
    );
  }
}


class OtpBox1 extends StatefulWidget {
  final bool? obscureText;
  final Function? onSaved;
  final Function? onChanged;
  final Function? function;

  const OtpBox1({
    Key? key,
    this.obscureText,
    this.onSaved,
    this.onChanged,
    this.function
  })
      : super(key: key);



  @override
  State<OtpBox1> createState() => _OtpBox1State();
}

class _OtpBox1State extends State<OtpBox1> {

  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Form(
      child: SizedBox(
        height: 54,
        width: 54,
        child: TextFormField(
          onSaved: (value) => widget.onSaved!(value),
          obscureText: _obscureText,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            data.pinList.add(value);
          },
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            fillColor: cardColor,
            filled: true,
            focusColor: Colors.red,
            contentPadding:
            EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainBlue, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpBox2 extends StatefulWidget {
  final bool? obscureText;
  final Function? onSaved;
  final Function? onChanged;
  final Function? function;

  const OtpBox2({
    Key? key,
    this.obscureText,
    this.onSaved,
    this.onChanged,
    this.function
  })
      : super(key: key);



  @override
  State<OtpBox2> createState() => _OtpBox2State();
}

class _OtpBox2State extends State<OtpBox2> {

  final bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Form(
      child: SizedBox(
        height: 54,
        width: 54,
        child: TextFormField(
          onSaved: (value) => widget.onSaved!(value),
          obscureText: _obscureText,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            data.confirmPinList.add(value);
          },
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            fillColor: cardColor,
            filled: true,
            focusColor: Colors.red,
            contentPadding:
            EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainBlue, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
      ),
    );
  }
}