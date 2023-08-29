public class ListNode {
        int val;
         ListNode next;
         ListNode() {}
         ListNode(int val) { this.val = val; }
         ListNode(int val, ListNode next) { this.val = val; this.next = next; }
     }
class Solution {
    public static void main(String[] agrs) {
        
        ListNode l1 = new ListNode();
        ListNode l2 = new ListNode();
        ListNode l3 = new ListNode();
        ListNode l4 = new ListNode();
        ListNode l5 = new ListNode();
        ListNode l6 = new ListNode();
        ListNode l7 = new ListNode();
        ListNode l8 = new ListNode();
        l1 = l3;
        l2 = l4;
        l3.next = l5;
        l4.next = l6;
        l5.next = l7;
        l6.next = l8;
        l3.val = 2;
        l4.val = 3;
        l5.val = 4;
        l6.val = 5;
        l7.val = 6;
        l8.val = 7;
        addTwoNumbers(l1,l2);
    }
    public static void addTwoNumbers(ListNode l1, ListNode l2) {
        int a = revers(l1,0);
        int b = revers(l2,0);
        int c = a+b;
        System.out.println(c);
        ListNode temp = new ListNode();
        temp = null;
        ListNode head = new ListNode();
        head = null;
        while(c!=0){
            ListNode per = new ListNode();
            per.val = c%10;
            c = c/10;
            if(temp == null){
                temp = per;
                head = per;
            }
            else{
                head.next = per;
                head = head.next;
            }
        }
        
    }
    public static int revers(ListNode n ,int a){
        if(n.next == null){
            return 0;
        }
        else{
            revers(n.next,a);
            a = a*10+n.val;
        }
        return a;
    }
}