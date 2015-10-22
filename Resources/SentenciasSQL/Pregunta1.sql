SELECT p."SpanishPromotionName" AS nombre, COUNT(p."SpanishPromotionName")
FROM "FactInternetSales" AS f INNER JOIN "DimPromotion" AS p 
ON f."PromotionKey" = p."PromotionKey" 
WHERE f."ShipDateKey" BETWEEN ? AND  ? AND p."SpanishPromotionName" <> 'Sin descuento'
GROUP BY p."SpanishPromotionName"