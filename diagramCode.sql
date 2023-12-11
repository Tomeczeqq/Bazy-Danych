-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-11 15:07:15.66

-- tables
-- Table: attendance
CREATE TABLE attendance (
    AttendanceID int  NOT NULL,
    EventStudentID int  NOT NULL,
    ModuleID int  NOT NULL,
    IsPresent bit  NOT NULL,
    CONSTRAINT attendance_pk PRIMARY KEY  (AttendanceID)
);

-- Table: employees
CREATE TABLE employees (
    EmployeeID int  NOT NULL,
    FirstName varchar  NOT NULL,
    LastName varchar  NOT NULL,
    Email varchar  NOT NULL,
    Role varchar  NOT NULL,
    BirthDate date  NOT NULL,
    HireDate date  NOT NULL,
    Address varchar  NOT NULL,
    City varchar  NOT NULL,
    Region varchar  NOT NULL,
    PostalCode varchar  NOT NULL,
    Country varchar  NOT NULL,
    Phone varchar  NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY  (EmployeeID)
);

-- Table: event_lecturers
CREATE TABLE event_lecturers (
    EventID int  NOT NULL,
    LecturerID int  NOT NULL,
    Description varchar  NOT NULL,
    CONSTRAINT event_lecturers_pk PRIMARY KEY  (EventID,LecturerID)
);

-- Table: event_students
CREATE TABLE event_students (
    EventStudentID int  NOT NULL,
    StudentID int  NOT NULL,
    EventID int  NOT NULL,
    IsPaidAdvance bit  NOT NULL,
    IsPaidFull bit  NOT NULL,
    CONSTRAINT event_students_pk PRIMARY KEY  (EventStudentID)
);

-- Table: events
CREATE TABLE events (
    EventID int  NOT NULL,
    Title varchar  NOT NULL,
    Type varchar  NOT NULL,
    BeginDate date  NOT NULL,
    EndDate date  NOT NULL,
    Capacity int  NOT NULL,
    EventPrice float  NOT NULL,
    Description text  NOT NULL,
    CONSTRAINT events_pk PRIMARY KEY  (EventID)
);

-- Table: exams
CREATE TABLE exams (
    ExamID int  NOT NULL,
    EventID int  NOT NULL,
    Description varchar  NOT NULL,
    CONSTRAINT exams_pk PRIMARY KEY  (ExamID)
);

-- Table: lecturers
CREATE TABLE lecturers (
    LecturerID int  NOT NULL,
    FirstName varchar  NOT NULL,
    LastName varchar  NOT NULL,
    Email varchar  NOT NULL,
    BirthDate date  NOT NULL,
    HireDate date  NOT NULL,
    Address varchar  NOT NULL,
    City varchar  NOT NULL,
    Region varchar  NOT NULL,
    PostalCode varchar  NOT NULL,
    Country varchar  NOT NULL,
    Phone varchar  NOT NULL,
    CONSTRAINT lecturers_pk PRIMARY KEY  (LecturerID)
);

-- Table: modules
CREATE TABLE modules (
    ModuleID int  NOT NULL,
    EventID int  NOT NULL,
    LecturerID int  NOT NULL,
    Language varchar  NOT NULL,
    TranslatorID int  NOT NULL,
    Description varchar  NOT NULL,
    BeginDate date  NOT NULL,
    EndDate date  NOT NULL,
    RoomID int  NOT NULL,
    ModulePrice int  NOT NULL,
    CONSTRAINT modules_pk PRIMARY KEY  (ModuleID)
);

-- Table: passing_exams
CREATE TABLE passing_exams (
    PassingExamID int  NOT NULL,
    ExamID int  NOT NULL,
    EventStudentID int  NOT NULL,
    CONSTRAINT passing_exams_pk PRIMARY KEY  (PassingExamID)
);

-- Table: passing_practices
CREATE TABLE passing_practices (
    PassingPracticeID int  NOT NULL,
    PracticeID int  NOT NULL,
    EventStudentID int  NOT NULL,
    IsPresent bit  NOT NULL,
    IsPassed bit  NOT NULL,
    CONSTRAINT passing_practices_pk PRIMARY KEY  (PassingPracticeID)
);

-- Table: practices
CREATE TABLE practices (
    PracticeID int  NOT NULL,
    EventID int  NOT NULL,
    PracticeNo int  NOT NULL,
    Description varchar  NOT NULL,
    BeginDate date  NOT NULL,
    EndDate date  NOT NULL,
    RoomID int  NOT NULL,
    CONSTRAINT practices_pk PRIMARY KEY  (PracticeID)
);

-- Table: rooms
CREATE TABLE rooms (
    RoomID int  NOT NULL,
    Name varchar  NOT NULL,
    Capacity int  NOT NULL,
    Availability bit  NOT NULL,
    Equipment varchar  NOT NULL,
    CONSTRAINT rooms_pk PRIMARY KEY  (RoomID)
);

-- Table: single_module_students
CREATE TABLE single_module_students (
    SingleModuleStudentID int  NOT NULL,
    ModuleID int  NOT NULL,
    StudentID int  NOT NULL,
    IsPaid bit  NOT NULL,
    IsPresent bit  NOT NULL,
    CONSTRAINT single_module_students_pk PRIMARY KEY  (SingleModuleStudentID)
);

-- Table: students
CREATE TABLE students (
    StudentID int  NOT NULL,
    FirstName varchar  NOT NULL,
    LastName varchar  NOT NULL,
    Email varchar  NOT NULL,
    BirthDate date  NOT NULL,
    Address varchar  NOT NULL,
    City varchar  NOT NULL,
    Region varchar  NOT NULL,
    PostalCode varchar  NOT NULL,
    Country varchar  NOT NULL,
    Phone varchar  NOT NULL,
    CONSTRAINT students_pk PRIMARY KEY  (StudentID)
);

-- Table: translators
CREATE TABLE translators (
    TranslatorID int  NOT NULL,
    FirstName varchar  NOT NULL,
    LastName varchar  NOT NULL,
    Email varchar  NOT NULL,
    CONSTRAINT translators_pk PRIMARY KEY  (TranslatorID)
);

-- foreign keys
-- Reference: attendance_event_students (table: attendance)
ALTER TABLE attendance ADD CONSTRAINT attendance_event_students
    FOREIGN KEY (EventStudentID)
    REFERENCES event_students (EventStudentID);

-- Reference: attendance_modules (table: attendance)
ALTER TABLE attendance ADD CONSTRAINT attendance_modules
    FOREIGN KEY (ModuleID)
    REFERENCES modules (ModuleID);

-- Reference: event_lecturers_events (table: event_lecturers)
ALTER TABLE event_lecturers ADD CONSTRAINT event_lecturers_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: event_lecturers_lecturers (table: event_lecturers)
ALTER TABLE event_lecturers ADD CONSTRAINT event_lecturers_lecturers
    FOREIGN KEY (LecturerID)
    REFERENCES lecturers (LecturerID);

-- Reference: event_students_events (table: event_students)
ALTER TABLE event_students ADD CONSTRAINT event_students_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: event_students_students (table: event_students)
ALTER TABLE event_students ADD CONSTRAINT event_students_students
    FOREIGN KEY (StudentID)
    REFERENCES students (StudentID);

-- Reference: exams_events (table: exams)
ALTER TABLE exams ADD CONSTRAINT exams_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: module_students_modules (table: single_module_students)
ALTER TABLE single_module_students ADD CONSTRAINT module_students_modules
    FOREIGN KEY (ModuleID)
    REFERENCES modules (ModuleID);

-- Reference: module_students_students (table: single_module_students)
ALTER TABLE single_module_students ADD CONSTRAINT module_students_students
    FOREIGN KEY (StudentID)
    REFERENCES students (StudentID);

-- Reference: modules_events (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: modules_lecturers (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_lecturers
    FOREIGN KEY (LecturerID)
    REFERENCES lecturers (LecturerID);

-- Reference: modules_rooms (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_rooms
    FOREIGN KEY (RoomID)
    REFERENCES rooms (RoomID);

-- Reference: modules_translators (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_translators
    FOREIGN KEY (TranslatorID)
    REFERENCES translators (TranslatorID);

-- Reference: passing_exams_event_students (table: passing_exams)
ALTER TABLE passing_exams ADD CONSTRAINT passing_exams_event_students
    FOREIGN KEY (EventStudentID)
    REFERENCES event_students (EventStudentID);

-- Reference: passing_exams_exams (table: passing_exams)
ALTER TABLE passing_exams ADD CONSTRAINT passing_exams_exams
    FOREIGN KEY (ExamID)
    REFERENCES exams (ExamID);

-- Reference: passing_practices_event_students (table: passing_practices)
ALTER TABLE passing_practices ADD CONSTRAINT passing_practices_event_students
    FOREIGN KEY (EventStudentID)
    REFERENCES event_students (EventStudentID);

-- Reference: passing_practices_practices (table: passing_practices)
ALTER TABLE passing_practices ADD CONSTRAINT passing_practices_practices
    FOREIGN KEY (PracticeID)
    REFERENCES practices (PracticeID);

-- Reference: practices_events (table: practices)
ALTER TABLE practices ADD CONSTRAINT practices_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: practices_rooms (table: practices)
ALTER TABLE practices ADD CONSTRAINT practices_rooms
    FOREIGN KEY (RoomID)
    REFERENCES rooms (RoomID);

-- End of file.

