use RealEstate
go

--  1-display the name of each owner and total number of houses he owns

select ownername ,count(*) as 'Num Of Houses Owned'
from owners o join houses h 
on o.ownerid = h.ownerid
group by ownername;

--  2-for each room display number of features in it.

select r.roomid , count(*) as 'Num Of Features on Room'
from roomfeatures  rf join features f on rf.featureid =f.featureid join rooms r on r.roomid =rf.roomid
group by r.roomid;

-- 3- for each division display number of houses in it.

select divisionname , count(*) as 'Num Of Houses '
from divisions d join houses h 
on d.divisionid =h.divisionid
group by divisionname;


-- 4-display the name of owner who has maximum number of houses

select top 1 with ties ownername , count(*) as 'Num Of Houses He Has'
from owners o join houses h 
on o.ownerid = h.ownerid
group by ownername
order by count(*) desc ;

-- 5-display the name of builder who build the maximum number of houses

select top 1 with ties buildername , count(*) as 'Num of Houses He Build'
from builders b join houses h 
on b.builderid=h.builderid
group by buildername
order by count(*) desc;

-- 6- Perform a report that display the House ID , name of its owner and the name of builder who build it.

select houseid , ownername , buildername 
from houses h join owners o on h.ownerid=o.ownerid join builders b on b.builderid = h.builderid;

-- 7- display the houseid that contains room which have two toilet

select h.houseid 
from houses h join rooms r on h.houseid =r.houseid
where roomtype='Toilet'
group by h.houseid
having count(roomtype)=2;

-- 8-display the owner address and owner name who have house contains three rooms.

select owneraddress , ownername , count(roomid) as 'Num Of Rooms'
from owners o join houses h on o.ownerid=h.ownerid join rooms r on h.houseid =r.houseid
group by owneraddress , ownername
having count(roomid)=3;


-- 9-display the builder ID who build houses in different three divisions

select b.builderid 
from builders b join houses h on b.builderid = h.builderid join divisions d on h.divisionid =d.divisionid
group by b.builderid
having count(distinct divisionname) =3;

-- display the owner name who have the house with the maximum number of rooms.

select top 1 with ties ownername 
from owners o join houses h on o.ownerid=h.ownerid join rooms r on r.houseid=h.houseid
group by ownername 
order by count(roomid) desc;

