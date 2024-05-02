DELIMITER $$

-- THE FOLLOWING PROCEDURE WILL RETURN PRODUCTS WITH SELLING PRICE ABOVE SPECIFIED --
CREATE PROCEDURE ProductsWithSellingPriceAboveP(IN P DECIMAL(9,2))
BEGIN
	SELECT *
    FROM products
    WHERE SellingPrice > P;
END$$

-- THE FOLLOWING PROCEDURE WILL RETURN CLIENTS WITH TOTAL ORDERS NUMBER ABOVE SPECIFIED --
CREATE PROCEDURE ClientsWithOrdersNumberAboveO(IN O INT)
BEGIN
	SELECT c.CustomerName,
	COUNT(*) AS TotalOrders
	FROM customers AS c
	JOIN orders AS o
		ON c.CustomerTableEntryID = o.CustomerTableEntryID
	GROUP BY c.CustomerName
	HAVING TotalOrders > O
	ORDER BY TotalOrders DESC;
END$$

DELIMITER ;

	-- Created stored procedures can be then called with the following commands: --
-- CALL ProductsWithSellingPriceAboveP(200);
-- CALL ClientsWithOrdersNumberAboveO(5);