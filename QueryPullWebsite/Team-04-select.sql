/* Mahala Wise, Stella Callahan, Cort Gerber, Ben Rooks*/
/* We also changed so of our data in the database thus we need to share it too when turning in else it will not run */

/*QUERY 01*/
/*Find the full name of all the tutors who teach on Monday*/
/*Some tutors teach muliple times on Monday*/
SELECT DISTINCT CONCAT(t.fname,' ',t.lname) AS fullname FROM tutor AS t
JOIN tutor_lesson AS tl ON t.id = tl.tutor_id
JOIN lesson AS l ON tl.lesson_id = l.id
WHERE l.days_taught = 'Monday';

/*QUERY 02*/
/*Find the full name students who play either piano or guitar and are taught by a female tutor.*/
SELECT DISTINCT CONCAT (s.fname, ' ', s.lname) AS Name
FROM student as s
    JOIN student_instrument AS si ON s.id = si.student_id
    JOIN payment_details AS pd ON s.id = pd.student_id
    JOIN tutor AS t ON pd.tutor_id=t.id
WHERE (si.instrument_type = "Piano" OR "Guitar") AND t.gender = "Female";

/*QUERY 03*/
/*Find the total number of lessons that take place in Rm 211 */
SELECT COUNT(*) AS total FROM lesson as l
JOIN location_details AS ld ON l.id = ld.lesson_id
JOIN lesson_location AS ll ON ld.location_id = ll.id
WHERE ll.location = 'RM 211';

/*QUERY 04*/ 
/*Find the sum of money that is payed to the store for those who only take classes and only uses credit and the total number of people using it.*/
SELECT SUM(pd.cost), COUNT(DISTINCT pd.student_id) as people AS paid FROM payment_details AS pd
WHERE pd.method = 'Check' AND pd.student_id NOT IN (SELECT DISTINCT s.id FROM student AS s JOIN instrument_details AS ind ON s.id=ind.student_id);

/*QUERY 05*/
/*Count the number of times each instrument has been used*/ 
SELECT si.instrument_type AS instrument, COUNT(*) AS Instrument_Count
FROM student_instrument AS si
JOIN tutor_instrument AS ti ON ti.instrument_type = si.instrument_type
GROUP BY instrument;