/*
	LEFT OUTER JOIN
		main.ClientAddress claddrorigin
	ON
		claddrorigin.ClientId =
								  IIF
										(
										@LegInd = 0
									
										,(SELECT TOP (1) ClientId FROM main.ClientAddress WHERE (
																									UseForBillingInd = 1
																									AND
																									ClientId = 
																												(
																													SELECT TOP (1) ClientId FROM #CurrentPayPeriodLoadStop WHERE (LoadId = l.LoadId) AND (LoadStopTypeId = 1) AND (StopTypeNumber = 1)
																												)
																								)
										)
									
										,lsPick.ClientId
										) 
	And
		claddrorigin.AddressTypeId = 2
*/																																													
																																														
									
									



										

SELECT TOP (1) ClientId FROM main.ClientAddress WHERE (
															UseForBillingInd = 1
															AND
															ClientId = 
																		(
																			SELECT TOP (1) ClientId FROM 
																			Dispatch.Load l
																			asdf
																			WHERE (l.LoadId = 56888) AND (LoadStopTypeId = 1) AND (StopTypeNumber = 1)
																		)
														)
