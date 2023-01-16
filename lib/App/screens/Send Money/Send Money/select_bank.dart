import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/provider/provider.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widgets/my_text.dart';
import 'bank_account.dart';

class SelectBank2 extends StatefulWidget {
  const SelectBank2({Key? key}) : super(key: key);

  @override
  State<SelectBank2> createState() => _SelectBank2State();
}

class _SelectBank2State extends State<SelectBank2> {
  void updateList(String value) {
    setState(() {
      displayList = nigerianBanks
          .where((element) =>
          element['name']!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  List<Map<String, String>> displayList = List.from(nigerianBanks);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: backWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
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
                    'Select Bank',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: black2121,
                  ),
                ],
              ),
            ),
            TextFormField(
              onChanged: (value) => updateList(value),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search Bank Name',
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffBDBDBD),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: mainBlue,
                ),
                prefixIconColor: mainBlue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                itemCount: displayList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 1.0, vertical: 12.0),
                  child: ListTile(
                    onTap: () {
                      data.bankName = displayList[index]['name'];
                      data.bankLogo = displayList[index]['logo'];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BankAccount()));
                    },
                    dense: true,
                    tileColor: white,
                    enabled: true,
                    leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                        NetworkImage(displayList[index]['logo']!)),
                    title: MyText(
                      displayList[index]['name']!,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: black2121,
                      fontFamily: 'Poppins',
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}



//Static List<BankModel> naijaBanksList =

List<Map<String, String>> get nigerianBanks => _nigerianBanks;
List<Map<String, String>> _nigerianBanks = [
  {
    "name": "Access Bank",
    "slug": "access-bank",
    "code": "044",
    "ussd": "*901#",
    "logo": "https://nigerianbanks.xyz/logo/access-bank.png"
  },
  {
    "name": "Access Bank (Diamond)",
    "slug": "access-bank-diamond",
    "code": "063",
    "ussd": "*426#",
    "logo": "https://nigerianbanks.xyz/logo/access-bank-diamond.png"
  },
  {
    "name": "ALAT by WEMA",
    "slug": "alat-by-wema",
    "code": "035A",
    "ussd": "*945*100#",
    "logo": "https://nigerianbanks.xyz/logo/alat-by-wema.png"
  },
  {
    "name": "ASO Savings and Loans",
    "slug": "asosavings",
    "code": "401",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/asosavings.png"
  },
  {
    "name": "Bowen Microfinance Bank",
    "slug": "bowen-microfinance-bank",
    "code": "50931",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "CEMCS Microfinance Bank",
    "slug": "cemcs-microfinance-bank",
    "code": "50823",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Citibank Nigeria",
    "slug": "citibank-nigeria",
    "code": "023",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/citibank-nigeria.png"
  },
  {
    "name": "Ecobank Nigeria",
    "slug": "ecobank-nigeria",
    "code": "050",
    "ussd": "*326#",
    "logo": "https://nigerianbanks.xyz/logo/ecobank-nigeria.png"
  },
  {
    "name": "Ekondo Microfinance Bank",
    "slug": "ekondo-microfinance-bank",
    "code": "562",
    "ussd": "*540*178#",
    "logo": "https://nigerianbanks.xyz/logo/ekondo-microfinance-bank.png"
  },
  {
    "name": "Fidelity Bank",
    "slug": "fidelity-bank",
    "code": "070",
    "ussd": "*770#",
    "logo": "https://nigerianbanks.xyz/logo/fidelity-bank.png"
  },
  {
    "name": "First Bank of Nigeria",
    "slug": "first-bank-of-nigeria",
    "code": "011",
    "ussd": "*894#",
    "logo": "https://nigerianbanks.xyz/logo/first-bank-of-nigeria.png"
  },
  {
    "name": "First City Monument Bank",
    "slug": "first-city-monument-bank",
    "code": "214",
    "ussd": "*329#",
    "logo": "https://nigerianbanks.xyz/logo/first-city-monument-bank.png"
  },
  {
    "name": "Globus Bank",
    "slug": "globus-bank",
    "code": "00103",
    "ussd": "*989#",
    "logo": "https://nigerianbanks.xyz/logo/globus-bank.png"
  },
  {
    "name": "Guaranty Trust Bank",
    "slug": "guaranty-trust-bank",
    "code": "058",
    "ussd": "*737#",
    "logo": "https://nigerianbanks.xyz/logo/guaranty-trust-bank.png"
  },
  {
    "name": "Hasal Microfinance Bank",
    "slug": "hasal-microfinance-bank",
    "code": "50383",
    "ussd": "*322*127#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Heritage Bank",
    "slug": "heritage-bank",
    "code": "030",
    "ussd": "*322#",
    "logo": "https://nigerianbanks.xyz/logo/heritage-bank.png"
  },
  {
    "name": "Jaiz Bank",
    "slug": "jaiz-bank",
    "code": "301",
    "ussd": "*389*301#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Keystone Bank",
    "slug": "keystone-bank",
    "code": "082",
    "ussd": "*7111#",
    "logo": "https://nigerianbanks.xyz/logo/keystone-bank.png"
  },
  {
    "name": "Kuda Bank",
    "slug": "kuda-bank",
    "code": "50211",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/kuda-bank.png"
  },
  {
    "name": "One Finance",
    "slug": "one-finance",
    "code": "565",
    "ussd": "*1303#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Paga",
    "slug": "paga",
    "code": "327",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/paga.png"
  },
  {
    "name": "Parallex Bank",
    "slug": "parallex-bank",
    "code": "526",
    "ussd": "*322*318*0#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "PayCom",
    "slug": "paycom",
    "code": "100004",
    "ussd": "*955#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Polaris Bank",
    "slug": "polaris-bank",
    "code": "076",
    "ussd": "*833#",
    "logo": "https://nigerianbanks.xyz/logo/polaris-bank.png"
  },
  {
    "name": "Providus Bank",
    "slug": "providus-bank",
    "code": "101",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Rubies MFB",
    "slug": "rubies-mfb",
    "code": "125",
    "ussd": "*7797#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Sparkle Microfinance Bank",
    "slug": "sparkle-microfinance-bank",
    "code": "51310",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/sparkle-microfinance-bank.png"
  },
  {
    "name": "Stanbic IBTC Bank",
    "slug": "stanbic-ibtc-bank",
    "code": "221",
    "ussd": "*909#",
    "logo": "https://nigerianbanks.xyz/logo/stanbic-ibtc-bank.png"
  },
  {
    "name": "Standard Chartered Bank",
    "slug": "standard-chartered-bank",
    "code": "068",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/standard-chartered-bank.png"
  },
  {
    "name": "Sterling Bank",
    "slug": "sterling-bank",
    "code": "232",
    "ussd": "*822#",
    "logo": "https://nigerianbanks.xyz/logo/sterling-bank.png"
  },
  {
    "name": "Suntrust Bank",
    "slug": "suntrust-bank",
    "code": "100",
    "ussd": "*5230#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "TAJ Bank",
    "slug": "taj-bank",
    "code": "302",
    "ussd": "*898#",
    "logo": "https://nigerianbanks.xyz/logo/taj-bank.png"
  },
  {
    "name": "TCF MFB",
    "slug": "tcf-mfb",
    "code": "51211",
    "ussd": "*908#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Titan Trust Bank",
    "slug": "titan-trust-bank",
    "code": "102",
    "ussd": "*922#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Union Bank of Nigeria",
    "slug": "union-bank-of-nigeria",
    "code": "032",
    "ussd": "*826#",
    "logo": "https://nigerianbanks.xyz/logo/union-bank-of-nigeria.png"
  },
  {
    "name": "United Bank For Africa",
    "slug": "united-bank-for-africa",
    "code": "033",
    "ussd": "*919#",
    "logo": "https://nigerianbanks.xyz/logo/united-bank-for-africa.png"
  },
  {
    "name": "Unity Bank",
    "slug": "unity-bank",
    "code": "215",
    "ussd": "*7799#",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "VFD",
    "slug": "vfd",
    "code": "566",
    "ussd": "",
    "logo": "https://nigerianbanks.xyz/logo/default-image.png"
  },
  {
    "name": "Wema Bank",
    "slug": "wema-bank",
    "code": "035",
    "ussd": "*945#",
    "logo": "https://nigerianbanks.xyz/logo/wema-bank.png"
  },
  {
    "name": "Zenith Bank",
    "slug": "zenith-bank",
    "code": "057",
    "ussd": "*966#",
    "logo": "https://nigerianbanks.xyz/logo/zenith-bank.png"
  }
];