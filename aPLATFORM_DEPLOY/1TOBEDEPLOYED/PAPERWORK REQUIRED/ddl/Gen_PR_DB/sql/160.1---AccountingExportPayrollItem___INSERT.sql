DELETE FROM [export].[AccountingExportPayrollItem];
GO

--REDBONE COMPANY
	--LOADS
		--EARNINGS
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Doubles (Albertsons)', NULL, 76, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Drop & Hook (Doubles)', 'Drop & Hook', NULL, 2, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'OTR Drop Solo', 'Extra Stops', NULL, 3, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Redbone - OTR)', 'Per Diem', NULL, 4, 1);
			--INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainee)', NULL, NULL, 5, 0);
			--INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainer)', NULL, NULL, 6, 0);

		--OTHER
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Per Diem', 'Per Diem', NULL, 1, 1);
	--DRIVERPAY
		--OTHER
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Advance', 'ADVANCE', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Advance Fee', 'ADVANCE FEE', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Clean Inspection', 'Clean Inspection', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Detention', 'DETENTION', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Layover', 'LAYOVER', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Orientation Bonus', 'Orientation Bonus', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'Reimburse', 'REIMBURSE', NULL, 1, 1);

GO
