USE company

-- ΠΛΗΘΟΣ ΜΕΛΩΝ ΠΟΥ ΗΡΘΑΝ ΤΟΝ ΙΟΥΛΙΟ 2012

select count(*) as count072012
from members
where joindate >= '2012-07-01' and joindate <= '2012-07-31';

-- ΠΛΗΘΟΣ ΚΡΑΤΗΣΕΩΝ ΑΝΑ ΜΕΛΟΣ

select m.surname, m.firstname,
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

-- ΠΟΣΟΣΤΟ ΜΕΣΟΥ ΟΡΟΥ ΚΡΑΤΗΣΕΩΝ ΣΕ ΚΑΘΕ ΕΓΚΑΤΑΣΤΑΣΗ ΣΕ ΣΧΕΣΗ ΜΕ ΤΟ ΚΟΣΤΟΣ

select f.name, f.membercost, f.guestcost, (avg(b.slots)/count(b.slots))*100 as slots
from facilities f
join bookings b
on f.facid = b.facid
group by f.facid
order by slots desc;



