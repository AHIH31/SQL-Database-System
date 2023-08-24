CREATE DATABASE mileS2;

go
CREATE PROCEDURE createAllTables
AS
CREATE TABLE System_Users(
    username VARCHAR(20) UNIQUE,
    password VARCHAR(20),
    PRIMARY KEY(username)
)
Create TABLE Stadium(
    ID int IDENTITY,
    name VARCHAR(20),
    location VARCHAR(20),
    capacity int,
    status BIT,
    PRIMARY KEY(ID)
)
CREATE TABLE Stadium_Manager(
    ID int IDENTITY,
    name VARCHAR(20),
    stadium_ID int,
    username VARCHAR(20),
    PRIMARY KEY(ID),
    FOREIGN KEY(stadium_ID) REFERENCES Stadium,
    FOREIGN KEY(username) REFERENCES System_Users on delete cascade
)
CREATE TABLE Fan(
    national_ID varchar(20),
    name VARCHAR(20),
    birth_date datetime,
    address VARCHAR(20),
    phone_no INT,
    status BIT,
    username VARCHAR(20),
    PRIMARY KEY(national_ID),
    FOREIGN KEY(username) REFERENCES System_Users on delete cascade 
)
CREATE TABLE Club(
    ID int IDENTITY,
    name VARCHAR(20),
    location VARCHAR(20),
    PRIMARY KEY(ID)
)
CREATE TABLE Club_Representative(
    ID int IDENTITY,
    name VARCHAR(20),
    club_ID int,
    username VARCHAR(20),
    PRIMARY KEY(ID),
    FOREIGN KEY(club_ID) REFERENCES Club on delete no action on update no action,
    FOREIGN KEY(username) REFERENCES System_Users on delete cascade
)
CREATE TABLE Sports_Association_Manager(
    ID int IDENTITY,
    name VARCHAR(20),
    username VARCHAR(20),
    PRIMARY KEY(ID),
    FOREIGN KEY (username) REFERENCES System_Users on delete cascade
)
CREATE TABLE System_Admin(
    ID INT IDENTITY,
    name VARCHAR(20),
    username VARCHAR(20),
    PRIMARY KEY(ID),
    FOREIGN KEY(username) REFERENCES System_Users ON delete cascade
)
CREATE TABLE Match(
    match_ID int IDENTITY,
    start_time DATETIME,
    end_time DATETIME,
    host_club_ID int, 
    guest_club_ID int,
    stadium_ID int,
    PRIMARY KEY(match_ID), 
    FOREIGN KEY(host_club_ID) REFERENCES Club on delete no action on update no action,
    FOREIGN KEY(guest_club_ID) REFERENCES Club on delete no action on update no action,
    FOREIGN KEY(stadium_ID) REFERENCES Stadium on delete no action on update no action
)
CREATE TABLE Host_Request(
    ID int IDENTITY,
    representative_ID int,
    manager_ID int,
    match_ID int,
    status VARCHAR(20),
    PRIMARY KEY(ID),
    FOREIGN KEY(representative_ID) REFERENCES Club_Representative on delete no action on update no action,
    FOREIGN KEY(manager_ID) REFERENCES Stadium_Manager on delete no action on update no action,
    FOREIGN KEY(match_ID) REFERENCES Match on delete no action on update no action,
)

CREATE TABLE Ticket(
    ID int IDENTITY,
    status BIT,
    match_ID int
    PRIMARY KEY(ID),
    FOREIGN KEY(match_ID) REFERENCES Match on delete no action on update no action
)
CREATE TABLE Ticket_Buying_Transactions(
    fan_national_ID varchar(20),
    ticket_ID int,
    FOREIGN KEY(fan_national_ID) REFERENCES Fan on delete no action on update no action,
    FOREIGN KEY(ticket_ID) REFERENCES Ticket on delete cascade on update no action
)



EXEC createAllTables


go
create Procedure dropAllTables
AS
Drop table Ticket_Buying_Transactions
Drop table Ticket
Drop table Host_Request
Drop table Match
Drop table Club_Representative
Drop table Club
Drop table System_Admin
Drop table Sports_Association_Manager
Drop table Fan
Drop table Stadium_Manager
Drop table Stadium
Drop table System_Users
GO

--------------------------------Views-----------------------------
go
CREATE VIEW allAssocManagers AS 
SELECT sam.username, su.password, sam.name
FROM System_Users su, Sports_Association_Manager sam
WHERE sam.username = su.username;
go
go
CREATE VIEW allClubRepresentatives AS
SELECT su.username, su.password, cr.name, c.name club_name
FROM Club_Representative cr INNER JOIN System_Users su ON su.username = cr.username INNER JOIN CLub c ON c.ID = cr.Club_ID
go
go
CREATE VIEW allStadiumManagers AS
SELECT sm.username, su.password, sm.name, s.name as stadium
FROM System_Users su, Stadium_Manager sm, Stadium s
WHERE su.username = sm.username AND sm.stadium_ID = s.ID
go
go
CREATE FUNCTION getFanStatus(@status BIT)
RETURNS VARCHAR(20)
AS
BEGIN
IF(@status=1)
BEGIN
RETURN 'unblocked'
END
RETURN 'blocked'
END
go
CREATE VIEW allFans AS
SELECT f.username, su.password,f.national_ID, f.name, f.birth_date, dbo.getFanStatus(f.status) as status
FROM Fan f INNER JOIN System_Users su ON su.username = f.username;
go
CREATE VIEW allMatches AS
SELECT c1.name as host , c2.name as guest, m.start_time
FROM Match m INNER JOIN Club c1 ON m.host_club_id=c1.ID 
INNER JOIN Club c2 ON m.guest_club_ID = c2.ID
go
CREATE VIEW allTickets AS
SELECT c1.name as host, c2.name as guest, s.name as stadium, m.start_time
from match m INNER JOIN ticket t on t.match_ID = m.match_ID INNER JOIN club c1 on c1.ID = m.host_club_ID INNER JOIN club c2 on c2.ID = m.guest_club_ID INNER JOIN stadium s on s.ID = m.stadium_ID
go
CREATE VIEW allClubs
AS
SELECT name, location
FROM Club
go
CREATE FUNCTION getStadiumStatus(@status BIT) RETURNS VARCHAR(20)
AS
BEGIN
IF(@status=1)
BEGIN
RETURN 'available'
END
RETURN 'unavailable'
END
go
CREATE VIEW allStadiums
AS
SELECT s.name, s.location, s.capacity, dbo.getStadiumStatus(S.status) as status
FROM Stadium s;
go
CREATE VIEW allRequests AS
SELECT cr.username Club_Representative_Username , sm.username AS Stadium_Manager_Username, hr.status
FROM Club_Representative cr INNER JOIN Host_Request hr ON cr.ID = hr.representative_ID INNER JOIN Stadium_Manager sm ON sm.ID = hr.manager_ID
go
--------------------------Procedures----------------------------------
CREATE PROCEDURE addAssociationManager
@name VARCHAR(20), @username VARCHAR(20), @password VARCHAR(20)
AS
INSERT INTO System_Users VALUES(@username,@password)
INSERT INTO Sports_Association_Manager VALUES(@name,@username)
go
CREATE FUNCTION getClubID(@name VARCHAR(20))
RETURNS INT
AS
BEGIN
DECLARE @ID INT SELECT @ID = c.ID FROM club c WHERE c.name = @name
RETURN @ID
END
go
CREATE PROCEDURE addNewMatch
@host VARCHAR(20), @guest VARCHAR(20), @start DATETIME, @end DATETIME
AS
INSERT INTO Match(host_club_ID,guest_club_ID,start_time,end_time) VALUES(dbo.getClubID(@host),dbo.getClubID(@guest),@start,@end)
go
CREATE PROCEDURE clubsWithNoMatches
AS
(SELECT c1.name FROM match m RIGHT OUTER JOIN club c1 ON m.host_club_ID = c1.ID
WHERE m.host_club_ID IS NULL)
INTERSECT(
SELECT c2.name FROM match m1 RIGHT OUTER JOIN club c2 ON m1.guest_club_ID = c2.ID
WHERE m1.guest_club_ID IS NULL)

go
CREATE FUNCTION getMatchID(@host VARCHAR(20), @guest VARCHAR(20))
RETURNS INT
AS
BEGIN
DECLARE @ID INT SELECT @ID = m.match_ID FROM match m WHERE m.host_club_ID = dbo.getClubID(@host) AND m.guest_club_ID = dbo.getClubID(@guest)
RETURN @ID
END
go
go
CREATE PROCEDURE deleteMatch 
@host VARCHAR(20),
@guest VARCHAR(20)
AS
BEGIN
DELETE FROM ticket WHERE match_ID = dbo.getMatchID(@host,@guest)
DELETE FROM match WHERE host_club_ID = dbo.getClubID(@host) AND guest_club_ID = dbo.getClubID(@guest)
DELETE FROM Host_Request WHERE match_ID = dbo.getMatchID(@host,@guest)
END
go
CREATE FUNCTION getStadiumID(@name VARCHAR(20))
RETURNS INT
AS
BEGIN
DECLARE @ID INT SELECT @ID = ID FROM stadium WHERE name = @name
RETURN @ID
END
go

CREATE PROCEDURE deleteMatchesOnStadium
@stadium VARCHAR(20)
AS
BEGIN
DELETE FROM ticket WHERE match_ID = ANY(
    SELECT ID FROM match m WHERE m.stadium_ID = dbo.getStadiumID(@stadium) AND m.start_time > CURRENT_TIMESTAMP
)
DELETE FROM match WHERE start_time > CURRENT_TIMESTAMP AND stadium_ID = dbo.getStadiumID(@stadium)
DELETE FROM Host_Request WHERE match_ID = ANY(
    SELECT ID FROM match m WHERE m.stadium_ID = dbo.getStadiumID(@stadium) AND m.start_time > CURRENT_TIMESTAMP
)
END

go
create procedure addClub @cn varchar(20), @cl varchar(20)
AS
insert into club(name, location) values(@cn,@cl)

drop proc addClub
select * from Club
go


CREATE PROCEDURE addStadium
@name VARCHAR(20), @location VARCHAR(20),@capacity INT
AS
INSERT INTO Stadium (name,location,capacity,status) VALUES (@name,@location,@capacity,1)

drop proc addStadium


go
CREATE FUNCTION getMatchID2(@host VARCHAR(20), @guest VARCHAR(20), @start DATETIME)
RETURNS INT
AS
BEGIN
DECLARE @ID INT SELECT @ID = m.match_ID FROM match m WHERE m.host_club_ID = dbo.getClubID(@host) AND m.guest_club_ID = dbo.getClubID(@guest) AND m.start_time = @start
RETURN @ID
END
go


CREATE PROCEDURE addTicket
@host VARCHAR(20), @guest VARCHAR(20), @start DATETIME
AS 
BEGIN
INSERT INTO Ticket (status,match_ID) VAlUES(1,dbo.getMatchID2(@host,@guest,@start))
END

go
CREATE FUNCTION getMatchIDFromName(@name VARCHAR(20))
RETURNS TABLE
AS
RETURN (SELECT match_ID FROM match WHERE dbo.getClubID(@name) = host_club_ID OR dbo.getClubID(@name) = guest_club_ID)


go
CREATE PROCEDURE deleteClub 
@name varchar(20)
AS
BEGIN
DELETE FROM Host_Request WHERE match_ID = ANY(select * from getMatchIDFromName(@name))
DELETE FROM Ticket WHERE match_ID = ANY(select * from getMatchIDFromName(@name))
DELETE FROM Club_Representative WHERE club_ID = dbo.getClubID(@name)
DELETE FROM Match WHERE host_club_ID = dbo.getClubID(@name) OR guest_club_ID = dbo.getClubID(@name)
DELETE FROM club WHERE name = @name
END


go
CREATE PROCEDURE deleteStadium 
@name VARCHAR(20)
AS
BEGIN
DELETE FROM Host_Request WHERE match_ID = ANY(
    SELECT match_ID FROM match WHERE stadium_ID = dbo.getStadiumID(@name)
)
DELETE FROM Ticket WHERE match_ID = ANY(
    SELECT match_ID FROM match WHERE stadium_ID = dbo.getStadiumID(@name)
)
DELETE FROM Stadium_Manager WHERE stadium_ID = dbo.getStadiumID(@name)
DELETE FROM Match WHERE stadium_ID = dbo.getStadiumID(@name)
DELETE FROM Stadium WHERE name = @name
END


go
CREATE PROCEDURE blockFan 
@nationalID VARCHAR(20)
AS
UPDATE fan  SET status = 0 WHERE national_ID = @nationalID

go
CREATE PROCEDURE unblockFan 
@nationalID VARCHAR(20)
AS
UPDATE fan  SET status = 1 WHERE national_ID = @nationalID


go
CREATE PROCEDURE addRepresentative
@name VARCHAR(20), @club_name VARCHAR(20), @username VARCHAR(20), @password VARCHAR(20)
AS
BEGIN
INSERT INTO System_Users VALUES(@username,@password)
INSERT INTO Club_Representative(name,club_ID,username) VALUES(@name,dbo.getClubID(@club_name),@username)
END



go
CREATE FUNCTION getAvailableStadiumsIDs(@date datetime)
RETURNS TABLE
AS
RETURN SELECT s.ID FROM stadium s EXCEPT(
    SELECT m.stadium_ID FROM match m WHERE CAST(m.start_time as DATE) = CAST(@date as DATE))


go
CREATE FUNCTION viewAvailableStadiumsOn(@date datetime)
RETURNS TABLE
AS
RETURN SELECT s.name,s.location,s.capacity FROM stadium s, dbo.getAvailableStadiumsIDs(@date) t
WHERE s.ID = t.ID AND s.status = 1


go
CREATE PROCEDURE addFan
@name VARCHAR(20), @username VARCHAR(20), @password VARCHAR(20), @nationalID VARCHAR(20), @birthDate DATETIME, @address VARCHAR(20), @phone INT
AS
INSERT INTO System_Users VALUES(@username,@password)
INSERT INTO Fan VALUES(@nationalID,@name,@birthDate,@address,@phone,1,@username)


go
CREATE FUNCTION upcomingMatchesOfClub(@name VARCHAR(20))
RETURNS TABLE
AS 
RETURN SELECT c1.name as Team1, c2.name as Team2, m.start_time, s.name FROM match m, club c1, club c2, stadium s
WHERE m.host_club_ID = c1.ID AND m.guest_club_ID = c2.ID AND m.stadium_ID = s.ID AND start_time > CURRENT_TIMESTAMP AND (c1.name = @name OR c2.name = @name)
go

SELECT * from upcomingMatchesOfClub('Ahly')


go
CREATE PROCEDURE purchaseTicket
@nationalID VARCHAR(20),@host VARCHAR(20), @guest VARCHAR(20), @start DATETIME
AS
DECLARE @fanStatus BIT SELECT @fanStatus = status FROM Fan WHERE national_ID = @nationalID 
DECLARE @ID INT SELECT @ID = m.match_ID FROM match m WHERE dbo.getClubID(@host) = host_club_ID AND dbo.getClubID(@guest) = guest_club_ID AND start_time = @start
DECLARE @ticket INT SELECT @ticket = min(ID) FROM Ticket t,match m WHERE status = 1 AND t.match_ID = @ID
IF(@fanStatus = 1)
BEGIN
UPDATE Ticket SET status = 0 WHERE ID = @ticket
INSERT INTO Ticket_Buying_Transactions VALUES(@nationalID,@ticket)
END
go

go
create procedure addStadiumManager 
@stadiumManagerName varchar(20), @stadiumName varchar(20), @username varchar(20), @password varchar(20)
AS
insert into System_Users(username, password) values (@username, @password)
insert into Stadium_Manager (name, stadium_ID, username) 
values (@stadiumManagerName, dbo.getStadiumID(@stadiumName), @username)


go
CREATE FUNCTION allPendingRequests(@username varchar(20))
RETURNS TABLE
AS
RETURN SELECT DISTINCT cr.name as club_rep, c.name as guest_club_name, m.start_time FROM Host_Request hr, Club_Representative cr, club c,match m,club c1, Stadium_Manager sm
WHERE hr.representative_ID = cr.ID AND c.ID = m.guest_club_ID AND c1.ID = m.host_club_ID AND c1.ID = cr.club_ID AND sm.username = @username


go
CREATE PROCEDURE addHostRequest
@cn VARCHAR(20), @sn VARCHAR(20), @start DATETIME
AS
DECLARE @repID INT SELECT @repID = ID FROM Club_Representative WHERE dbo.getClubID(@cn) = club_ID
DECLARE @manID INT SELECT @manID = ID FROM Stadium_Manager WHERE dbo.getStadiumID(@sn) = stadium_ID
DECLARE @matchID INT SELECT @matchID = match_ID FROM match WHERE start_time = @start AND (host_club_ID = dbo.getClubID(@cn) OR guest_club_ID = dbo.getClubID(@cn))
INSERT INTO Host_Request(representative_ID,manager_ID,match_ID,status) VALUES(@repID,@manID,@matchID,'unhandled')


go
create procedure acceptRequest 
@smun varchar(20), @hcn varchar(20), @gcn varchar(20),@st DATETIME
AS
UPDATE Host_Request
SET status = 'accepted'
FROM Host_Request hr inner join Stadium_Manager sm on hr.manager_ID = sm.ID
where sm.username = @smun
update match 
SET stadium_ID = (SELECT stadium_ID from Stadium_Manager where username = @smun)
where host_club_ID = (select ID from club where name = @hcn) 
and guest_club_ID = (select ID from club where name = @gcn)
and start_time = @st
DECLARE @temp INT SELECT @temp = capacity FROM Stadium WHERE stadium_ID = (SELECT stadium_ID from Stadium_Manager where username = @smun)
WHILE @temp > 0
BEGIN
SET @temp = @temp - 1
END


go
create procedure rejectRequest 
@smun varchar(20), @hcn varchar(20), @gcn varchar(20),@st DATETIME
AS
UPDATE Host_Request
SET status = 'rejected'
FROM Host_Request hr inner join Stadium_Manager sm on hr.manager_ID = sm.ID
where sm.username = @smun


go
create function availableMatchesToAttend(@time DATETIME)
returns table
AS
return select DISTINCT c.name as HostClubName, c1.name as GuestClubName,m.start_time as StartTime, s.name as StadiumName
from match m inner join club c  on c.ID = m.host_club_ID
inner join club c1 on c1.ID = m.guest_club_ID 
inner join stadium s on m.stadium_ID = s.ID
inner join ticket t on t.match_ID = m.match_ID 
where t.status = 1 and c.ID <> c1.ID and m.start_time >= @time


go
create procedure updateMatchTiming @hcn varchar(20),
@gcn varchar(20), @cst DATETIME, @nst DATETIME, @net DATETIME
AS
update match 
set start_time = @nst , end_time = @net
where host_club_ID = (select ID from club where name = @hcn) and guest_club_ID = (select ID from club where name = @gcn)


go
create view matchesPerTeam 
AS
select c.name as ClubName, count(end_time) as NumberOfMatchesPlayed from club c inner join match m
on (c.ID = m.host_club_ID OR c.ID = m.guest_club_ID)
where m.end_time < current_timestamp
group by c.name 


go
create procedure deleteMatchesOn @day DATETIME
AS
delete hr from Host_Request hr inner join match m on hr.match_ID = m.match_ID
where day(m.start_time) = day(@day)
delete t from Ticket t inner join match m on t.match_ID = m.match_ID
where day(m.start_time) = day(@day)
delete from match 
where day(start_time) = day(@day)
go


go
create view matchWithMostSoldTickets 
AS
select c1.name as HostClub, c2.name as GuestClub 
from club c1 inner join match m on c1.ID = m.guest_club_ID 
inner join club c2 on m.host_club_ID = c2.ID 
inner join Ticket t on t.match_ID = m.match_ID
where t.status = 0 
group by c1.name, c2.name
having count(*) = (select max(haysom) 
from (select count(*) as haysom 
from club c3 inner join match m1 on c3.ID = m1.guest_club_ID 
inner join club c4 on m1.host_club_ID = c4.ID 
inner join Ticket t1 on t1.match_ID = m1.match_ID
where t1.status = 0 
group by c3.name, c4.name)as Q)


go
create function stadiumsNeverPlayedOn (@cn varchar(20))
returns table
AS
return select s.name, s.capacity 
from stadium s
where s.ID not in (select s1.ID from stadium s1 
inner join  match m1 on s1.ID = m1.stadium_ID
where dbo.getClubID(@cn) = m1.host_club_ID or dbo.getClubID(@cn) = m1.guest_club_ID)
go


go
create function allUnassignedMatches (@cn varchar(20))
returns table 
AS
return select DISTINCT c.name as GuestClub, m.start_time as StartTime
from club c inner join match m on c.ID = m.guest_club_ID
inner join club c1 on c1.ID = m.host_club_ID
where m.stadium_ID is NULL and  m.host_club_ID = dbo.getClubID(@cn)

go
create view matchesRankedBySoldTickets
AS
select c1.club_name AS HostClub, c2.club_name AS GuestClub 
from club c1 inner join matchh m on c1.club_ID = m.guest_club_ID 
inner join club c2 on m.host_club_ID = c2.club_ID 
inner join ticket t on t.match_ID = m.match_ID
where t.ticket_status = 0 
group by c1.club_name, c2.club_name
having count() = (select count() AS haysom 
from club c3 inner join matchh m1 on c3.club_ID = m1.guest_club_ID 
inner join club c4 on m1.host_club_ID = c4.club_ID 
inner join ticket t1 on t1.match_ID = m1.match_ID
where t1.ticket_status = 0 
group by c3.club_name, c4.club_name)
go
  
go
create procedure clubWithTheMostSoldTickets
AS

select TOP 1 Club.name, count(*) as TicketCount from Ticket, Match, Club WHERE Ticket.match_ID = Match.match_ID AND (Club.id = Match.host_club_ID or Club.id = Match.guest_club_ID) 
AND Match.end_time < CURRENT_TIMESTAMP AND Ticket.status = 0
GROUP BY Club.name ORDER BY TicketCount desc

go
create view clubsRankedBySoldTickets
AS
select Club.name, count(*) as TicketCount from Ticket, Match, Club WHERE Ticket.match_ID = Match.match_ID AND (Club.id = Match.host_club_ID or Club.id = Match.guest_club_ID) 
AND Match.end_time < CURRENT_TIMESTAMP AND Ticket.status = 0
GROUP BY Club.name ORDER BY TicketCount desc
go

create function stadiumsNeverPlayedOn (@cn varchar(20))
returns table
AS
return select s.name, s.capacity 
from stadium s
where s.ID not in (select s1.ID from stadium s1 
inner join  match m1 on s1.ID = m1.stadium_ID 
where dbo.getClubID(@cn) = m1.host_club_ID or dbo.getClubID(@cn) = m1.guest_club_ID)

