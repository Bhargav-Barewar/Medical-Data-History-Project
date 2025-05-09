-- 1. Show first name, last name, and gender of patients whose gender is 'M
select first_name, last_name, gender from patients where gender='M';

-- 2. Show first name and last name of patients who do not have allergies.
select first_name, last_name from patients where allergies is null;

-- 3. Show first name of patients that start with the letter 'C'
select first_name from patients where first_name like 'C%';

-- 4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name from patients where weight between 100 and 120;

-- 5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
update patients set allergies = 'NKA' where allergies is null;

-- 6. Show first name and last name concatenated into one column to show their full name
select concat(first_name,' ',last_name) as full_name from patients;

-- 7. Show first name, last name, and the full province name of each patient.
select p.first_name, p.last_name, pn.province_name from patients p join province_names pn on p.province_id = pn.province_id;

-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select count(*) from patients where year(birth_date)=2010;
-- OR using like 
select count(*) as patients_count from patients where birth_date like "2010%";

-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height from patients order by height desc limit 1;
-- or using subquery
SELECT first_name, last_name, height FROM patients WHERE height = (SELECT MAX(height) FROM patients);

-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients where patient_id in (1,45,534,879,1000);
-- or using OR
SELECT * FROM patients WHERE patient_id = 1 OR patient_id = 45 OR patient_id = 534 OR patient_id = 879 OR patient_id = 1000;

-- 11. Show the total number of admissions
select count(*) as total_admisssions from admissions;

-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date = discharge_date;

-- 13. Show the total number of admissions for patient_id 579.
select count(*) as total_admissions_of_579 from admissions where patient_id = 579;

-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select distinct city from patients where province_id='NS';

-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date from patients where height>160 and weight>70;

-- 16. Show unique birth years from patients and order them by ascending.
select distinct year(birth_date) as unique_birth_year from patients order by unique_birth_year asc;

-- 17. Show unique first names from the patients table which only occurs once in the list.
select first_name from patients group by first_name having count(first_name)=1;

-- 18. Show patient_id and first_name from patients where their first_name starts and ends with 's' and is at least 6 characters long.
select patient_id, first_name from patients where first_name like "s%s" and length(first_name) >= 6;

-- 19. Show patient_id, first_name, last_name from patients whose diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.
select p.patient_id, p.first_name, p.last_name from patients p join admissions a on p.patient_id = a.patient_id where a.diagnosis ='Dementia';

-- 20. Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
select first_name from patients order by length(first_name) asc, first_name asc;

-- 21. Show the total number of male patients and the total number of female patients in the patients table. Display the two results in the same row.
select count(case when gender='M' then 1 end) as total_male, count(case when gender='F' then 1 end) as total_female from patients;

-- 22. (Same as 21)
select count(case when gender='M' then 1 end) as total_male, count(case when gender='F' then 1 end) as total_female from patients;

-- 23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
select patient_id, diagnosis from admissions group by patient_id, diagnosis having count(*) > 1;

-- 24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
select city, count(*) as total_patients from patients group by city order by total_patients desc, city asc;

-- 25. Show first name, last name and role of every person that is either patient or doctor.
select first_name, last_name , 'patients' as role from patients union select first_name, last_name, 'doctors' as role from doctors;

-- 26. Show all allergies ordered by popularity. Remove NULL values from the query.
select allergies, count(*) as popularity from patients where allergies is not null group by allergies order by popularity;
-- or without popularity column
select allergies from patients where allergies is not null group by allergies order by count(*);

-- 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade.
select first_name, last_name, birth_date from patients where year(birth_date) between 1970 and 1979 order by  birth_date asc;

-- 28. Display each patient's full name: LASTNAME (UPPER), firstname (lower)
select concat(upper(last_name),',',lower(first_name)) as full_name from patients order by first_name desc;

-- 29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
select province_id, sum(height) as height_sum from patients group by province_id having height_sum>=7000;

-- 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
select max(weight) as largest_weight, min(weight) as smallest_weight, max(weight) - min(weight) as diffrence from patients where last_name='Maroni';

-- 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day.
select day(admission_date) as day_of_month, count(admission_date) as occurred from admissions group by day_of_month order by occurred desc;

-- 32. Show all of the patients grouped into weight groups.
select floor(weight/10)*10 as weight_group, count(*) as total_patients from patients group by weight_group order by total_patients desc;

-- 33. Show patient_id, weight, height, isObese from the patients table.
select patient_id, weight, height, case when weight / ((height / 100.0) * (height / 100.0)) >= 30 then 1 else 0 end as isObese from patients;

-- 34. Show patient_id, first_name, last_name, and attending doctor's specialty for diagnosis 'Epilepsy' and doctor named 'Lisa'.
select p.patient_id, p.first_name, p.last_name, a.attending_doctor_id 
from patients p 
join admissions a on p.patient_id = a.patient_id 
join doctors d on a.attending_doctor_id = d.doctor_id 
where a.diagnosis='Epilepsy' and  d.first_name='Lisa';

-- 35. Show the patient_id and temp_password
select p.patient_id, concat(p.patient_id,'-', length(p.last_name),'-',year(p.birth_date)) as temp_password 
from patients p 
join admissions a on p.patient_id = a.patient_id 
group by  p.patient_id;

