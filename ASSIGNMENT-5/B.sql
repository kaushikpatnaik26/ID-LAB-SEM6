-- 1. Loan numbers for loans taken in Mumbai
SELECT Loan.loan_no 
FROM Loan 
JOIN Branch ON Loan.branch_code = Branch.branch_code 
WHERE Branch.branch_city = 'MUMBAI';
-- OP:
-- LOAN_
-- -----
-- L0003
-- L0004

-- 2. Types of accounts in Delhi
SELECT DISTINCT Account.type 
FROM Account 
JOIN Branch ON Account.branch_code = Branch.branch_code 
WHERE Branch.branch_city = 'DELHI';
-- OP:
-- TY
-- --
-- SB

-- 3. Customers with account balance > 100000
SELECT Customer.name, Customer.phone_no 
FROM Customer 
JOIN Depositor ON Customer.cust_no = Depositor.cust_no 
JOIN Account ON Depositor.account_no = Account.account_no 
WHERE Account.balance > 100000;

-- OP:
-- NAME						   PHONE_NO
-- -------------------------------------------------- ----------
-- SOUMYA JHA					   9885623344
-- ABHIJIT MISHRA					   9455845425
-- SWAROOP RAY					   9437855466
-- ASLESHA TIWARI


-- 4. Installment details for "RAJ ANAND SINGH"
SELECT Installment.inst_no, Installment.inst_amount 
FROM Installment 
JOIN Loan ON Installment.loan_no = Loan.loan_no 
JOIN Customer ON Loan.cust_no = Customer.cust_no 
WHERE Customer.name = 'RAJ ANAND SINGH';
-- OP:
--    INST_NO INST_AMOUNT
-- ---------- -----------
-- 	 1	 10000
-- 	 2	 10000
-- 	 3	 10000

-- 5. Customers without an account of type "SB"
SELECT DISTINCT Customer.name 
FROM Customer 
JOIN Depositor ON Customer.cust_no = Depositor.cust_no 
JOIN Account ON Depositor.account_no = Account.account_no 
WHERE Account.type <> 'SB';

-- OP:
-- NAME
-- --------------------------------------------------
-- ASLESHA TIWARI
-- RAJ ANAND SINGH
-- ANKITA SINGH
-- SWAROOP RAY

-- 6. Customers who have paid installments of 50000
SELECT DISTINCT Customer.name 
FROM Customer 
JOIN Loan ON Customer.cust_no = Loan.cust_no 
JOIN Installment ON Loan.loan_no = Installment.loan_no 
WHERE Installment.inst_amount = 50000;

-- OP:
-- NAME
-- --------------------------------------------------
-- ANKITA SINGH

-- 7. Customers' phone numbers with account at branch "SALTLake"
SELECT Customer.phone_no 
FROM Customer 
JOIN Depositor ON Customer.cust_no = Depositor.cust_no 
JOIN Account ON Depositor.account_no = Account.account_no 
JOIN Branch ON Account.branch_code = Branch.branch_code 
WHERE Branch.branch_name = 'SALTLAKE BRANCH';

-- OP:
-- PHONE_NO
-- ----------
-- 9861258466
-- 9879958651


-- 8. Branch name and city where "ABHIJIT MISHRA" has an account
SELECT Branch.branch_name, Branch.branch_city 
FROM Branch 
JOIN Account ON Branch.branch_code = Account.branch_code 
JOIN Depositor ON Account.account_no = Depositor.account_no 
JOIN Customer ON Depositor.cust_no = Customer.cust_no 
WHERE Customer.name = 'ABHIJIT MISHRA';

-- OP:
-- BRANCH_NAME					   BRANCH_CITY
-- -------------------------------------------------- --------------------------------------------------
-- JUHU BRANCH					   MUMBAI
-- CHANDNICHOWK BRANCH				   DELHI


-- 9. Account types and balance of "SWAROOP RAY"
SELECT Account.type, Account.balance 
FROM Account 
JOIN Depositor ON Account.account_no = Depositor.account_no 
JOIN Customer ON Depositor.cust_no = Customer.cust_no 
WHERE Customer.name = 'SWAROOP RAY';
-- OP:

-- TY    BALANCE
-- -- ----------
-- CA     901000
-- CA	  36750


-- 10. Branch codes with balance greater than the average balance
WITH AvgBalance AS (
    SELECT AVG(balance) AS avg_bal FROM Account
)
SELECT Branch.branch_code 
FROM Branch 
JOIN Account ON Branch.branch_code = Account.branch_code 
GROUP BY Branch.branch_code 
HAVING SUM(Account.balance) > (SELECT avg_bal FROM AvgBalance);

-- OP:
-- BRANC
-- -----
-- B003
-- B004
-- B005

