import 'package:ia2022/listnode.dart';

class HariLinkedList {
  late ListNode? front;

  HariLinkedList() {
    front = null;
  }

  void addString(String data, String data2) {
    if (front == null) {
      front = ListNode(data, data2);
    }
    else {
      ListNode? current = front;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = ListNode(data, data2);
    }
  }

  void remove() {
    if (front != null) {
      front = front?.next;
    }
  }
  
}



