DELETE FROM [export].[AccountingExportPayrollItem];
GO

--REDBONE COMPANY
	--EARNINGS
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Doubles (Albertsons)', 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Drop & Hook (Doubles)', 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'OTR Drop Solo', 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Per Mile (Redbone - OTR)', 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Per Mile (Trainee)', 1);
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Per Mile (Trainer)', 1);

	--OTHER
		INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 2, 'Per Diem', 1);

GO
