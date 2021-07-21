//+------------------------------------------------------------------+
//|                                                    monProfit.mq5 |
//|                                          Copyright 2021, Komjomo |
//|                                          https://www.komjomo.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Komjomo"
#property link      "https://www.komjomo.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   double profit = AccountInfoDouble(ACCOUNT_PROFIT);
   printf("Balance : %.2f / Profit : %.2f", equity, profit);
   
   
   
  }
//+------------------------------------------------------------------+
