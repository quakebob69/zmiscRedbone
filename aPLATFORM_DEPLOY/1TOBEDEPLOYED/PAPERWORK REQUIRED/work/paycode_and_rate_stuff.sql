/*

SELECT distinct [Quantity]
        FROM [RedBone].[dispatch].[PR_OTR_History]

  where PayPeriodEnding = '2021-04-10 00:00:00.000'
  order by Quantity
  ;

  */


  /*
  
  SELECT * FROM [RedBone].[dispatch].[PR_OTR_History]
  order by PayPeriodEnding desc
  ;


  */


SELECT TOP (1000) 
[PayCode], [PickOrigin], DropDest, name, Quantity, PayRateAmount, '--------------' as '--------------' , *
  FROM [RedBone].[dispatch].[PR_OTR_History] p

  where PayPeriodEnding = '2023-12-16 00:00:00.000'
  and PayRateAmount is not null
  order by p.paycode, p.PayRateAmount
  ;

