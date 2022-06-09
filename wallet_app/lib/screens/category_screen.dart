
import 'package:flutter/material.dart';
import 'package:wallet_app/models/color_status.dart';
import 'package:wallet_app/widgets/circular_chart.dart';

import '../models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {

    double total = 0;
    for(var element in widget.category.incomes){
      total += element.price;
    }
    final double leftPrice = widget.category.maxPrice - total;
    final double percent = leftPrice / widget.category.maxPrice;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(widget.category.name),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add, size: 30,))
        ],
      ),
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[800],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900,
                    offset: const Offset(0, 2),
                    blurRadius: 7
                  )
                ]
              ),
              child: CustomPaint(
                foregroundPainter: CircularChar(Colors.grey.shade700, getStatusColor(context, percent), percent, 16) ,
                child: Center(
                  child: Text(
                     '\$${leftPrice.toStringAsFixed(2)} / \$${widget.category.maxPrice}',
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600,fontSize: 20),  
                  ),
                ),
              ),
               
            )
          ],
        ),
      ),
    );
  }
}
