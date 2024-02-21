DELETE FROM [payroll].[ExportAccountingPayrollItem];
GO

INSERT INTO [payroll].[ExportAccountingPayrollItem] ([ExportAccountingCompanyId], [ExportAccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 1', 1);
INSERT INTO [payroll].[ExportAccountingPayrollItem] ([ExportAccountingCompanyId], [ExportAccountingPayrollEntryTypeId], [Name], [Enabled]) VALUES (1, 1, 'Payroll Item 2', 1);
GO
