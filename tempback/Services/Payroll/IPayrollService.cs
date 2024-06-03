using System;
using System.Collections.Generic;

namespace RedbonePlatform.Services.Payroll
{
    internal interface IPayrollService
    {
        void setPersonFullTimeEligibleDate(DateTime statusChangeDate, int personId);
        Dictionary<int, DateTime> getArrivalDate_OfDriversWhoEndedPreviousPayPeriodAtHomeTerminal();
    }
}
