import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/order.dart';

class OrderHistoryWidget extends StatefulWidget {
  final Order order;

  OrderHistoryWidget(this.order);

  @override
  _OrderHistoryWidgetState createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends State<OrderHistoryWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.totalPrice.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
                height: min(widget.order.items.length * 20.0 + 100, 180),
                child: ListView(
                  children: widget.order.items
                      .map((item) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${item.quantity}x ${item.title}'),
                                Text('${(item.price * item.quantity)} \$'),
                              ],
                            ),
                          ))
                      .toList(),
                )),
        ],
      ),
    );
  }
}
