import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:moyasar/moyasar.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({super.key});

  final paymentConfig = PaymentConfig(
    publishableApiKey: 'pk_test_TqLbBtD7LxnHaPc8Dm3djzsoxRkcCPDdHASswyuo',
    amount: 25758, // SAR 257.58
    description: 'order #1324',
    metadata: {'size': '250g'},
    creditCard: CreditCardConfig(saveCard: true, manual: false),
    applePay: ApplePayConfig(
        merchantId: 'YOUR_MERCHANT_ID',
        label: 'YOUR_STORE_NAME',
        
        manual: false),
  );

  void onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          // handle success.
          break;
        case PaymentStatus.failed:
          // handle failure.
          break;
        case PaymentStatus.initiated:
        // TODO: Handle this case.
        case PaymentStatus.authorized:
        // TODO: Handle this case.
        case PaymentStatus.captured:
        // TODO: Handle this case.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ApplePay(
              config: paymentConfig,
              onPaymentResult: onPaymentResult,
            ),
            const Text("or"),
            CreditCard(
              config: paymentConfig,
              locale: context.locale.toString() == "ar"
                  ? const Localization.ar()
                  : const Localization.en(),
              onPaymentResult: onPaymentResult,
            )
          ],
        ),
      ),
    );
  }
}
