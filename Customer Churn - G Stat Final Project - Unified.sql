USE customer_churn
GO


-- Service Analysis

;WITH CTE AS (
SELECT CASE WHEN Paperless_Billing = 'Yes' THEN 'Paperless Billing Yes' WHEN Paperless_Billing ='No' THEN 'Papaerless Billing No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Paperless_Billing IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Paperless_Billing IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Paperless_Billing IS NOT NULL
GROUP BY Paperless_Billing),

CTEA AS (
SELECT CASE WHEN Unlimited_Data = 'Yes' THEN 'Unlimited Data Yes' WHEN Unlimited_Data ='No' THEN 'Unlimited Data No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Unlimited_Data IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Unlimited_Data IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Unlimited_Data IS NOT NULL
GROUP BY Unlimited_Data),

CTEB AS (
SELECT CASE WHEN Internet_Service = 'Yes' THEN 'Internet Service Yes' WHEN Internet_Service ='No' THEN 'Internet Service No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Internet_Service IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Internet_Service IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Internet_Service IS NOT NULL
GROUP BY Internet_Service),

CTEC AS (
SELECT CASE WHEN Premium_Tech_Support = 'Yes' THEN 'Premium Tech Support Yes' WHEN Premium_Tech_Support ='No' THEN 'Premium Tech Support No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Premium_Tech_Support IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Premium_Tech_Support IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Premium_Tech_Support IS NOT NULL
GROUP BY Premium_Tech_Support),

CTED AS (
SELECT CASE WHEN Device_Protection_Plan = 'Yes' THEN 'Device Protection Plan Yes' WHEN Device_Protection_Plan ='No' THEN 'Device Protection Plan No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Device_Protection_Plan IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Device_Protection_Plan IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Device_Protection_Plan IS NOT NULL
GROUP BY Device_Protection_Plan),

CTEF AS (
SELECT CASE WHEN Online_Security = 'Yes' THEN 'Online Security Yes' WHEN Online_Security ='No' THEN 'Online Security No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Online_Security IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Online_Security IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Online_Security IS NOT NULL
GROUP BY Online_Security),

CTEG AS (
SELECT CASE WHEN Online_Backup = 'Yes' THEN 'Online Backup Yes' WHEN Online_Backup ='No' THEN 'Online Backup No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Online_Backup IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Online_Backup IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Online_Backup IS NOT NULL
GROUP BY Online_Backup),

CTEH AS (
SELECT CASE WHEN Streaming_Movies = 'Yes' THEN 'Streaming Movies Yes' WHEN Streaming_Movies ='No' THEN 'Streaming Movies No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Streaming_Movies IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Streaming_Movies IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Streaming_Movies IS NOT NULL
GROUP BY Streaming_Movies),

CTEI AS (
SELECT CASE WHEN Streaming_Music = 'Yes' THEN 'Streaming Music Yes' WHEN Streaming_Music ='No' THEN 'Streaming Music No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Streaming_Music IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Streaming_Music IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Streaming_Music IS NOT NULL
GROUP BY Streaming_Music),

CTEJ AS (
SELECT CASE WHEN Streaming_TV = 'Yes' THEN 'Streaming TV Yes' WHEN Streaming_TV ='No' THEN 'Streaming TV No' END AS 'Service',
COUNT(*) AS 'Total Customers',
FORMAT(COUNT(CASE WHEN Streaming_TV IN ('Yes','No') THEN 1 END)*1.0/
(SELECT COUNT(CASE WHEN Streaming_TV IN ('Yes','No') THEN 1 END)
FROM telecom_customer_churn),'P') AS 'Customer PCT',
AVG(CAST(Tenure_in_Months AS DEC(4,2))) AS 'Avg Months Tenure',
AVG(Monthly_Charge) AS 'Avg Monthly Charge', 
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) AS 'Avg Customer Value',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * COUNT(*) AS 'Avg Group Charge',
SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Customers Churn',
FORMAT(SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1.0 ELSE 0 END)*1.0/COUNT(*),'P') AS 'Churn Rate',
AVG(CAST(Tenure_in_Months AS DEC(4,2)))*AVG(Monthly_Charge) * SUM(CASE WHEN Customer_Status LIKE 'churned' THEN 1 ELSE 0 END) AS 'Total churn value'
FROM telecom_customer_churn 
WHERE Streaming_TV IS NOT NULL
GROUP BY Streaming_TV)

SELECT *
FROM CTE 
UNION
SELECT *
FROM CTEA
UNION 
SELECT *
FROM CTEB
UNION 
SELECT *
FROM CTEC
UNION
SELECT *
FROM CTED
UNION
SELECT *
FROM CTEF
UNION
SELECT *
FROM CTEG
UNION 
SELECT *
FROM CTEH
UNION
SELECT *
FROM CTEI
UNION
SELECT *
FROM CTEJ
ORDER BY Service



-- General information for beggining slide
SELECT COUNT(*) AS 'Total Customers',
	   SUM(Total_Revenue) AS 'Total Revenue'
FROM telecom_customer_churn

-- Churned users by category, and the usage of services out of the groups' total including statistics

;WITH CTE AS (
SELECT Churn_Category,
	   COUNT(*) AS 'Total Customers',
	   CAST(SUM(CASE WHEN Internet_Service = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))	     AS 'Total Internet Users',
	   CAST(SUM(CASE WHEN Online_Security = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*)	AS DECIMAL (5,4))	     AS 'Online Security Users',
	   CAST(SUM(CASE WHEN Online_Backup = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))          AS 'Online Backup Users',
	   CAST(SUM(CASE WHEN Device_Protection_Plan = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4)) AS 'DPP Users',
	   CAST(SUM(CASE WHEN Premium_Tech_Support = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))   AS 'PT Support Users',
	   CAST(SUM(CASE WHEN Streaming_Movies = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))	     AS 'Movie Stream Users',
	   CAST(SUM(CASE WHEN Streaming_Music = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))	     AS 'Music Stream Users',
	   CAST(SUM(CASE WHEN Streaming_TV = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))           AS 'TV Stream Users',
	   CAST(SUM(CASE WHEN Unlimited_Data = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))         AS 'UL Data Users',
	   CAST(SUM(CASE WHEN Paperless_Billing = 'YES' THEN 1 ELSE 0 END)*1.0 / COUNT(*) AS DECIMAL (5,4))      AS 'Paperless Billing Users',
	   MIN(Tenure_in_Months) AS 'Min Tenure',
	   MAX(Tenure_in_Months) AS 'Max Tenure',
	   AVG(Tenure_in_Months) AS 'AVG Tenure'
FROM telecom_customer_churn
WHERE Customer_Status = 'Churned'
GROUP BY Churn_Category),

CTE_MEDIAN AS (
SELECT DISTINCT Churn_Category,PERCENTILE_CONT(0.5) 
        WITHIN GROUP (ORDER BY Tenure_in_Months DESC) 
        OVER (PARTITION BY Churn_Category)
        AS 'Median Tenure'
FROM telecom_customer_churn
			  )

SELECT CTE.*, CTE_MEDIAN.[Median Tenure]
FROM CTE
LEFT JOIN CTE_MEDIAN
ON CTE.Churn_Category = CTE_MEDIAN.Churn_Category
ORDER BY CTE.[Total Customers] DESC

/* Understanding users tendency to churn is between 9 to 11.5 months, and most churned users did not have the important cover services (Online Security, Online Back, Device Protection Plan and Premium Tech Support),
   A forecast formula is proposed, so there is enough time to propose these services for "about to churn" customers
   Assumptions: 
   1. No customer retention system to propose offers in order to retain customers
   2. The median churn across churn categories ranges between 9 to 11.5 months of memmbership
   3. There are four key services that influence churn, that most churned customers did not have:
	  - Online Security
	  - Online Back
	  - Device Protection Plan
	  - Premium Tech Support */

SELECT Customer_ID, Age, Married, Tenure_in_Months,
ISNULL(Online_Security,'No')         AS Online_Security,
ISNULL(Online_Backup,'No')           AS Online_Backup,
ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
ISNULL(Premium_Tech_Support, 'No')   AS Premium_Tech_Support,
Customer_Status,
Churn_Category,
CASE WHEN Tenure_in_Months >= 6
        AND
        (ISNULL(Online_Security,'No') = 'No' OR ISNULL(Online_Backup,'No') = 'No' OR  ISNULL(Device_Protection_Plan, 'No') = 'No' OR ISNULL(Premium_Tech_Support, 'No') = 'No')
		THEN 'Yes'
		ELSE 'No'
END AS 'About to Churn?'
FROM telecom_customer_churn

-- How many customers are about to churn? and how accurate is the formula

;WITH CTE AS (
			  SELECT Customer_ID, Age, Married, Tenure_in_Months,
			  ISNULL(Online_Security,'No')         AS Online_Security,
			  ISNULL(Online_Backup,'No')           AS Online_Backup,
			  ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
			  ISNULL(Premium_Tech_Support, 'No')   AS Premium_Tech_Support,
			  Customer_Status,
			  Churn_Category,
			  CASE WHEN Tenure_in_Months >= 6
       			   AND
       			   (ISNULL(Online_Security,'No') = 'No' OR ISNULL(Online_Backup,'No') = 'No' OR  ISNULL(Device_Protection_Plan, 'No') = 'No' OR ISNULL(Premium_Tech_Support, 'No') = 'No')
				   THEN 'Yes'
				   ELSE 'No'
		      END AS 'About to Churn?'
			  FROM telecom_customer_churn
			  )
-- Learning about different attributes of customers who slipped the formula
SELECT Tenure_in_Months,
		CASE WHEN Age BETWEEN 19 AND 25 THEN '19-25'
			 WHEN Age BETWEEN 26 AND 33 THEN '26-33'
			 WHEN Age BETWEEN 34 AND 41 THEN '34-41'
			 WHEN Age BETWEEN 42 AND 49 THEN '42-49'
			 WHEN AGE BETWEEN 50 AND 57 THEN '50-57'
			 WHEN Age BETWEEN 58 AND 65 THEN '58-65'
			 WHEN Age >= 66 THEN '66+'
		END AS 'Age Group',
		COUNT(*) 'Churned customers who slipped the formula',
		SUM(COUNT(*)) OVER(ORDER BY Tenure_in_Months, CASE WHEN Age BETWEEN 19 AND 25 THEN '19-25'
													  	 WHEN Age BETWEEN 26 AND 33 THEN '26-33'
													  	 WHEN Age BETWEEN 34 AND 41 THEN '34-41'
													  	 WHEN Age BETWEEN 42 AND 49 THEN '42-49'
													  	 WHEN AGE BETWEEN 50 AND 57 THEN '50-57'
													  	 WHEN Age BETWEEN 58 AND 65 THEN '58-65'
													  	 WHEN Age >= 66 THEN '66+'
													  END) AS 'Rolling Count'
FROM CTE
WHERE [About to Churn?] = 'No' AND Customer_Status = 'Churned' --AND Online_Security ='YES' AND Online_Backup = 'YES' AND Device_Protection_Plan = 'YES' AND Premium_Tech_Support = 'YES'
GROUP BY Tenure_in_Months,
		 		CASE WHEN Age BETWEEN 19 AND 25 THEN '19-25'
			 WHEN Age BETWEEN 26 AND 33 THEN '26-33'
			 WHEN Age BETWEEN 34 AND 41 THEN '34-41'
			 WHEN Age BETWEEN 42 AND 49 THEN '42-49'
			 WHEN AGE BETWEEN 50 AND 57 THEN '50-57'
			 WHEN Age BETWEEN 58 AND 65 THEN '58-65'
			 WHEN Age >= 66 THEN '66+'
		END
ORDER BY Tenure_in_Months, [Age Group]

-- 744 Customers in a wide range of age groups slip the formula due to  leaving in less than 6 months of membership

;WITH CTE AS (
			  SELECT Customer_ID, Age, Married, Tenure_in_Months,
			  ISNULL(Online_Security,'No')         AS Online_Security,
			  ISNULL(Online_Backup,'No')           AS Online_Backup,
			  ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
			  ISNULL(Premium_Tech_Support, 'No')   AS Premium_Tech_Support,
			  Customer_Status,
			  Churn_Category,
			  CASE WHEN Tenure_in_Months >= 6
       			   AND
       			   (ISNULL(Online_Security,'No') = 'No' OR ISNULL(Online_Backup,'No') = 'No' OR  ISNULL(Device_Protection_Plan, 'No') = 'No' OR ISNULL(Premium_Tech_Support, 'No') = 'No')
				   THEN 'Yes'
				   ELSE 'No'
		      END AS 'About to Churn?'
			  FROM telecom_customer_churn
			  )

SELECT Churn_Category,
		COUNT(*) 'Churned customers who slipped the formula',
		SUM(COUNT(*)) OVER(ORDER BY Churn_Category) AS 'Rolling Count'
FROM CTE
WHERE [About to Churn?] = 'No' AND Customer_Status = 'Churned' AND Tenure_in_Months < 6 --AND Online_Security ='YES' AND Online_Backup = 'YES' AND Device_Protection_Plan = 'YES' AND Premium_Tech_Support = 'YES'
GROUP BY Churn_Category
ORDER BY Churn_Category

-- Conclusion: new members should receive a discount offer for DPP and PT Support for 6 months, later on making another offer then will be regulated every

-- Total churned

;WITH CTE AS (
			  SELECT Customer_ID, Age, Married, Tenure_in_Months,
			  ISNULL(Online_Security,'No')         AS Online_Security,
			  ISNULL(Online_Backup,'No')           AS Online_Backup,
			  ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
			  ISNULL(Premium_Tech_Support, 'No')   AS Premium_Tech_Support,
			  Customer_Status,
			  Churn_Category,
			  CASE WHEN Tenure_in_Months >= 6
       			   AND
       			   (ISNULL(Online_Security,'No') = 'No' OR ISNULL(Online_Backup,'No') = 'No' OR  ISNULL(Device_Protection_Plan, 'No') = 'No' OR ISNULL(Premium_Tech_Support, 'No') = 'No')
				   THEN 'Yes'
				   ELSE 'No'
		      END AS 'About to Churn?'
			  FROM telecom_customer_churn
			  )

SELECT Customer_Status, [About to Churn?] ,COUNT(*) AS 'Total Customers'
FROM CTE
GROUP BY Customer_Status, [About to Churn?]

-- Out of 1,869 Churned customers, the formula could not detect 768 of them, due to canceling membership in less than 6 months
-- Out of the remaining customers, 4,113 are detected as "About to churn"
