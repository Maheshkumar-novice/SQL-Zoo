# 1

How many stops are in the database.


SELECT COUNT(*)
FROM stops;


# 2

Find the id value for the stop 'Craiglockhart'


SELECT id
FROM stops
WHERE name = 'craiglockhart';


# 3

Give the id and the name for the stops on the '4' 'LRT' service.


SELECT id, name
FROM stops
JOIN route ON id = stop
WHERE num = '4'
AND company = 'lrt';


# 4

The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.


SELECT company, num, COUNT(*)
FROM route
WHERE stop=149
OR stop=53
GROUP BY company, num
HAVING count(*) = 2;


# 5

Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.


SELECT a.company, a.num, a.stop, b.stop
FROM route AS a
JOIN route AS b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = (SELECT id
                FROM stops
                WHERE name = 'craiglockhart')
AND b.stop = (SELECT id
              FROM stops
              WHERE name = 'london road');


# 6

The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'


SELECT a.company, a.num, stopa.name, stopb.name
FROM route AS a
JOIN route AS b ON (a.company = b.company AND a.num = b.num)
JOIN stops AS stopa ON (a.stop = stopa.id)
JOIN stops AS stopb ON (b.stop = stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'London road';


# 7

Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')


SELECT DISTINCT a.company, a.num
FROM route AS a
JOIN route AS b ON a.num = b.num AND a.company = b.company
WHERE a.stop = 115
AND b.stop = 137;


# 8

Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'


SELECT a.company, a.num
FROM route AS a
JOIN route AS b ON a.num = b.num AND a.company = b.company
JOIN stops AS sa ON a.stop = sa.id
JOIN stops AS sb ON b.stop = sb.id
WHERE sa.name = 'craiglockhart'
AND sb.name = 'tollcross'


# 9

Give a distinct list of the stops which may be reached FROM 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.


SELECT sb.name, a.company, a.num
FROM route AS a
JOIN route AS b ON a.num = b.num AND a.company = b.company
JOIN stops AS sa ON a.stop = sa.id
JOIN stops AS sb ON b.stop = sb.id
WHERE sa.name = 'craiglockhart'


# 10

Find the routes involving two buses that can go FROM Craiglockhart to Lochend.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus.


SELECT bus1.num, bus1.company, middle_location.name, r1.num, r.company
FROM route AS bus1
JOIN route AS bus1_stops
ON bus1.num = bus1_stops.num AND bus1.company = bus1_stops.company
JOIN stops AS start_location
ON bus1.stop = start_location.id
JOIN stops AS middle_location
ON bus1_stops.stop = middle_location.id
JOIN route AS r
ON r.stop = middle_location.id
JOIN route AS r1
ON r.num = r1.num AND r.company = r1.company
                  AND r1.stop = (SELECT id
                                 FROM stops
                                 WHERE name = 'lochend')
JOIN stops AS s
ON s.id = r.stop
JOIN stops AS s1
ON s1.id = r1.stop
WHERE start_location.name = 'craiglockhart'
ORDER BY bus1.num, middle_location.name, r.num

