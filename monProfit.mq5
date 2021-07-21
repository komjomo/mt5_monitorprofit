//+------------------------------------------------------------------+
//|                                                    monProfit.mq5 |
//|                                          Copyright 2021, Komjomo |
//|                                          https://www.komjomo.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Komjomo"
#property link      "https://www.komjomo.com"
#property version   "1.00"


input double percent_stopout = 8;   // stopout percent

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
   printf("Balance : %.2f / Profit : %.2f", equity, profit);

   double percent_cal = profit * 100 / baln * -1;        // calculate percent of loss

   if( percent_cal > percent_stopout) {
      Print("Stopout action!!!");
   }



}
//+------------------------------------------------------------------+
