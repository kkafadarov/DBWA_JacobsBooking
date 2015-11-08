USE dbwa_whatever

CREATE TABLE User
( firstName CHAR(20),
  lastName   CHAR(20),
  college       CHAR(20),
  major         CHAR(20),
  role            CHAR(20),
  email         CHAR(50),
  country      CHAR(30),
  userId        INTEGER,
  PRIMARY KEY(userId)
);

CREATE TABLE Regular
( userId INTEGER,
  PRIMARY KEY(userId),
  FOREIGN KEY(userId) REFERENCES User
);

CREATE TABLE Admin
( userId INTEGER,
  PRIMARY KEY(userId),
  FOREIGN KEY(userId) REFERENCES User
);

CREATE TABLE SuperAdmin
( userId INTEGER,
  PRIMARY KEY(userId),
  FOREIGN KEY(userId) REFERENCES User
);

CREATE TABLE Bookables
( bookableId INTEGER,
  name CHAR(20),
  requiresApproval BOOLEAN,
  maxBookTime INTEGER,
  hasToBeReturned BOOLEAN,
  notes CHAR(200),
  damagePolicy CHAR(200),
  PRIMARY KEY(bookableId)
);

CREATE TABLE Utensils
( bookableId INTEGER,
  returnedClean BOOLEAN,
  PRIMARY KEY(bookableId),
  FOREIGN  KEY(bookableId) REFERENCES Bookables
);
CREATE TABLE Rooms
( bookableId INTEGER,
  keyNumber INTEGER,
  keyName     CHAR(20),
  PRIMARY KEY(bookableId),
  FOREIGN  KEY(bookableId) REFERENCES Bookables
);

CREATE TABLE Tools
( bookableId INTEGER,
  itemsInSet INTEGER,
  PRIMARY KEY(bookableId),
  FOREIGN  KEY(bookableId) REFERENCES Bookables
);

CREATE TABLE Multimedia
( bookableId INTEGER,
  techInstructions CHAR(200),
  PRIMARY KEY(bookableId),
  FOREIGN  KEY(bookableId) REFERENCES Bookables
);

CREATE TABLE VacuumCleaner
( bookableId INTEGER,
  college CHAR(20),
  PRIMARY KEY(bookableId),
  FOREIGN  KEY(bookableId) REFERENCES Bookables
);

CREATE TABLE Residence
( residenceId INTEGER,
  address CHAR(200),
  PRIMARY KEY(residenceId)
);

CREATE TABLE College
( residenceId INTEGER,
  name CHAR(20),
  maxOccupants INTEGER,
  PRIMARY KEY(residenceId),
  FOREIGN KEY(residenceId) REFERENCES Residence
);

CREATE TABLE OffCampus
( residenceId INTEGER,
  timeToCampus INTEGER,
  distance INTEGER,
  PRIMARY KEY(residenceId),
  FOREIGN KEY(residenceId) REFERENCES Residence
);


CREATE TABLE LivesIn
( userId INTEGER,
   residenceId INTEGER,
   PRIMARY KEY(userId),
   FOREIGN KEY(userId) REFERENCES User,
   FOREIGN KEY(residenceId) REFERENCES Residence
);

CREATE TABLE WaitingFor
( waitingForId INTEGER,
   userId INTEGER,
   bookableId INTEGER,
   PRIMARY KEY(waitingForId),
   FOREIGN KEY(userId) REFERENCES User,
   FOREIGN KEY(bookableId) REFERENCES Bookables
);

CREATE TABLE ManagedBy
( managedByID INTEGER,
  userId INTEGER,
  bookableId INTEGER,
  PRIMARY KEY(managedByID),
  FOREIGN KEY(userId) REFERENCES User,
  FOREIGN KEY(bookableId) REFERENCES Bookables
);

CREATE TABLE BookedBy
( bookedById INTEGER,
   bookableId INTEGER,
   userId INTEGER,
   bookedUntil DATE,
   typeOfBookable CHAR(20),
   autoRemove BOOLEAN,
   PRIMARY KEY(bookedById),
   FOREIGN KEY(bookableId) REFERENCES Bookables,
   FOREIGN KEY(userId) REFERENCES User,
   UNIQUE(bookableId)
);

CREATE TABLE ReminderBy
( reminderId INTEGER,
  bookedById INTEGER,
  nextRemindDate DATE,
  numberOfReminds INTEGER,
  PRIMARY KEY(reminderId),
  FOREIGN KEY(bookedById) REFERENCES BookedBy
);


CREATE TABLE BookerProfile
( firstName CHAR(50),
  lastName  CHAR(50),
  college      CHAR(20),
  role           CHAR(20),
  major        CHAR(20),
  email        CHAR(50),
  country     CHAR(30),
  userId       INTEGER,
  userType  CHAR(20),
  bookableId INTEGER,
  bookerProfileId INTEGER,
  PRIMARY KEY(bookerProfileId),
  FOREIGN KEY(bookableId) REFERENCES Bookables
);
