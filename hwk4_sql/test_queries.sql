USE dbwa_whatever;

SELECT b.bookableId
FROM BookedBy bb, Bookables b
WHERE bb.bookableId = b.bookableId AND
      b.hasToBeReturned = TRUE;

SELECT u.userId, u.email, u.firstName, u.lastName
FROM User u, BookedBy bb
WHERE u.userId = bb.userId AND
      bb.bookableId = 1;

SELECT COUNT(wf.userId)
FROM WaitingFor wf
WHERE wf.bookableId = 2;

SELECT u.email
FROM ManagedBy mb, User u
WHERE mb.userId = u.userId AND
      mb.bookableId = 1;

SELECT u.college, SUM(tmp.cnt)
FROM User u, (SELECT uu.userId, COUNT(*) AS cnt
              FROM User uu, BookedBy bb
              WHERE uu.userId = bb.userId) AS tmp
WHERE u.userId = tmp.userId
GROUP BY u.college;

SELECT *
FROM User u
WHERE (u.userId NOT IN(
      SELECT r.userId
      FROM Regular r
    ));

SELECT *
FROM User u
WHERE u.college = 'C3';

SELECT *
FROM Bookables b
ORDER BY b.maxBookTime ASC;

Select u.firstName, u.lastName
FROM User u
ORDER BY u.firstName, u.lastName ASC;

SELECT *
FROM Bookables b
WHERE b.requiresApproval = TRUE;
