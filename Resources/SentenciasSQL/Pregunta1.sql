SELECT  cons.nombre, count(cons.nombre) FROM
(SELECT p."SpanishPromotionName" AS nombre, f."ShipDateKey"
FROM "FactInternetSales" AS f INNER JOIN "DimPromotion" AS p 
ON f."PromotionKey" = p."PromotionKey" 
WHERE p."SpanishPromotionName" <> 'Sin descuento'
UNION ALL
SELECT p."SpanishPromotionName" AS nombre, f."ShipDateKey"
FROM "FactResellerSales" AS f INNER JOIN "DimPromotion" AS p 
ON f."PromotionKey" = p."PromotionKey"
WHERE p."SpanishPromotionName" <> 'Sin descuento') AS cons
WHERE cons."ShipDateKey" BETWEEN ? AND  ?
GROUP BY cons.nombre
ORDER BY count(cons.nombre) DESC