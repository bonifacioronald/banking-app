import 'package:banking_app/models/transaction.dart';
import 'package:banking_app/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;

class RecentTransactionListTiles extends StatelessWidget {
  const RecentTransactionListTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactionsList =
        Provider.of<TransactionsProvider>(context, listen: false)
            .recentTransactionList;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: transactionsList.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                  SizedBox(
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
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        transactionsList[index].amount,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: transactionsList[index].isExpense
                                ? custom_colors.primary
                                : custom_colors.greenAccent),
                      ),
                      Text(
                        transactionsList[index].date,
                        style: TextStyle(color: Colors.black38, fontSize: 14),
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
