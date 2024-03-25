DELETE FROM [export].[AccountingExportPayrollItem];
GO

--REDBONE COMPANY
	--EARNINGS
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Order], [Enabled]) VALUES (1, 1, 'Doubles (Albertsons)', 1, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Order], [Enabled]) VALUES (1, 1, 'Drop & Hook (Doubles)', 2, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Order], [Enabled]) VALUES (1, 1, 'OTR Drop Solo', 3, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Redbone - OTR)', 4, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainee)', 5, 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Order], [Enabled]) VALUES (1, 1, 'Per Mile (Trainer)', 6, 1);

	--OTHER
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Order], [Enabled]) VALUES (1, 2, 'Per Diem', 1, 1);

GO
