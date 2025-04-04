import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatefulWidget {
  Map<String, dynamic> data;
  GridViewItem({super.key, required this.data});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: BoxDecoration(
        color: widget.data['backgroundColorContainer'],
        borderRadius: BorderRadius.circular(30),

        boxShadow: [
          BoxShadow(
            color: widget.data['backgroundColorContainer'],
            spreadRadius: 4,
          ),
          BoxShadow(color: Colors.white, spreadRadius: 2),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,

            child: Image.asset(widget.data['imageAsset'], height: 35),
          ),
          Spacer(),
          AutoSizeText(
            widget.data['title'],
            maxLines: 1,
            textAlign: TextAlign.center,
            maxFontSize: 20,
            style: TextStyle(
              color: !widget.data['isBlack'] ? Colors.white : Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.fade,
            ),
          ),
          AutoSizeText(
            '${widget.data['countDevices']} devices',
            minFontSize: 17,
            style: TextStyle(
              color: !widget.data['isBlack'] ? Colors.white : Colors.grey,
              fontSize: 20,
              overflow: TextOverflow.fade,
            ),
          ),
          Spacer(),
          Switch(
            value: isActive,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
            thumbColor: WidgetStatePropertyAll(Colors.white),
            trackColor: WidgetStatePropertyAll(widget.data['trackColor']),
            trackOutlineColor: WidgetStatePropertyAll(
              widget.data['trackColor'],
            ),
          ),
        ],
      ),
    );
  }
}
