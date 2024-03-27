DELETE FROM [export].[AccountingExportPayrollItem];
GO

--REDBONE COMPANY
	--LOADS
		--EARNINGS
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Doubles (Albertsons)', NULL, 76, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Drop & Hook (Doubles)', 'Drop & Hook', NULL, 2, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'OTR Drop Solo', 'Extra Stops', NULL, 3, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Redbone - OTR)', NULL, NULL, 4, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainee)', NULL, NULL, 5, 0);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainer)', NULL, NULL, 6, 0);

		--OTHER
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Per Diem', NULL, NULL, 1, 1);
	--DRIVERPAY
		--OTHER
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBADVANCE', 'ADVANCE', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBADVANCEFEE', 'ADVANCE FEE', NULL, 1, 1);

		/*
			ADVANCE
			ADVANCE FEE
			Clean Inspection
			DETENTION
			LAYOVER
			Orientation Bonus
			REIMBURSE
		*/

GO
