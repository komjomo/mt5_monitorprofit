//+------------------------------------------------------------------+
//|                                                    monProfit.mq5 |
//|                                          Copyright 2021, Komjomo |
//|                                          https://www.komjomo.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Komjomo"
#property link      "https://www.komjomo.com"
#property version   "1.00"

#include <Trade/Trade.mqh>
#include <JPOSClass.mqh>

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

      JPOSClass pos;
      pos.closeAllPosSymbol(Symbol());
      Print("Close All Position(s).");

   }





}
//+------------------------------------------------------------------+
