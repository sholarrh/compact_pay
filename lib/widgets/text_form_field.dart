// Adigun solafunmi

import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final Widget? prefixIcon;
  final String hintText;
  final bool hasSuffixIcon;
  final TextEditingController inputController;
  final bool isPassword;
  final Function? validator;
  final Function? onSaved;
  final Function? onChanged;
  final TextInputType keyBoardType;
  final TextInputAction? textInputAction;
  final TextInputFormatter? inputFormatters;

  const InputField(
      {Key? key,
      required this.inputController,
      required this.isPassword,
      this.prefixIcon,
      required this.hintText,
      required this.hasSuffixIcon,
      this.validator,
      this.onSaved,
      this.onChanged,
      required this.keyBoardType,
      this.inputFormatters,
      this.textInputAction})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        validator: (value) => widget.validator!(value),
        controller: widget.inputController,
        onChanged: (value) => widget.onChanged!(value),
        keyboardType: widget.keyBoardType,
        autocorrect: true,
        textCapitalization: TextCapitalization.words,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onSaved: (value) => widget.onSaved!(value),
        style: const TextStyle(
            fontSize: 16,
            color: Color(0xff212121),
            fontWeight: FontWeight.w400),
        showCursor: true,
        decoration: InputDecoration(
          fillColor: white,
          prefixIcon: widget.prefixIcon,
          filled: true,
          focusColor: Colors.red,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(.75),
              fontSize: 10,
              fontWeight: FontWeight.bold),
          suffixIcon: widget.hasSuffixIcon == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: _obscureText
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                          size: 20,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          size: 20,
                        ),
                )
              : null,
          suffixIconColor: mainBlue,

          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.4), width: 0.7),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: mainBlue, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xFF333333), width: 0.7),
          //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
          // ),
        ),
        obscureText: _obscureText,
      ),
    );
  }
}

// input field 2
class InputField2 extends StatefulWidget {
  final Widget? prefixIcon;
  final String hintText;
  final bool hasSuffixIcon;
  final TextEditingController inputController;
  final Function? validator;
  final Function? onSaved;
  final TextInputType keyBoardType;
  final TextInputAction? textInputAction;

  const InputField2(
      {Key? key,
      required this.inputController,
      this.prefixIcon,
      required this.hintText,
      required this.hasSuffixIcon,
      this.validator,
      this.onSaved,
      required this.keyBoardType,
      this.textInputAction})
      : super(key: key);

  @override
  State<InputField2> createState() => _InputField2State();
}

class _InputField2State extends State<InputField2> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        validator: (value) => widget.validator!(value),
        controller: widget.inputController,
        onChanged: (value) {},
        keyboardType: widget.keyBoardType,
        autocorrect: true,
        textCapitalization: TextCapitalization.words,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onSaved: (value) => widget.onSaved!(value),
        style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(.90),
            fontWeight: FontWeight.w400),
        showCursor: true,
        obscureText: _obscureText,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          focusColor: Colors.red,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: editProfile.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.7), width: 0.7),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: mainBlue, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          suffixIcon: widget.hasSuffixIcon == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: _obscureText
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: white,
                          size: 20,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: white,
                          size: 20,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}

class InputField3 extends StatefulWidget {
  final Widget? prefixIcon;
  final String hintText;

  final TextEditingController inputController;

  final Function? validator;
  final Widget? suffixIcon;
  final Function? onSaved;
  final bool? readOnly;
  final Function? onTap;
  final TextInputType? keyBoardType;
  final TextInputAction? textInputAction;
  final InputBorder? border;

  const InputField3({
    Key? key,
    required this.inputController,
    this.prefixIcon,
    required this.hintText,
    this.validator,
    this.onSaved,
    this.keyBoardType,
    this.textInputAction,
    this.suffixIcon,
    this.onTap,
    this.readOnly,
    this.border,
  }) : super(key: key);

  @override
  State<InputField3> createState() => _InputField3();
}

class _InputField3 extends State<InputField3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextFormField(
        validator: (value) => widget.validator!(value),
        controller: widget.inputController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: widget.keyBoardType,
        autocorrect: false,
        textCapitalization: TextCapitalization.words,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onSaved: (value) => widget.onSaved!(value),
        style: const TextStyle(
            fontSize: 10,
            color: Color(0xff212121),
            fontWeight: FontWeight.w400),
        showCursor: true,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          focusColor: Colors.red,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(.75),
              fontSize: 10,
              fontWeight: FontWeight.w400),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white.withOpacity(.90), width: 0.7),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: mainBlue, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xFF333333), width: 0.7),
          //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
          // ),
        ),
      ),
    );
  }
}

class TvInputField extends StatefulWidget {
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController inputController;

  final Function? validator;
  final Function? onSaved;
  final TextInputType keyBoardType;
  final TextInputAction? textInputAction;

  const TvInputField(
      {Key? key,
      required this.inputController,
      this.prefixIcon,
      required this.hintText,
      this.suffixIcon,
      this.validator,
      this.onSaved,
      required this.keyBoardType,
      this.textInputAction})
      : super(key: key);

  @override
  State<TvInputField> createState() => _TvInputFieldState();
}

class _TvInputFieldState extends State<TvInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextFormField(
        validator: (value) => widget.validator!(value),
        controller: widget.inputController,
        onChanged: (value) {},
        keyboardType: widget.keyBoardType,
        autocorrect: true,
        textCapitalization: TextCapitalization.words,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onSaved: (value) => widget.onSaved!(value),
        style: const TextStyle(
            fontSize: 16, color: black2121, fontWeight: FontWeight.w500),
        showCursor: true,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          focusColor: Colors.red,
          hintText: widget.hintText,
          filled: true,
          fillColor: const Color(0xffF6F6F6),
          hintStyle: TextStyle(
              color: black2121.withOpacity(0.4),
              fontSize: 10,
              fontWeight: FontWeight.w400),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.4), width: 0.7),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: mainBlue, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xFF333333), width: 0.7),
          //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
          // ),
        ),
      ),
    );
  }
}

// class BankTransferInputField extends StatefulWidget {
//   final Widget? prefixIcon;
//   final String hintText;
//   final Widget? suffixIcon;
//   final TextEditingController inputController;
//
//   final Function? validator;
//   final Function? onSaved;
//   final TextInputType keyBoardType;
//   final TextInputAction? textInputAction;
//
//   const BankTransferInputField(
//       {Key? key,
//         required this.inputController,
//         this.prefixIcon,
//         required this.hintText,
//         this.suffixIcon,
//         this.validator,
//         this.onSaved,
//         required this.keyBoardType,
//         this.textInputAction})
//       : super(key: key);
//
//   @override
//   State<BankTransferInputField> createState() => _BankTransferInputFieldState();
// }
//
// class _BankTransferInputFieldState extends State<BankTransferInputField> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 54,
//       child: TextFormField(
//         validator: (value) => widget.validator!(value),
//         controller: widget.inputController,
//         onChanged: (value) {},
//         keyboardType: widget.keyBoardType,
//         autocorrect: true,
//         textCapitalization: TextCapitalization.words,
//         textInputAction: widget.textInputAction ?? TextInputAction.next,
//         onSaved: (value) => widget.onSaved!(value),
//         style: const TextStyle(
//             fontSize: 16, color: black2121, fontWeight: FontWeight.w500),
//         showCursor: true,
//         decoration: InputDecoration(
//           prefixIcon: widget.prefixIcon,
//           suffixIcon: widget.suffixIcon,
//           focusColor: Colors.red,
//           hintText: widget.hintText,
//           filled: true,
//           fillColor: const Color(0xffF6F6F6),
//           hintStyle: TextStyle(
//               color: black2121.withOpacity(0.4),
//               fontSize: 10,
//               fontWeight: FontWeight.w400),
//           contentPadding:
//           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//           enabledBorder: OutlineInputBorder(
//             borderSide:
//             BorderSide(color: Colors.grey.withOpacity(0.4), width: 0.7),
//             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: mainBlue, width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           ),
//           errorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red, width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           ),
//           // enabledBorder: const OutlineInputBorder(
//           //   borderSide: BorderSide(color: Color(0xFF333333), width: 0.7),
//           //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
//           // ),
//         ),
//       ),
//     );
//   }
// }
//
// class InputField3 extends StatefulWidget {
//   final Widget? prefixIcon;
//   final String hintText;
//
//   final TextEditingController inputController;
//
//   final Function? validator;
//   final Widget? suffixIcon;
//   final Function? onSaved;
//   final bool? readOnly;
//   final Function? onTap;
//   final TextInputType? keyBoardType;
//   final TextInputAction? textInputAction;
//
//   const InputField3({
//     Key? key,
//     required this.inputController,
//     this.prefixIcon,
//     required this.hintText,
//     this.validator,
//     this.onSaved,
//     this.keyBoardType,
//     this.textInputAction,
//     this.suffixIcon,
//     this.onTap,
//     this.readOnly,
//   }) : super(key: key);
//
//   @override
//   State<InputField3> createState() => _InputField3();
// }
//
// class _InputField3 extends State<InputField3> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 63,
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//             offset: const Offset(12, 26),
//             blurRadius: 50,
//             spreadRadius: 0,
//             color: Colors.grey.withOpacity(.1)),
//       ]),
//       child: TextFormField(
//         validator: (value) => widget.validator!(value),
//         controller: widget.inputController,
//         onChanged: (value) {
//           //Do something wi
//         },
//         keyboardType: widget.keyBoardType,
//         autocorrect: false,
//         textCapitalization: TextCapitalization.words,
//         textInputAction: widget.textInputAction ?? TextInputAction.next,
//         onSaved: (value) => widget.onSaved!(value),
//         style: TextStyle(
//             fontSize: 10,
//             color: Color(0xff212121),
//             fontWeight: FontWeight.w400),
//         showCursor: true,
//         decoration: InputDecoration(
//           prefixIcon: widget.prefixIcon,
//           suffixIcon: widget.suffixIcon,
//           focusColor: Colors.red,
//           hintText: widget.hintText,
//           hintStyle: TextStyle(
//               color: Colors.grey.withOpacity(.75),
//               fontSize: 10,
//               fontWeight: FontWeight.w400),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//           enabledBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: Colors.white.withOpacity(.90), width: 0.7),
//             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: mainBlue, width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           ),
//           errorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red, width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           ),
//           // enabledBorder: const OutlineInputBorder(
//           //   borderSide: BorderSide(color: Color(0xFF333333), width: 0.7),
//           //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
//           // ),
//         ),
//       ),
//     );
//   }
// }
