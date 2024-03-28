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
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBCHANGE8', 'ADVANCE', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBCHANGE9', 'ADVANCE FEE', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBCHANGE10', 'Clean Inspection', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBCHANGE11', 'DETENTION', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBCHANGE12', 'LAYOVER', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBCHANGE13', 'Orientation Bonus', NULL, 1, 1);
			INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [PayCodeLegacy], [PayIdLegacy], [Order], [Enabled]) VALUES (1, 2, 'QBCHANGE14', 'REIMBURSE', NULL, 1, 1);


GO
