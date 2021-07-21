//+------------------------------------------------------------------+
//|                                                    monProfit.mq5 |
//|                                          Copyright 2021, Komjomo |
//|                                          https://www.komjomo.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Komjomo"
#property link      "https://www.komjomo.com"
#property version   "1.00"

#include <Trade/Trade.mqh>
#include <Trade/PositionInfo.mqh>

input double percent_stopout = 8;   // stopout percent
input bool en_stopout = false;      // Enable stopout control

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() {
//---

//---
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {
//---

}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() {
//---



   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   double baln = AccountInfoDouble(ACCOUNT_BALANCE);
   double profit = AccountInfoDouble(ACCOUNT_PROFIT);


   double percent_cal = profit * 100 / baln * -1;        // calculate percent of loss

   printf("Balance : %.2f / Profit : %.2f = %.2f%%", equity, profit, percent_cal);

   if( percent_cal > percent_stopout && en_stopout == true) {
      Print("Stopout action!!!");
      CPositionInfo pos;
      CTrade trd;
      int pos_id[100];
      
      
      for(int i = 0; i < 100; i++) {      // init value
         pos_id[i] = 0;
      }

      ///////////// get id of position to array
      for(int i = 0; i < PositionsTotal(); i++) {


         if(pos.SelectByIndex(i)) {
            pos_id[i] = pos.Identifier();
         }
      }


      ///////// close run, close all pos in array
      for(int i = 0; i < 100; i++) {
         if(pos_id[i] != 0) {
            trd.PositionClose(pos_id[i]);
            Print("closed position id : " + pos_id[i]);
         }
      }


   }





}
//+------------------------------------------------------------------+
