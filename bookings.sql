USE company

-- ΠΛΗΘΟΣ ΜΕΛΩΝ ΠΟΥ ΠΡΑΓΜΑΤΟΠΟΙΗΣΑΝ ΚΡΑΤΗΣΗ ΤΟΝ ΙΟΥΛΙΟ 2012

select count(*) as count072012
from members
where joindate >= '2012-07-01' and joindate <= '2012-07-31';

-- ΠΛΗΘΟΣ ΚΡΑΤΗΣΕΩΝ ΑΝΑ ΜΕΛΟΣ

select distinct m.surname, m.firstname,
  ( select count(*)
    from bookings b
    where m.memid = b.memid
  ) as booikngs_count
from members m
where m.surname != 'GUEST'
order by m.surname asc;

-- ΚΡΑΤΗΣΕΙΣ ΜΕΛΩΝ ΜΕ ΤΚ 4321

select m.memid, m.address, count(b.slots) as slots
from members m 
join bookings b
on m.memid = b.memid
where m.zipcode = 4321
group by m.memid;

-- ΕΓΚΑΤΑΣΤΑΣΕΙΣ ΑΝΑΛΟΓΑ ΜΕ ΤΙΣ ΚΡΑΤΗΣΕΙΣ

select f.name, count(b.slots) as slots
from facilities f
join bookings b
on f.facid = b.facid
group by f.facid
order by slots desc;

-- Η 3η ΕΓΚΑΤΑΣΤΑΣΗ ΣΕ ΠΕΡΙΣΣΟΤΕΡΕΣ ΚΡΑΤΗΣΕΙΣ

select f.name, b.slots
from facilities f 
join bookings b
on f.facid = b.facid
order by b.slots desc
limit 1
offset 2;

-- ΜΕΛΗ ΠΟΥ ΠΡΑΓΜΑΤΟΠΟΙΗΣΑΝ ΤΟΥΛΑΧΙΣΤΟΝ ΔΥΟ ΔΙΑΦΟΡΕΤΙΚΕΣ ΚΡΑΤΗΣΕΙΣ

select distinct m.surname, m.firstname
from members m 
join bookings b 
on m.memid = b.memid
group by m.memid, m.surname, m.firstname
having count(distinct b.starttime) >= 2 and m.surname != 'GUEST';

-- ΣΥΝΟΛΙΚΑ ΕΣΟΔΑ ΤΩΝ ΕΓΚΑΤΑΣΤΑΣΕΩΝ ΑΠΟ ΤΑ ΜΕΛΗ ΤΟΥΣ

select f.name, sum(f.membercost) as total_income
from facilities f 
join bookings b 
on f.facid = b.facid
group by f.facid, f.name;
