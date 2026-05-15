-- 01_distributions.sql
-- Purpose: Initial distributions to understand shape of data before analysis.
-- Run early in exploration — before committing to any analytical angle.
--
-- Suggested starting queries:
--   - Row counts and date ranges
--   - Nulls and missing values per column
--   - Key field distributions (amounts, statuses, regions, years)
--   - Obvious anomalies (zeros, negatives, outliers)

USE ida_loan_analysis;

-- How many total transactions? 
SELECT 
	COUNT(*)  AS total_records, 
    COUNT(DISTINCT(credit_number)) AS total_loans 
FROM ida_statement_credits_grants_guarantees;
/* RESULT:	
	total_records, total_loans
    '1543992', '11243'
*/

-- How many total transactions per country?
-- Who has the most loans? 
SELECT 
	country, 
	COUNT(DISTINCT(credit_number)) AS total_loans,
    COUNT(*) AS total_records
FROM ida_statement_credits_grants_guarantees
GROUP BY country
ORDER BY total_loans;
/* RESULT:
	country, total_loans, total_records
	'Central America', '1', '180'
	'Chile', '1', '180'
	'Colombia', '1', '180'
	'Costa Rica', '1', '180'
	'International Finance Corporation', '1', '1'
	'Lebanon', '1', '115'
	'Mekong', '1', '154'
	'Mid East,NorthAfrica, Afghan, Pakistan', '1', '9'
	'Middle East and North Africa', '1', '37'
	'South East Asia', '1', '31'
	'St. Kitts and Nevis', '1', '180'
	'Suriname', '1', '14'
	'Thailand & Myanmar CMU', '1', '15'
	'Viet Nam, Cambodia, Laos CMU', '1', '15'
	'World', '1', '1'
	'Pacific 1', '2', '6'
	'Swaziland', '2', '114'
	'Dominican Republic', '3', '540'
	'East Asia and Pacific', '3', '36'
	'OECS Countries', '3', '121'
	'Belize', '4', '45'
	'Central Asia', '4', '576'
	'El Salvador', '4', '720'
	'Eswatini', '4', '271'
	'Taiwan, China', '4', '720'
	'Iraq', '5', '900'
	'Mauritius', '5', '900'
	'Morocco', '5', '900'
	'Botswana', '6', '1080'
	'Central Africa', '6', '731'
	'Ecuador', '6', '1080'
	'Syrian Arab Republic', '6', '731'
	'Thailand', '6', '1080'
	'South Asia', '7', '254'
	'Paraguay', '8', '1440'
	'Korea, Republic of', '9', '1620'
	'Philippines', '9', '1620'
	'Ukraine', '9', '168'
	'Equatorial Guinea', '10', '1800'
	'Pacific Islands', '10', '1017'
	'Tunisia', '10', '1800'
	'Montenegro', '11', '1980'
	'Caribbean', '13', '1517'
	'Turkey', '14', '1862'
	'Turkiye', '14', '658'
	'Zimbabwe', '15', '2601'
	'Fiji', '17', '665'
	'Jordan', '17', '2885'
	'Eritrea', '18', '3240'
	'Micronesia, Federated States of', '18', '1202'
	'Timor-Leste', '18', '2542'
	'Macedonia, former Yugoslav Republic', '20', '720'
	'Macedonia, former Yugoslav Republic of', '20', '560'
	'North Macedonia', '20', '2320'
	'Serbia', '21', '3780'
	'Angola', '24', '4289'
	'Marshall Islands', '24', '1501'
	'Vanuatu', '30', '2421'
	'Kiribati', '31', '2240'
	'Tuvalu', '33', '2352'
	'Cape Verde', '36', '180'
	'Dominica', '36', '3811'
	'Eastern Africa', '39', '890'
	'St. Vincent and the Grenadines', '39', '4269'
	'South Sudan', '40', '2635'
	'Kosovo', '44', '5401'
	'Azerbaijan', '45', '8098'
	'Grenada', '45', '5217'
	'Africa', '46', '2891'
	'Papua New Guinea', '46', '5595'
	'Western Africa', '47', '1963'
	'Maldives', '48', '5503'
	'St. Lucia', '50', '5654'
	'Bhutan', '51', '5636'
	'Egypt, Arab Republic of', '52', '9360'
	'Samoa', '52', '6455'
	'Sao Tome and Principe', '54', '5996'
	'Tonga', '54', '5574'
	'Myanmar', '55', '7890'
	'Mongolia', '61', '9254'
	'Guyana', '62', '8780'
	'Sudan', '63', '9753'
	'Armenia', '66', '11645'
	'Albania', '68', '12240'
	'Georgia', '68', '12014'
	'Solomon Islands', '70', '6233'
	'Western and Central Africa', '70', '2734'
	'Eastern and Southern Africa', '71', '2790'
	'Bosnia and Herzegovina', '73', '12960'
	'Congo, Republic of', '74', '8955'
	'Guinea-Bissau', '76', '10428'
	'Uzbekistan', '76', '6261'
	'Comoros', '78', '7745'
	'Moldova', '78', '11537'
	'Cabo Verde', '80', '8488'
	'Indonesia', '80', '14400'
	'Lesotho', '83', '11668'
	'Cambodia', '84', '10839'
	'Djibouti', '85', '9378'
	'Somalia', '88', '8714'
	'Somalia, Federal Republic of', '92', '817'
	'Gambia, The', '98', '12431'
	'Central African Republic', '102', '12333'
	'Nicaragua', '109', '18173'
	'Haiti', '120', '16599'
	'Honduras', '122', '18639'
	'Liberia', '125', '13491'
	'Chad', '129', '16918'
	'Tajikistan', '132', '16149'
	'Bolivia', '133', '22856'
	'Lao People\'s Democratic Republic', '133', '17604'
	'China', '134', '24120'
	'Afghanistan', '136', '19729'
	'Burundi', '137', '19439'
	'Togo', '137', '16243'
	'Sierra Leone', '139', '18577'
	'Cameroon', '140', '18974'
	'Cote d\'Ivoire', '146', '17651'
	'Mauritania', '154', '20177'
	'Guinea', '161', '21205'
	'Sri Lanka', '162', '24577'
	'Zambia', '162', '23182'
	'Nigeria', '167', '20589'
	'Kyrgyz Republic', '181', '22449'
	'Vietnam', '185', '23690'
	'Viet Nam', '186', '5572'
	'Congo, Democratic Republic of', '198', '26737'
	'Benin', '204', '24973'
	'Rwanda', '206', '26009'
	'Nepal', '209', '30229'
	'Mali', '214', '29304'
	'Niger', '215', '26600'
	'Mozambique', '217', '27479'
	'Malawi', '224', '31737'
	'Uganda', '224', '33938'
	'Burkina Faso', '230', '30411'
	'Yemen, Republic of', '232', '34880'
	'Madagascar', '234', '32183'
	'Senegal', '255', '36037'
	'Kenya', '256', '34760'
	'Ghana', '273', '41644'
	'Ethiopia', '282', '37231'
	'Tanzania', '308', '46013'
	'Pakistan', '337', '48312'
	'Bangladesh', '391', '56165'
	'India', '442', '76435'
*/

-- What is the max owed to the IDA?
SELECT MAX(due_to_ida_us_)
FROM ida_statement_credits_grants_guarantees;  
/* RESULT:
	MAX(due_to_ida_us_)
	'99999990.000000'
*/

-- Max owed by who?
SELECT * 
FROM ida_statement_credits_grants_guarantees 
WHERE due_to_ida_us_ = '99999990.000000';
/* RESULT:
	id, end_of_period, credit_number, region, country_code, country, borrower, credit_status, service_charge_rate, currency_of_commitment, project_id, project_name, original_principal_amount_us_, cancelled_amount_us_, undisbursed_amount_us_, disbursed_amount_us_, repaid_to_ida_us_, due_to_ida_us_, exchange_adjustment_us_, borrowers_obligation_us_, sold_3rd_party_us_, repaid_3rd_party_us_, due_3rd_party_us_, credits_held_us_, first_repayment_date, last_repayment_date, agreement_signing_date, board_approval_date, effective_date_most_recent, closed_date_most_recent, last_disbursement_date
	'1025074', '07/31/2015', 'IDA50650', 'AFRICA', 'MZ', 'Mozambique', 'Ministry of Economy and Finance', 'Fully Disbursed', '0.750000', 'XDR', 'P126226', 'Moz PRSC VIII', '110000000.000000', '0.000000', '0.000000', '108845619.000000', '0.000000', '99999990.000000', '0.000000', '99999990.000000', '0.000000', '0.000000', '0.000000', '99999990.000000', '09/01/2022', '03/01/2052', '03/26/2012', '03/15/2012', '05/07/2012', '12/31/2012', '05/25/2012'
*/
