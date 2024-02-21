DELETE FROM [export].[AccountingExportPayrollItem];
GO

INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 1', 1);
INSERT INTO [export].[AccountingExportPayrollItem] ([AccountingExportCompanyId], [AccountingExportPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 2', 1);
GO
