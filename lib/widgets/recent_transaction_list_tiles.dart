import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;

import '../models/transaction.dart';
import '../providers/transactions_provider.dart';


// ignore: must_be_immutable
class RecentTransactionListTiles extends StatelessWidget {
  bool isTodayTransaction;

  RecentTransactionListTiles({Key? key, required this.isTodayTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactionsList = isTodayTransaction
        ? Provider.of<TransactionsProvider>(context, listen: false)
            .todaysTransaction
        : Provider.of<TransactionsProvider>(context, listen: false)
            .yesterdaysTransaction;

    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactionsList.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              height: 70,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        color: custom_colors.lightGrayBackground,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(
                        transactionsList[index].logoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionsList[index].category,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: custom_colors.primary,
                            fontSize: 16),
                      ),
                      Text(
                        transactionsList[index].details,
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        transactionsList[index].amount,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: transactionsList[index].isExpense
                                ? custom_colors.primary
                                : custom_colors.greenAccent),
                      ),
                      Text(
                        transactionsList[index].date,
                        style: const TextStyle(color: Colors.black38, fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),
            index != transactionsList.length - 1
                ? Divider(
                    thickness: 1,
                    color: Colors.black.withOpacity(0.05),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
