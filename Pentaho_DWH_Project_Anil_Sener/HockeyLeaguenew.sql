CREATE DATABASE HOCKEYDB;
CONNECT TO HOCKEYDB USER db2inst1 USING db2inst1; 
-- Table: Fact_Scoring
DROP TABLE DB2INST1.Fact_Scoring;
CREATE TABLE DB2INST1.Fact_Scoring(
    personID varchar(10)  NOT NULL,
    YEAR integer  NOT NULL default 0,
    stint integer  NOT NULL,
    tmID char(3)  NOT NULL,
    R_or_P char(1)  NOT NULL,
    pos varchar(3)  NULL,
    GamesPlayed integer  NULL,
    Goals integer  NULL,
    Assists integer  NULL,
    Pts integer  NULL,
    PIM integer  NULL,
    Plus_or_Minus integer  NULL,
    PPG integer  NULL,
    PPA integer  NULL,
    SHG integer  NULL,
    SHA integer  NULL,
    GWG integer  NULL,
    GTG integer  NULL,
    Min integer  NULL,
    Wins integer  NULL,
    Losses integer  NULL,
    Ties_or_OL integer  NULL,
    ENG integer  NULL,
    SHO integer  NULL,
    GA integer  NULL,
    SA integer  NULL,
    Shootout_Shots integer  NULL,
    Shootout_Goals integer  NULL,
    Shootout_GDG integer  NULL,
    Shootout_Wins integer  NULL,
    Shootout_Losses integer  NULL,
    Shootout_SA integer  NULL,
    Shootout_GA integer  NULL,
    time_stamp timestamp  NOT NULL,
    record_source varchar(10)  NOT NULL,
    SOG integer  NULL,
    CONSTRAINT check_1_R_or_P CHECK (R_or_P in ('R','P')),
    CONSTRAINT Fact_Scoring_pk PRIMARY KEY (personID,YEAR,stint,tmID,R_or_P)
)
;
drop table DB2INST1.DIM_TEAMS;
-- Table: Dim_Teams
CREATE TABLE DB2INST1.DIM_TEAMS(
    tmID char(3)  NOT NULL,
    YEAR integer  NOT NULL default 0,
    name varchar(50)  NOT NULL,
    lgID varchar(4)  NOT NULL,
    franchID char(3)  NOT NULL,
    confID char(2)  NULL,
    divID char(2)  NULL,
    time_stamp timestamp  NOT NULL,
    record_source varchar(10)  NOT NULL,
    CONSTRAINT Dim_Teams_pk PRIMARY KEY (tmID,YEAR)
)
;
DROP TABLE DB2INST1.Dim_Person;
DROP TABLE DB2INST1.Dim_Date;
-- Table: Dim_Person
CREATE TABLE DB2INST1.Dim_Person(
    personID varchar(10)  NOT NULL,
    roleID integer  NOT NULL,
    firstName varchar(50)  NOT NULL,
    lastName varchar(50)  NOT NULL,
    nameNote varchar(30)  NULL,
    nameGiven varchar(30)  NULL,
    nameNick varchar(30)  NULL,
    height integer  NOT NULL,
    weight integer  NOT NULL,
    shootCatch char(1)  NULL,
    legendsID integer  NULL,
    ihdbID integer  NULL,
    hrefID integer  NULL,
    firstNHL integer  NULL,
    lastNHL integer  NULL,
    firstWHA integer  NULL,
    lastWHA integer  NULL,
    pos char(1)  NULL,
    birthDateID integer  NULL,
    deathDateID integer  NULL,
    BirthCityID integer  NULL,
    deathCityID integer  NULL,
    time_stamp timestamp  NOT NULL,
    record_source varchar(10)  NOT NULL,
    CONSTRAINT Dim_Person_pk PRIMARY KEY (personID)
)
;

CREATE TABLE DB2INST1.Dim_Date(
    dateID integer  NOT NULL,
    year integer  NOT NULL,
    month integer  NOT NULL,
    day integer  NOT NULL,
    time_stamp timestamp  NOT NULL,
    record_source varchar(10)  NOT NULL,
    CONSTRAINT Dim_Date_pk PRIMARY KEY (dateID)
)

;
DROP TABLE DB2INST1.Dim_City;
-- Table: Dim_City
CREATE TABLE DB2INST1.Dim_City(
    cityID integer  NOT NULL,
    cityName integer  NOT NULL,
    state varchar(50)  NULL,
    countryID integer  NOT NULL,
    time_stamp timestamp  NOT NULL,
    record_source varchar(10)  NOT NULL,
    CONSTRAINT Dim_City_pk PRIMARY KEY (cityID)
);

DROP TABLE DB2INST1.Dim_Country;
-- Table: Dim_City
CREATE TABLE DB2INST1.Dim_Country(
    countryID integer  NOT NULL,
    countryName integer  NOT NULL,
    CONSTRAINT Dim_City_pk PRIMARY KEY (countryID)
);
DROP TABLE DB2INST1.Dim_Role;
CREATE TABLE DB2INST1.Dim_Role(
    roleID integer  NOT NULL,
    isPlayer char(1)  NOT NULL,
    isCoach char(1)  NOT NULL,
    isHoF char(1)  NOT NULL,
    CONSTRAINT check_isPlayer CHECK (isPlayer in ('Y','N')),
    CONSTRAINT check_isCoach CHECK (isCoach in ('Y','N')),
    CONSTRAINT check_isHoF CHECK (isHoF in ('Y','N')),
 CONSTRAINT Dim_Role_pk PRIMARY KEY (roleID)
)
;
DROP TABLE DB2INST1.DIM_HOF;
CREATE TABLE DB2INST1.DIM_HOF(
    personID varchar(10)  NOT NULL,
    YEAR integer  NOT NULL,
    category varchar(20)  NOT NULL,
    time_stamp timestamp  NOT NULL,
    record_source varchar(10)  NOT NULL,
    CONSTRAINT DIM_HOF_pk PRIMARY KEY (personID,YEAR,category)
)
;
