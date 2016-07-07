/****** Script for SelectTopNRows command from SSMS  ******/
SELECT	[customerid] 
		,[productid] 
		,MIN([datetime]) as 'FirstBuy'
		,COUNT(*) as 'Count'
	FROM [LunTestDB].[dbo].[QW_Test2]
		group by [customerid], [productid]
			order by [customerid], [productid]