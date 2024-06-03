using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using RedbonePlatform.Datasets.dsPayrollTableAdapters;
using RedbonePlatform.Utils;


namespace RedbonePlatform.Services.Payroll
{
    public class PayrollService : IPayrollService
    {
        public PayrollService()
        {
        }

        public Dictionary<int, DateTime> getArrivalDate_OfDriversWhoEndedPreviousPayPeriodAtHomeTerminal()
        {
            Dictionary<int, DateTime> homeTerminalArrivalDates = new Dictionary<int, DateTime>();

            //get distinct loads for last 2 months from histrory table for drivers that worked on current payperiod
            PR_OTR_HistoryTableAdapter pR_OTR_HistoryTableAdapter = new PR_OTR_HistoryTableAdapter();

            PayrollOTRPayPeriodTableAdapter payrollOTRPayPeriodAdapter = new PayrollOTRPayPeriodTableAdapter();
            Datasets.dsPayroll.PayrollOTRPayPeriodRow activePayPer = payrollOTRPayPeriodAdapter.GetData().Where(pp => pp.IsActive == true).FirstOrDefault();

            //int searchThisManyDaysBack = 60;
            int searchThisManyDaysBack = 1;
            DateTime searchFromThisDate = activePayPer.BeginDate.AddDays(-searchThisManyDaysBack);

            List<Datasets.dsPayroll.PR_OTR_HistoryRow> recentHistoryrecs = null;

            try
            {
                recentHistoryrecs = 
                pR_OTR_HistoryTableAdapter
                .GetData()
                .Where(hist => hist.Field<DateTime?>("DeliverBy") != null && hist.DeliverBy > searchFromThisDate)
                .ToList();
            } catch(Exception ex) {
                string blah = ex.Message;
                string blah2 = ex.Message;
            }

             //.Where(a => (String.IsNullOrEmpty(ip) || a.IPADDRESS.StartsWith(ip)) &&
             //   (String.IsNullOrEmpty(mac) || a.MACADDRESS.StartsWith(mac)))





            //List<Datasets.dsEquipment.PUnitMakeModelRow> mmTable = mmAdapt.GetData().Where(m => m.PUnitMakeId == mmRow.PUnitMakeId).ToList();




            //assume driver is new if nothing found (ie don't need to add)
            //

            //loop through loads
            Dictionary<int, DateTime> lastDriverStopFromPreviousPayPeriod = new Dictionary<int, DateTime>();
            //add//update driver's stops
            /*if (!myDict.ContainsKey("apple"))
                myDict.Add("apple", 5);
            else
                myDict["apple"] = 10;*/

            //loop through lastPayPeriodDriverActivity
            //add to homeTerminalArrivalDates
            //if driver's record is a drop and is home terminal

            homeTerminalArrivalDates.Add(0, DateTime.Now);

            return homeTerminalArrivalDates;
        }



        public void setPersonFullTimeEligibleDate(DateTime statusChangeDate, int personId)
        {
            DateTime fullTimeEligibilityDate = PayrollUtils.calcFullTimeEligibilityDate(statusChangeDate);

            Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter adaptPerson = new Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter();
            Datasets.dsPartyMaintenance.PersonDataTable pplTbl = adaptPerson.GetData(Convert.ToInt32(personId));
            Datasets.dsPartyMaintenance.PersonRow person;

            if (pplTbl.Rows.Count > 0)
            {
                person = pplTbl[0];
                person.FullTimeEligibleDate = fullTimeEligibilityDate;
                adaptPerson.Update(pplTbl);
            }
        }
    }
}