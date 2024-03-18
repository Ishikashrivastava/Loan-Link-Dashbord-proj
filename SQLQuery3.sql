-- DASHBORAD 2

 SELECT* from bank_loan_data

SELECT
      MONTH(issue_date) AS Month_Number,
      DATENAME(MONTH,issue_date) AS Month_Name,
	  COUNT(id) AS Total_LOAN_APPLICATIONS,
	  SUM(loan_amount) AS Total_funded_Amount,
	  SUM(total_payment)AS TOtal_recevied_amount
FROM bank_loan_data
GROUP BY MONTH(issue_date),  DATENAME(MONTH,issue_date)
ORDER BY DATENAME(MONTH ,issue_date) 

       
SELECT
      address_state,
	  COUNT(id) AS Total_LOAN_APPLICATIONS,
	  SUM(loan_amount) AS Total_funded_Amount,
	  SUM(total_payment)AS TOtal_recevied_amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC

SELECT
     term,
	 COUNT(id) AS Total_LOAN_APPLICATIONS,
	 SUM(loan_amount) AS Total_funded_Amount,
	 SUM(total_payment)AS TOtal_recevied_amount
From bank_loan_data
GROUP BY term
ORDER BY term

SELECT
     emp_length,
	 COUNT(id) AS Total_LOAN_APPLICATIONS,
	 SUM(loan_amount) AS Total_funded_Amount,
	 SUM(total_payment)AS TOtal_recevied_amount
From bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

SELECT
     purpose,
	 COUNT(id) AS Total_LOAN_APPLICATIONS,
	 SUM(loan_amount) AS Total_funded_Amount,
	 SUM(total_payment)AS TOtal_recevied_amount
From bank_loan_data
GROUP BY purpose
ORDER BY count(id) desc

SELECT
     home_ownership,
	 COUNT(id) AS Total_LOAN_APPLICATIONS,
	 SUM(loan_amount) AS Total_funded_Amount,
	 SUM(total_payment)AS TOtal_recevied_amount
From bank_loan_data
WHERE grade ='A' 
GROUP BY home_ownership
ORDER BY count(id) desc

