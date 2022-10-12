import 'package:flutter/material.dart';

class ViewTask extends StatefulWidget {
  Map<String, dynamic>? task;
  ViewTask({Key? key, this.task}) : super(key: key);

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 48, left: 16, right: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_rounded, size: 40,)
            ),
            SizedBox(height: 12,),
            Text(
              widget.task!['task'],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Priority : ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  ),
                ),
                Text(
                  int.parse(widget.task!['priority']) == 0
                      ? "Low !"
                      : int.parse(widget.task!['priority']) == 1
                          ? "Medium !!"
                          : "High !!!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: int.parse(widget.task!['priority']) == 0
                        ? Colors.green
                        : int.parse(widget.task!['priority']) == 1
                            ? Colors.yellow[800]
                            : Colors.redAccent
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Set Date : ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  ),
                ),
                Text(
                  DateTime.parse(widget.task!['setDate'].toString()).day.toString() + "-"
                  + DateTime.parse(widget.task!['setDate'].toString()).month.toString() + "-"
                  + DateTime.parse(widget.task!['setDate'].toString()).year.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "To Be Completed By : ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  ),
                ),
                Text(
                  DateTime.parse(widget.task!['toBeCompletedOn'].toString()).day.toString() + "-"
                  + DateTime.parse(widget.task!['toBeCompletedOn'].toString()).month.toString() + "-"
                  + DateTime.parse(widget.task!['toBeCompletedOn'].toString()).year.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Completed? : ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  ),
                ),
                Text(
                  int.parse(widget.task!['completed'].toString()) == 0 ? "No" : "Yes",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]
              ),
            ),
            Text(
              widget.task!['description'].toString().length == 0 ? "No Description..." : widget.task!['description'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}