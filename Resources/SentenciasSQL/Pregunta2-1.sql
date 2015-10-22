SELECT cons."SpanishProductName" AS Nombre, COUNT(cons."SpanishProductName") AS ventas FROM
(SELECT pro."SpanishProductName", p."SpanishPromotionName", f."ShipDateKey"
FROM "DimProduct" AS pro INNER JOIN "FactInternetSales" AS f 
ON pro."ProductKey" = f."ProductKey"
INNER JOIN "DimPromotion" AS p 
ON f."PromotionKey" = p."PromotionKey"
UNION ALL
SELECT pro."SpanishProductName", p."SpanishPromotionName", f."ShipDateKey"
FROM "DimProduct" AS pro INNER JOIN "FactResellerSales" AS f 
ON pro."ProductKey" = f."ProductKey"
INNER JOIN "DimPromotion" AS p 
ON f."PromotionKey" = p."PromotionKey") AS cons
WHERE cons."SpanishPromotionName" <> 'Sin descuento' AND cons."ShipDateKey" BETWEEN ? AND  ? AND cons."SpanishProductName" = '?'
GROUP BY cons."SpanishProductName", cons."SpanishPromotionName"
ORDER BY COUNT(cons."SpanishProductName") DESC