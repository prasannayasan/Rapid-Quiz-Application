package com.yasan.rapidquiz.service;
import java.util.Scanner;
public class Solution {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int i = 0, sumEven = 0, sumOdd = 0;
        while(n>0) {
            i = n%10;
            if(i%2==0) {
                sumEven = sumEven + i;
            } else {
                sumOdd = sumOdd + i;
            }
        }
        System.out.println(sumEven + " " + sumOdd);
    }
}
