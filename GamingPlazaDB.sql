CREATE DATABASE GamingPlazaDB;
USE GamingPlazaDB;


CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL
);


CREATE TABLE GameModes (
    ModeID INT PRIMARY KEY IDENTITY,
    ModeName NVARCHAR(100) NOT NULL
);


INSERT INTO GameModes (ModeName) VALUES ('Story Mode'), ('Online Mode');


CREATE TABLE Avatars (
    AvatarID INT PRIMARY KEY IDENTITY,
    AvatarName NVARCHAR(100) NOT NULL,
    ModeID INT FOREIGN KEY REFERENCES GameModes(ModeID),
    Damage INT DEFAULT 0,
    Healing INT DEFAULT 0,
    Defense INT DEFAULT 0
);


CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY IDENTITY,
    EquipmentName NVARCHAR(100) NOT NULL,
    AvatarID INT FOREIGN KEY REFERENCES Avatars(AvatarID),
    DamageEffect INT DEFAULT 0,
    HealingEffect INT DEFAULT 0,
    DefenseEffect INT DEFAULT 0
);


CREATE TABLE PowerUps (
    PowerUpID INT PRIMARY KEY IDENTITY,
    PowerUpName NVARCHAR(100) NOT NULL,
    DamageBoost INT DEFAULT 0,
    HealingBoost INT DEFAULT 0,
    DefenseBoost INT DEFAULT 0
);


CREATE TABLE UserSelections (
    SelectionID INT PRIMARY KEY IDENTITY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    ModeID INT FOREIGN KEY REFERENCES GameModes(ModeID),
    AvatarID INT FOREIGN KEY REFERENCES Avatars(AvatarID),
    EquipmentID INT FOREIGN KEY REFERENCES Equipment(EquipmentID),
    PowerUpID INT FOREIGN KEY REFERENCES PowerUps(PowerUpID),
    SelectionDate DATETIME DEFAULT GETDATE()
);

INSERT INTO Users (Email, PasswordHash) VALUES ('user@example.com', 'hashedpassword123');


SELECT * 
FROM Avatars 
WHERE ModeID = (SELECT ModeID FROM GameModes WHERE ModeName = 'Story Mode');