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

SELECT *
FROM User u
GROUP BY (u.userId IN(
      SELECT bb.userId
      FROM BookedBy bb  
    ));

SELECT *
FROM User u
GROUP BY (u.userId IN(
      SELECT r.userId
      FROM Regular r
    ));

SELECT * 
FROM User u
WHERE u.college = 'C3';

SELECT *
FROM Bookables b
ORDER BY b.maxBookTime ASC;

SELECT u.firstName, u.lastName
FROM User u
ORDER BY u.firstName, u.lastName ASC;

SELECT *
FROM Bookables b
WHERE b.requiresApproval = TRUE;

SELECT bb.bookableId
FROM BookedBy bb
ORDER BY bb.bookedUntil ASC

SELECT DISTINCT bp.bookableId
FROM User u, BookerProfile bp
WHERE (u.firstName = bp.firstName OR bp.firstName = NULL) AND
      (u.lastName = bp.lastName OR bp.lastName = NULL) AND
      (u.college = bp.college OR bp.college = NULL) AND
      (u.major = bp.major OR bp.major = NULL) AND
      (u.role = bp.role OR bp.role = NULL) AND
      (u.email = bp.email OR bp.email = NULL) AND
      (u.country = bp.country OR bp.country = NULL);
