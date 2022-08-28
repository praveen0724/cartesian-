SELECT Cat_Id,Product_Id,ROW_NUMBER() OVER(PARTITION BY Cat_Id) AS Trending
FROM (
  SELECT p.Cat_Id,p.Product_Id,o.Sale_Qty,
         ROW_NUMBER() OVER (PARTITION BY p.Cat_Id ORDER BY o.Sale_Qty DESC) rn
  FROM product_catalogue p INNER JOIN purchase_history o
  ON o.Product_Id = p.Product_Id
  GROUP BY p.Product_Id
) t
WHERE rn <= 2 and Cat_id!=3
ORDER BY Product_Id;