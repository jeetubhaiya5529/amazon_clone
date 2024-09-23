import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the Day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
            'https://images.unsplash.com/photo-1726853522009-8dc4c4e306a3?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            height: 235,
            fit: BoxFit.fitHeight,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15),
            child: const Text(
              '\$100',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              'Amazon',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    'https://images.unsplash.com/photo-1726715245558-69afa5ded798?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', fit: BoxFit.fitWidth, width: 100, height: 100,),
                Image.network(
                    'https://images.unsplash.com/photo-1726715245558-69afa5ded798?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', fit: BoxFit.fitWidth, width: 100, height: 100,),
                Image.network(
                    'https://images.unsplash.com/photo-1726715245558-69afa5ded798?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', fit: BoxFit.fitWidth, width: 100, height: 100,),
                Image.network(
                    'https://images.unsplash.com/photo-1726715245558-69afa5ded798?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', fit: BoxFit.fitWidth, width: 100, height: 100,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text('See all deals', style: TextStyle(color: Colors.cyan[800]),),
          )
        ],
      ),
    );
  }
}
