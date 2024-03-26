DELETE FROM [export].[AccountingExportPayrollItem];
GO

--REDBONE COMPANY
	--EARNINGS
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [NameLegacy], [Order], [Enabled]) VALUES (1, 1, 'Doubles (Albertsons)', 'asdf', 1, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [NameLegacy], [Order], [Enabled]) VALUES (1, 1, 'Drop & Hook (Doubles)', 'Drop & Hook', 2, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [NameLegacy], [Order], [Enabled]) VALUES (1, 1, 'OTR Drop Solo', 'asdf', 3, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [NameLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Redbone - OTR)', 'asdf', 4, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [NameLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainee)', 'asdf', 5, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [NameLegacy], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainer)', 'asdf', 6, 1);

	--OTHER
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [NameQB], [NameLegacy], [Order], [Enabled]) VALUES (1, 2, 'Per Diem', 'asdf', 1, 1);

GO
