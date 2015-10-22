SELECT cons."SpanishPromotionName" AS promocion, COUNT(cons."SpanishProductName") FROM
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
WHERE cons."SpanishPromotionName" LIKE '%volumen%' AND cons."ShipDateKey" BETWEEN ? AND  ? 
GROUP BY cons."SpanishPromotionName"
ORDER BY COUNT(cons."SpanishProductName") DESC