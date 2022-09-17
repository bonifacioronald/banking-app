import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../models/colors.dart' as custom_colors;
import '../providers/transactions_provider.dart';
import '../widgets/main_menu_action_buttons.dart';
import '../widgets/recent_transaction_category_buttons.dart';
import '../widgets/recent_transaction_list_tiles.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      bottomNavigationBar: Container(
        color: custom_colors.lightGrayBackground,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GNav(
            padding: EdgeInsets.zero,
            backgroundColor: custom_colors.lightGrayBackground,
            tabs: [
              GButton(
                icon: Icons.home,
                iconColor: custom_colors.primary.withOpacity(0.3),
                iconActiveColor: custom_colors.primary,
                gap: 8,
                iconSize: 30,
                text: 'Home',
                textStyle: TextStyle(
                    fontSize: 16,
                    color: custom_colors.primary,
                    fontWeight: FontWeight.bold),
              ),
              GButton(
                icon: Icons.history,
                iconColor: custom_colors.primary.withOpacity(0.3),
                iconActiveColor: custom_colors.primary,
                gap: 8,
                iconSize: 30,
                text: 'History',
                textStyle: TextStyle(
                    fontSize: 16,
                    color: custom_colors.primary,
                    fontWeight: FontWeight.bold),
              ),
              GButton(
                icon: Icons.credit_card_rounded,
                iconColor: custom_colors.primary.withOpacity(0.3),
                iconActiveColor: custom_colors.primary,
                gap: 8,
                iconSize: 30,
                text: 'Cards',
                textStyle: TextStyle(
                    fontSize: 16,
                    color: custom_colors.primary,
                    fontWeight: FontWeight.bold),
              ),
              GButton(
                icon: Icons.person_outline,
                iconColor: custom_colors.primary.withOpacity(0.3),
                iconActiveColor: custom_colors.primary,
                gap: 8,
                iconSize: 30,
                text: 'Profile',
                textStyle: TextStyle(
                    fontSize: 16,
                    color: custom_colors.primary,
                    fontWeight: FontWeight.bold),
              ),
            ]),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: custom_colors.blueBackground,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 24.0, right: 24, top: statusBarHeight + 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        '\$2,589.50',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.notifications_active,
                        color: Colors.white54,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                'assets/images/profile_picture.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    'Available Balance',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainMenuActionButtons(
                          'Send', 'assets/images/send_money_icon.png'),
                      MainMenuActionButtons(
                          'Request', 'assets/images/request_money_icon.png'),
                      MainMenuActionButtons(
                          'Loan', 'assets/images/loan_money_icon.png'),
                      MainMenuActionButtons(
                          'Topup', 'assets/images/topup_money_icon.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: custom_colors.blueBackground,
                  ),
                  Container(
                    clipBehavior: Clip.none,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: custom_colors.lightGrayBackground,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 24, left: 24, right: 24),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Transactions',
                                  style: TextStyle(
                                      color: custom_colors.primary,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                      color: custom_colors.blueBackground,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                RecentTransactionCategoryButtons(
                                  'All',
                                  Icons.ac_unit,
                                  Colors.transparent,
                                  true,
                                ),
                                RecentTransactionCategoryButtons(
                                    'Income',
                                    Icons.add_circle_rounded,
                                    custom_colors.greenAccent,
                                    false),
                                RecentTransactionCategoryButtons(
                                    'Expense',
                                    Icons.outbound_rounded,
                                    custom_colors.redAccent,
                                    false),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              'TODAY',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                color: Colors.white,
                                height:
                                    Provider.of<TransactionsProvider>(context)
                                            .todaysTransaction
                                            .length *
                                        86,
                                child: Container(
                                  child: RecentTransactionListTiles(
                                    isTodayTransaction: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              'YESTERDAY',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                color: Colors.white,
                                height:
                                    Provider.of<TransactionsProvider>(context)
                                            .yesterdaysTransaction
                                            .length *
                                        86,
                                child: Container(
                                  child: RecentTransactionListTiles(
                                    isTodayTransaction: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
