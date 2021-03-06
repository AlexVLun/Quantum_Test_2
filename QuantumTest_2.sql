--Извиняюсь, что не правильно прочитал задание в прошлый раз.
--Если записи таблицы являются линиями чека, то исключен вариант, что две покупки одного клиента могут быть пробиты одним временем.
--Если основываться на этом допущении, то решение может выглядить следующим образом:

select [productid],COUNT(*) as Popularity from
(
	--получаем первую покупку каждого клиента
	SELECT	[customerid] as customerid
		,MIN([datetime]) as FirstBuy
	FROM [LunTestDB].[dbo].[QW_Test2]
		group by [customerid]
) tRez
join  [LunTestDB].[dbo].[QW_Test2] t2 on tRez.customerid=t2.customerid and t2.[datetime]=tRez.FirstBuy 
group by productid