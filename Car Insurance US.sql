use insurancecar

-- Η 2η ΠΟΛΙΤΕΙΑ ΜΕ ΤΟ ΜΕΓΑΛΥΤΕΡΟ ΚΟΣΤΟΣ ΜΙΚΤΗΣ ΑΣΦΑΛΙΣΗΣ

select state, full_coverage
from insurance
order by full_coverage desc
limit 1
offset 1;

-- Η 2η ΜΙΚΡΟΤΕΡΗ ΔΙΑΦΟΡΑ ΑΣΦΑΛΙΣΗΣ ΜΕΤΑΞΥ ΜΙΚΤΗΣ ΚΑΙ ΒΑΣΙΚΗΣ 

select min(difference) as min_dif
from insurance
where difference not in
(
  select min(difference)
  from insurance
);

-- ΟΙ 5 ΠΡΩΤΕΣ ΠΟΛΙΤΕΙΕΣ ΠΟΥ ΕΧΟΥΝ ΜΙΚΤΗ ΑΣΦΑΛΙΣΗ ΠΑΝΩ ΑΠΟ 1000 ΚΟΣΤΟΣ

select state, full_coverage
from insurance
where full_coverage > 1000
order by full_coverage desc
limit 5;



