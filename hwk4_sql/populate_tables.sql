USE dbwa_whatever

INSERT INTO User
VALUES ("Simo", "Iliev", "C3", "CS", "user",
    "siliev@jacobs-university.de", "Bulgaria", 3792);

INSERT INTO User
VALUES ("Kiril", "Kafadarov", "C3", "CS", "admin",
    "kkafadarov@jacobs-university.de", "Bulgaria", 3793);

INSERT INTO User
VALUES ("Djonga", "Bohovich", "C3", "CS", "super",
    "dbohovich@jacobs-university.de", "Bulgaria", 3794);

INSERT INTO Regular
VALUES (3792);

INSERT INTO Admin
VALUES (3793);

INSERT INTO SuperAdmin
VALUES (3794);

INSERT INTO Bookables
VALUES (1, "MMR", TRUE, 300, FALSE, "dummy notes", "dummy policy");

INSERT INTO Bookables
VALUES (2, "Vacuum", TRUE, 90, TRUE, "dummy notes", "dummy policy");

INSERT INTO BookedBy
VALUES (1, 1, 3792, '20160301', "dummy type", FALSE);

INSERT INTO BookedBy
VALUES (2, 2, 3792, '20160301', "dummy type", FALSE);

INSERT INTO WaitingFor
VALUES (1, 3793, 2);

INSERT INTO ManagedBy
VALUES (1, 3794, 2);

INSERT INTO ManagedBy
VALUES (2, 3794, 1);
