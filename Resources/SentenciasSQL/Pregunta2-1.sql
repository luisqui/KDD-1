SELECT cons."EnglishProductName" AS Nombre, COUNT(cons."EnglishProductName") AS ventas FROM
(SELECT pro."EnglishProductName", p."SpanishPromotionName", f."ShipDateKey"
FROM "DimProduct" AS pro INNER JOIN "FactInternetSales" AS f 
ON pro."ProductKey" = f."ProductKey"
INNER JOIN "DimPromotion" AS p 
ON f."PromotionKey" = p."PromotionKey"
UNION ALL
SELECT pro."EnglishProductName", p."SpanishPromotionName", f."ShipDateKey"
FROM "DimProduct" AS pro INNER JOIN "FactResellerSales" AS f 
ON pro."ProductKey" = f."ProductKey"
INNER JOIN "DimPromotion" AS p 
ON f."PromotionKey" = p."PromotionKey") AS cons
WHERE cons."SpanishPromotionName" <> 'Sin descuento' AND cons."ShipDateKey" BETWEEN ? AND  ? AND cons."EnglishProductName" = ?
GROUP BY cons."EnglishProductName", cons."SpanishPromotionName"
ORDER BY COUNT(cons."EnglishProductName") DESC