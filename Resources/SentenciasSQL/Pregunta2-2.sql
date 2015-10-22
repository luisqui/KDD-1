SELECT cons."SpanishProductName" AS Nombre, COUNT(cons."SpanishProductName") FROM
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
WHERE cons."SpanishPromotionName" = 'Sin descuento' AND cons."ShipDateKey" BETWEEN 20120105 AND  20141212
GROUP BY cons."SpanishProductName", cons."SpanishPromotionName"
ORDER BY COUNT(cons."SpanishProductName") DESC