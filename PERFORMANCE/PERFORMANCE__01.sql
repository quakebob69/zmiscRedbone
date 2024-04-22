/*
	--57693
		select ls.loadid, count(ls.loadid) as asdf
		from dispatch.loadstop ls
		join dispatch.load l on l.LoadId = ls.LoadId
		where
		l.LoadStatusTypeId < 3
		---and l.loadid > 56206

		group by ls.loadid 
		order by asdf desc, ls.LoadId desc

		select * from dispatch.LoadStatusType
*/

/*
    function initializeRequest(sender, eventArgs)  
    {  
        objLoadingPanel = $find("<%=lpRadDockLoadingPanel.ClientID%>");  
        objLoadingPanel.show("<%=rdzLeft.ClientID%>");  
        objLoadingPanel.show("<%=rdzRight.ClientID%>");  
    }  
 
    function endRequest(sender, eventArgs)  
    {  
        objLoadingPanel = $find("<%=lpRadDockLoadingPanel.ClientID%>");  
        objLoadingPanel.hide("<%=rdzLeft.ClientID%>");  
        objLoadingPanel.hide("<%=rdzRight.ClientID%>");  
    } 
	
	
	RadAjaxManager1.ResponseScripts.Add("requestStart();");
	RadAjaxManager1.ResponseScripts.Add("responseEnd();");
*/


--radopen("../Pages/ContainerPages/DispatchSheet.aspx?LoadId=" + LoadId, "DispatchSheet");

