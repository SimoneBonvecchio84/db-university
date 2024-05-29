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
6. Selezionare tutti i corsi di laurea magistrale (38)    
7. Daquanti dipartimenti è composta l università? (12)

