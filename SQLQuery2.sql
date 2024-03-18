-- DASHBORAD 1

SELECT * from bank_loan_data

--total laon application
select count(id) AS Total_loan_application FROM bank_loan_data;

--month to end date
select count(id) AS MTD_Total_loan_application FROM bank_loan_data
where MONTH(issue_date)= 12 and year(issue_date)=2021

--month to month date
select count(id) AS PMTD_Total_loan_application FROM bank_loan_data
where MONTH(issue_date)= 11 and year(issue_date)=2021

--TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount)as total_funded_amount FROM bank_loan_data

SELECT SUM(loan_amount)as MTD_total_funded_amount FROM bank_loan_data
where MONTH(issue_date)= 12 and year(issue_date)=2021

SELECT SUM(loan_amount)as PMTD_total_funded_amount FROM bank_loan_data
where MONTH(issue_date)= 11 and year(issue_date)=2021

--TOTAL AMOUNT RECIVED
SELECT SUM(total_payment) as total_amount_recived from bank_loan_data

SELECT SUM(total_payment) as MTD_total_amount_recived from bank_loan_data
where MONTH(issue_date)= 12 and year(issue_date)=2021

SELECT SUM(total_payment) as PMTD_total_amount_recived from bank_loan_data
where MONTH(issue_date)= 11 and year(issue_date)=2021

 -- AVG INRSET RATE
SELECT ROUND(AVG(int_rate),4)*100 as Avg_Intrest_rate FROM bank_loan_data


 SELECT ROUND(AVG(int_rate),4)*100 as PTMD_Avg_Intrest_rate FROM bank_loan_data
where MONTH(issue_date)= 11 and year(issue_date)=2021

--DTI(TO CHECK WE HAVE TO HAVE LOAN TO THAT COMPANY OR NOT)
SELECT ROUND(AVG(dti),4)*100 as MTD_Avg_Intrest_rate FROM bank_loan_data
where MONTH(issue_date)= 12 and year(issue_date)=2021

SELECT ROUND(AVG(dti),4)*100 as PMTD_Avg_Intrest_rate FROM bank_loan_data
where MONTH(issue_date)= 11 and year(issue_date)=2021

--GOOD AND BAD LOAN!

SELECT
    (COUNT(CASE WHEN loan_status = 'Fully paid' OR loan_status='current' THEN id END)*100)
	/
	 COUNT(id) AS Good_loan_precentage
FROM bank_loan_data

--good application loans

SELECT COUNT(id)AS GOOD_LOAN_APLLICATION  from bank_loan_data
WHERE loan_status = 'FULLY PAID' OR loan_status = 'CURRENT'

-- good loan funded amount 
select sum(loan_amount) AS good_loan_funded_amount FROM bank_loan_data
 WHERE loan_status = 'FULLY PAID' OR loan_status = 'CURRENT'

 -- good amount recevied 
 select sum(total_payment) AS good_loan_amount_recived FROM bank_loan_data
 WHERE loan_status = 'FULLY PAID' OR loan_status = 'CURRENT'

 -- bad loan
 SELECT
    (COUNT(CASE WHEN loan_status = 'Charged off' THEN id END)*100.0)
	/
	 COUNT(id) AS Bad_loan_precentage
FROM bank_loan_data

--bad loan application
SELECT COUNT(id) AS bad_loan_application from bank_loan_data
WHERE loan_status = 'charged off'

-- bad loan funded amount
Select sum(loan_amount) AS BAD_good_loan_funded_amount FROM bank_loan_data
 WHERE loan_status = 'CHARGED OFF'

 -- BAD LOAN AMOUNT RECEVIED
 select sum(total_payment) AS BAD_loan_amount_recived FROM bank_loan_data
  WHERE loan_status = 'CHARGED OFF'

  -- LOAN STATUS

SELECT 
       loan_status,
	   COUNT(id) AS Total_loan_application,
	   SUM(total_payment) AS total_amount_received,
	   SUM(loan_amount) AS TOTAL_FUNNDED_AMOUNT,
	   AVG(int_rate*100)AS INTEREST_RATE,
	   AVG(dti*100) AS DTI
	   FROM
	       bank_loan_data
	   GROUP BY 
	   loan_status

SELECT 
       loan_status,
	   SUM(total_payment) AS MTD_total_amount_received,
	   SUM(loan_amount) AS MTD_TOTAL_FUNNDED_AMOUNT
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status
	   
