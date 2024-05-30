1. Selezionare tutti gli studenti nati nel 1990

SELECT * 
FROM `students` 
WHERE  YEAR(`date_of_birth`) = 1990 

/*-------------------------------------------------------*/
2. Selezionare tutti i corsi che valgono più di 10 crediti

SELECT * 
FROM `courses` 
WHERE `cfu` > 10

/*-------------------------------------------------------*/
3. Selezionare tutti gli studenti che hanno più di 30 anni 

SELECT * 
FROM `students` 
WHERE `date_of_birth` <= DATE_SUB(CURRENT_DATE(),INTERVAL 30 YEAR)

/*-------------------------------------------------------*/
4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
   laurea (286)

SELECT * 
FROM `courses` 
WHERE `year` = 1 AND `period` = "I semestre"

/*-------------------------------------------------------*/   
5. Selezionare tutti gli appelli d esame che avvengono nel pomeriggio (dopo le 14) del
   20/06/2020 (21)  

SELECT * 
FROM `exams` 
WHERE hour >= "14:00" 
AND `date` = "2020-06-20"

/*-------------------------------------------------------*/     
6. Selezionare tutti i corsi di laurea magistrale (38) 

SELECT * 
FROM `degrees` 
WHERE `level` = "magistrale"  

/*-------------------------------------------------------*/   
7. Daquanti dipartimenti è composta l università? (12)

SELECT COUNT(`id`) AS `departments_number`
FROM `departments` 

/*-------------------------------------------------------*/
8. Quanti sono gli insegnanti che non hanno un numero di telefono?

SELECT COUNT(`id`)
FROM `teachers` 
WHERE `phone` IS NULL

/*-------------------------------------------------------*/
9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo
   degree_id, inserire un valore casuale)

INSERT INTO `students` ( `degree_id`, `name`,  `surname`, `date_of_birth`, `fiscal_code`, `enrolment_date`, `registration_number`, `email`)
VALUES ("75", "Pippo", "Verdi", "1979-1-1", "AEGAYZ78P14C763V", "2020-1-1", "123456789", "pippo@verdi.com")   

/*-------------------------------------------------------*/
10. Cambiare il numero dell ufficio del professor Pietro Rizzo in 126

UPDATE `teachers`
SET `office_number` = 126
WHERE `name` = "Pietro" AND `surname` = "Rizzo"

/*-------------------------------------------------------*/
11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9

DELETE FROM `students`
WHERE `id` = 5001

/*-------------------------------------------------------*/
SELECT * 
FROM `students` 
ORDER BY `id`
LIMIT  5

/*-------------------------------------------------------*/
/*-------------------------------------------------------*/
/*QUERY - GROUP*/

1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`students`. `enrolment_date`) , COUNT(*)
FROM `students`
GROUP BY `students`.`enrolment_date`

/*-------------------------------------------------------*/

2. Contare gli insegnanti che hanno l ufficio nello stesso edificio

SELECT `teachers`.`office_address`, COUNT(*)
FROM `teachers` 
GROUP BY `teachers`.`office_address`

/*-------------------------------------------------------*/

3. Calcola La media dei voti di ogni appello d esame

SELECT `exam_student`.`exam_id`, AVG(`exam_student`.`vote`) AS`media_voto`
FROM `exam_student`
GROUP BY `exam_student`.`exam_id`

/*-------------------------------------------------------*/

4. Contare quanti corsi di laurea ci sono per ogni dipartimento

/*-------------------------------------------------------*/

/*-------------------------------------------------------*/
/*-------------------------------------------------------*/
/*QUERY - JOIN*/

1. Selezionare tutti gli studenti iscritti al corso di Laurea in Economia

SELECT * 
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia"

/*-------------------------------------------------------*/

2. Selezionare tutti i corsi di Laurea Magistrale del dipartimento di Neuroscienze

SELECT * 
FROM `degrees` 
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "magistrale"

/*-------------------------------------------------------*/

3. Selezionare tutti i corsi in cui insegna Fulvio Amato(id=44)

SELECT DISTINCT `teachers`.`id`, `teachers`.`name`, `courses`.`name` AS `Corsi Del Prof Amato`
FROM `teachers` 
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teachers`.`name` = "Fulvio" 
AND `surname` = "Amato"
