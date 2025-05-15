-- 1. Customer details with Account_no "A0004"
SELECT Customer.name, Customer.phone_no, Customer.cust_no 
FROM Customer 
JOIN Depositor ON Customer.cust_no = Depositor.cust_no 
WHERE Depositor.account_no = 'A0004';

--OP:
-- NAME						   PHONE_NO   CUST_
-- -------------------------------------------------- ---------- -----
-- SWAROOP RAY				  9437855466 C0006


-- 2. Customers who have not taken any loan
SELECT Customer.name 
FROM Customer 
WHERE Customer.cust_no NOT IN (SELECT Loan.cust_no FROM Loan);

-- OP:
-- NAME
-- --------------------------------------------------
-- SOUMYA JHA
-- ABHIJIT MISHRA
-- SWAROOP RAY
-- SURYA NARAYAN

-- 3. Account details of customer with cust_no = "C0010"
SELECT Account.account_no, Account.balance 
FROM Account 
JOIN Depositor ON Account.account_no = Depositor.account_no 
WHERE Depositor.cust_no = 'C0010';

-- OP:
-- ACCOU	 BALANCE
-- ----- ----------
-- A0006	  550000


-- 4. Branch city where "ASLESHA TIWARI" has taken a loan
SELECT Branch.branch_city 
FROM Branch 
WHERE Branch.branch_code IN (SELECT Loan.branch_code FROM Loan 
WHERE Loan.cust_no IN (SELECT Customer.cust_no FROM Customer WHERE Customer.name = 'ASLESHA TIWARI'));

-- OP:
-- BRANCH_CITY
-- --------------------------------------------------
-- MUMBAI

-- 5. Installment details of customer "ANKITA SINGH"
SELECT Installment.inst_no, Installment.inst_amount 
FROM Installment 
WHERE Installment.loan_no IN (SELECT Loan.loan_no FROM Loan 
WHERE Loan.cust_no IN (SELECT Customer.cust_no FROM Customer WHERE Customer.name = 'ANKITA SINGH'));

-- op:
--    INST_NO INST_AMOUNT
-- ---------- -----------
-- 	 1	 50000
-- 	 2	 50000


-- 6. Branch name and city where "ABHIJIT MISHRA" has an account
SELECT Branch.branch_name, Branch.branch_city 
FROM Branch 
WHERE Branch.branch_code IN (SELECT Account.branch_code FROM Account 
WHERE Account.account_no IN (SELECT Depositor.account_no FROM Depositor 
WHERE Depositor.cust_no IN (SELECT Customer.cust_no FROM Customer WHERE Customer.name = 'ABHIJIT MISHRA')));

-- op:
-- BRANCH_NAME					   BRANCH_CITY
-- -------------------------------------------------- 
-- CHANDNICHOWK BRANCH				   DELHI
-- JUHU BRANCH					       MUMBAI



-- 7. Create ACCOUNT_TYPE table
CREATE TABLE ACCOUNT_TYPE (
    ACCOUNT_NO VARCHAR(20),
    TYPE VARCHAR(20)
);

-- op: Table created.

-- 8. Insert account no and type with balance < 50000
INSERT INTO ACCOUNT_TYPE (ACCOUNT_NO, TYPE)
SELECT Account.account_no, Account.type 
FROM Account 
WHERE Account.balance < 50000;
-- OP:
-- 5 rows created.

-- Commit complete.

-- 9. Update account type to FD for cust_no "C0007"
UPDATE ACCOUNT_TYPE 
SET TYPE = 'FD' 
WHERE ACCOUNT_NO IN (SELECT Account.account_no FROM Account 
WHERE Account.account_no IN (SELECT Depositor.account_no FROM Depositor WHERE Depositor.cust_no = 'C0007'));
-- op:
-- 1 row updated.

-- Commit complete.

-- 10. Delete accounts with balance < 20000
DELETE FROM ACCOUNT_TYPE 
WHERE ACCOUNT_NO IN (SELECT Account.account_no FROM Account WHERE Account.balance < 20000);
-- OP:
-- 3 rows deleted.

-- Commit complete

-- 11. Accounts with balance greater than some FD accounts
SELECT Account.account_no 
FROM Account 
WHERE Account.balance > SOME (SELECT Account.balance FROM Account WHERE Account.type = 'FD');
-- OP:
-- ACCOU
-- -----
-- A0003
-- A0006
-- A0001
-- A0010
-- A0007
-- A0004

-- 6 rows selected.

-- 12. Accounts with balance greater than all FD accounts
SELECT Account.account_no 
FROM Account 
WHERE Account.balance > ALL (SELECT Account.balance FROM Account WHERE Account.type = 'FD');
-- OP:
-- ACCOU
-- -----
-- A0003

-- 13. Branches where some loans are taken
SELECT * FROM Branch 
WHERE EXISTS (SELECT * FROM Loan WHERE Loan.branch_code = Branch.branch_code);
-- OP:
-- BRANC BRANCH_NAME					 BRANCH_CITY
-- ----- -------------------------------------------------- --------------------------------------------------
-- B004  ANDHERI BRANCH					 MUMBAI
-- B005  SALTLAKE BRANCH					 KOLKATA
-- B006  SRIRAMPURAM BRANCH				 CHENNAI

-- 14. Loans with no installments paid
SELECT * FROM Loan 
WHERE NOT EXISTS (SELECT * FROM Installment WHERE Installment.loan_no = Loan.loan_no);
-- OP:
-- LOAN_ CUST_	AMOUNT BRANC
-- ----- ----- ---------- -----
-- L0001 C0005    3000000 B006

-- 15. Increase balances with CASE statement
UPDATE Account 
SET balance = CASE 
    WHEN balance > 80000 THEN balance * 1.06 
    ELSE balance * 1.05 
END;
-- OP:
-- 10 rows updated.

-- Commit complete.
