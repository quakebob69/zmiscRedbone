DELETE FROM [export].[ExportAccountingPayrollItem];
GO

INSERT INTO [export].[ExportAccountingPayrollItem] ([ExportAccountingCompanyId], [ExportAccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 1', 1);
INSERT INTO [export].[ExportAccountingPayrollItem] ([ExportAccountingCompanyId], [ExportAccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 2', 1);
GO
