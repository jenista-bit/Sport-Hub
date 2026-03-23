import 'package:flutter/material.dart';
import 'package:future_hub/core/constants/app_color.dart';
import 'package:future_hub/core/widgets/app_bar.dart';
import 'package:future_hub/core/widgets/app_button.dart';
import 'package:future_hub/core/widgets/app_text.dart';
import 'package:future_hub/route/app_route.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class VerifyPhonePage extends StatelessWidget {
  const VerifyPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReserveHub(
        title: "Verify Phone",
        showBackButton: false,
        foregroundColor: AppColors.black,
        centerTitle: false,
      ),
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Column(
          children: [
            /// TOP BAR
            const SizedBox(height: 30),

            /// ICON
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xffE4ECF7),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.verified,
                size: 40,
                color: Color(0xff2A7DE1),
              ),
            ),

            const SizedBox(height: 24),

            /// TITLE
            const AppText(
              "Enter Verification Code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),

            const SizedBox(height: 10),

            /// DESCRIPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "We've sent a 6-digit code to your registered phone number +1 ••• ••• 4582",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),

            const SizedBox(height: 30),

            /// OTP BOX
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  width: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      const Text("•", style: TextStyle(fontSize: 24)),
                      const SizedBox(height: 8),
                      Container(height: 2, color: Colors.grey.shade300),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// TIMER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "00:45",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),
                const Text("remaining", style: TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 10),

            /// RESEND
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 6),
                Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Color(0xff2A7DE1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppButton(
                label: 'Verify & Proceed',
                backgroundColor: AppColors.accent,
                textColor: AppColors.textPrimary,
                onPressed: () {
                  Get.toNamed(AppRoutes.createAccountStep1Page);
                },
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "RESERVE HUB SPORTS",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    List<String> numbers = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "",
      "0",
      "⌫",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 60),
      itemCount: numbers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (_, index) {
        return Center(
          child: Text(
            numbers[index],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}
