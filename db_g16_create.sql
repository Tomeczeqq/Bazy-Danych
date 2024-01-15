-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-01-13 15:50:28.893

-- tables
-- Table: attendance
CREATE TABLE attendance (
    AttendanceID int  NOT NULL IDENTITY,
    EventStudentID int  NOT NULL,
    ModuleID int  NOT NULL,
    IsPresent bit  NULL,
    CONSTRAINT attendance_pk PRIMARY KEY  (AttendanceID)
);

-- Table: countries
CREATE TABLE countries (
    CountryID int  NOT NULL IDENTITY,
    CountryName varchar(30)  NOT NULL,
    IsActive bit  NOT NULL,
    CONSTRAINT countries_pk PRIMARY KEY  (CountryID)
);

-- Table: employees
CREATE TABLE employees (
    EmployeeID int  NOT NULL IDENTITY,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    Email varchar(30)  NOT NULL,
    Role varchar(30)  NOT NULL,
    BirthDate date  NOT NULL,
    HireDate date  NOT NULL,
    Address varchar(30)  NOT NULL,
    City varchar(30)  NOT NULL,
    Region varchar(30)  NULL,
    PostalCode varchar(30)  NOT NULL,
    CountryID int  NOT NULL,
    Phone varchar(30)  NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY  (EmployeeID)
);

-- Table: event_lecturers
CREATE TABLE event_lecturers (
    EventID int  NOT NULL,
    LecturerID int  NOT NULL,
    Description varchar(30)  NOT NULL,
    CONSTRAINT event_lecturers_pk PRIMARY KEY  (EventID,LecturerID)
);

-- Table: event_students
CREATE TABLE event_students (
    EventStudentID int  NOT NULL IDENTITY,
    StudentID int  NOT NULL,
    EventID int  NOT NULL,
    IsPaidAdvance bit  NOT NULL,
    IsPaidFull bit  NOT NULL,
    CONSTRAINT event_students_pk PRIMARY KEY  (EventStudentID)
);

-- Table: events
CREATE TABLE events (
    EventID int  NOT NULL IDENTITY,
    Title varchar(30)  NOT NULL,
    TypeID int  NOT NULL,
    BeginDate date  NOT NULL,
    EndDate date  NOT NULL,
    Capacity int  NOT NULL,
    EventPrice decimal(10,2)  NOT NULL,
    Description varchar(30)  NOT NULL,
    CONSTRAINT events_pk PRIMARY KEY  (EventID)
);

-- Table: exams
CREATE TABLE exams (
    ExamID int  NOT NULL IDENTITY,
    EventID int  NOT NULL,
    BeginDate datetime  NOT NULL,
    EndDate datetime  NOT NULL,
    Description varchar(30)  NOT NULL,
    CONSTRAINT exams_pk PRIMARY KEY  (ExamID)
);

-- Table: languages
CREATE TABLE languages (
    LanguageID int  NOT NULL IDENTITY,
    LanguageName varchar(30)  NOT NULL,
    CONSTRAINT languages_pk PRIMARY KEY  (LanguageID)
);

-- Table: lecturers
CREATE TABLE lecturers (
    LecturerID int  NOT NULL IDENTITY,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    Email varchar(30)  NOT NULL,
    BirthDate date  NOT NULL,
    HireDate date  NOT NULL,
    Address varchar(30)  NOT NULL,
    City varchar(30)  NOT NULL,
    Region varchar(30)  NULL,
    PostalCode varchar(30)  NOT NULL,
    CountryID int  NOT NULL,
    Phone varchar(30)  NOT NULL,
    LanguageID int  NOT NULL,
    CONSTRAINT lecturers_pk PRIMARY KEY  (LecturerID)
);

-- Table: modules
CREATE TABLE modules (
    ModuleID int  NOT NULL IDENTITY,
    EventID int  NOT NULL,
    ModuleNo int  NOT NULL,
    LecturerID int  NOT NULL,
    LanguageID int  NOT NULL,
    TranslatorID int  NULL,
    Description varchar(30)  NOT NULL,
    BeginDate datetime  NOT NULL,
    EndDate datetime  NOT NULL,
    Capacity int  NOT NULL,
    RoomID int  NOT NULL,
    ModulePrice decimal(10,2)  NOT NULL,
    CONSTRAINT modules_pk PRIMARY KEY  (ModuleID)
);

-- Table: order_event_details
CREATE TABLE order_event_details (
    OrderID int  NOT NULL,
    EventID int  NOT NULL,
    Price decimal(10,2)  NOT NULL,
    CONSTRAINT order_event_details_pk PRIMARY KEY  (OrderID,EventID)
);

-- Table: order_module_details
CREATE TABLE order_module_details (
    OrderID int  NOT NULL,
    ModuleID int  NOT NULL,
    Price decimal(10,2)  NOT NULL,
    CONSTRAINT order_module_details_pk PRIMARY KEY  (OrderID,ModuleID)
);

-- Table: orders
CREATE TABLE orders (
    OrderID int  NOT NULL IDENTITY,
    StudentID int  NOT NULL,
    OrderDate datetime  NOT NULL,
    PaymentStatusID int  NOT NULL,
    PaymentToken varchar(30)  NULL,
    CONSTRAINT orders_pk PRIMARY KEY  (OrderID)
);

-- Table: passing_exams
CREATE TABLE passing_exams (
    ExamID int  NOT NULL,
    EventStudentID int  NOT NULL,
    IsPassed int  NULL,
    CONSTRAINT passing_exams_pk PRIMARY KEY  (ExamID,EventStudentID)
);

-- Table: passing_practices
CREATE TABLE passing_practices (
    PracticeID int  NOT NULL,
    EventStudentID int  NOT NULL,
    IsPresent bit  NULL,
    IsPassed bit  NULL,
    CONSTRAINT passing_practices_pk PRIMARY KEY  (PracticeID,EventStudentID)
);

-- Table: payment_statuses
CREATE TABLE payment_statuses (
    PaymentStatusID int  NOT NULL IDENTITY,
    PaymentStatusName varchar(30)  NOT NULL,
    CONSTRAINT payment_statuses_pk PRIMARY KEY  (PaymentStatusID)
);

-- Table: practices
CREATE TABLE practices (
    PracticeID int  NOT NULL IDENTITY,
    EventID int  NOT NULL,
    PracticeNo int  NOT NULL,
    Description varchar(30)  NOT NULL,
    BeginDate datetime  NOT NULL,
    EndDate datetime  NOT NULL,
    RoomID int  NOT NULL,
    CONSTRAINT practices_pk PRIMARY KEY  (PracticeID)
);

-- Table: rooms
CREATE TABLE rooms (
    RoomID int  NOT NULL IDENTITY,
    Name varchar(30)  NOT NULL,
    Capacity int  NOT NULL,
    Availability bit  NOT NULL,
    Equipment varchar(30)  NOT NULL,
    CONSTRAINT rooms_pk PRIMARY KEY  (RoomID)
);

-- Table: single_module_students
CREATE TABLE single_module_students (
    SingleModuleStudentID int  NOT NULL IDENTITY,
    ModuleID int  NOT NULL,
    StudentID int  NOT NULL,
    IsPaid bit  NOT NULL,
    IsPresent bit  NULL,
    CONSTRAINT single_module_students_pk PRIMARY KEY  (SingleModuleStudentID)
);

-- Table: students
CREATE TABLE students (
    StudentID int  NOT NULL IDENTITY,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    Email varchar(30)  NOT NULL,
    BirthDate date  NOT NULL,
    Address varchar(30)  NOT NULL,
    City varchar(30)  NOT NULL,
    Region varchar(30)  NOT NULL,
    PostalCode varchar(30)  NOT NULL,
    CountryID int  NOT NULL,
    Phone varchar(30)  NOT NULL,
    CONSTRAINT students_pk PRIMARY KEY  (StudentID)
);

-- Table: translator_languages
CREATE TABLE translator_languages (
    TranslatorID int  NOT NULL,
    LanguageID int  NOT NULL,
    CONSTRAINT translator_languages_pk PRIMARY KEY  (TranslatorID,LanguageID)
);

-- Table: translators
CREATE TABLE translators (
    TranslatorID int  NOT NULL IDENTITY,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    Email varchar(30)  NOT NULL,
    CONSTRAINT translators_pk PRIMARY KEY  (TranslatorID)
);

-- Table: types
CREATE TABLE types (
    TypeID int  NOT NULL IDENTITY,
    TypeName varchar(30)  NOT NULL,
    CONSTRAINT types_pk PRIMARY KEY  (TypeID)
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

-- Reference: employees_countries (table: employees)
ALTER TABLE employees ADD CONSTRAINT employees_countries
    FOREIGN KEY (CountryID)
    REFERENCES countries (CountryID);

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

-- Reference: events_types (table: events)
ALTER TABLE events ADD CONSTRAINT events_types
    FOREIGN KEY (TypeID)
    REFERENCES types (TypeID);

-- Reference: exams_events (table: exams)
ALTER TABLE exams ADD CONSTRAINT exams_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: lecturers_countries (table: lecturers)
ALTER TABLE lecturers ADD CONSTRAINT lecturers_countries
    FOREIGN KEY (CountryID)
    REFERENCES countries (CountryID);

-- Reference: lecturers_languages (table: lecturers)
ALTER TABLE lecturers ADD CONSTRAINT lecturers_languages
    FOREIGN KEY (LanguageID)
    REFERENCES languages (LanguageID);

-- Reference: module_students_modules (table: single_module_students)
ALTER TABLE single_module_students ADD CONSTRAINT module_students_modules
    FOREIGN KEY (ModuleID)
    REFERENCES modules (ModuleID);

-- Reference: module_students_students (table: single_module_students)
ALTER TABLE single_module_students ADD CONSTRAINT module_students_students
    FOREIGN KEY (StudentID)
    REFERENCES students (StudentID);

-- Reference: modules_event_lecturers (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_event_lecturers
    FOREIGN KEY (EventID,LecturerID)
    REFERENCES event_lecturers (EventID,LecturerID);

-- Reference: modules_events (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: modules_languages (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_languages
    FOREIGN KEY (LanguageID)
    REFERENCES languages (LanguageID);

-- Reference: modules_rooms (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_rooms
    FOREIGN KEY (RoomID)
    REFERENCES rooms (RoomID);

-- Reference: modules_translators (table: modules)
ALTER TABLE modules ADD CONSTRAINT modules_translators
    FOREIGN KEY (TranslatorID)
    REFERENCES translators (TranslatorID);

-- Reference: order_event_details_orders (table: order_event_details)
ALTER TABLE order_event_details ADD CONSTRAINT order_event_details_orders
    FOREIGN KEY (OrderID)
    REFERENCES orders (OrderID);

-- Reference: order_module_details_events (table: order_event_details)
ALTER TABLE order_event_details ADD CONSTRAINT order_module_details_events
    FOREIGN KEY (EventID)
    REFERENCES events (EventID);

-- Reference: order_module_details_modules (table: order_module_details)
ALTER TABLE order_module_details ADD CONSTRAINT order_module_details_modules
    FOREIGN KEY (ModuleID)
    REFERENCES modules (ModuleID);

-- Reference: order_module_details_orders (table: order_module_details)
ALTER TABLE order_module_details ADD CONSTRAINT order_module_details_orders
    FOREIGN KEY (OrderID)
    REFERENCES orders (OrderID);

-- Reference: orders_payment_statuses (table: orders)
ALTER TABLE orders ADD CONSTRAINT orders_payment_statuses
    FOREIGN KEY (PaymentStatusID)
    REFERENCES payment_statuses (PaymentStatusID);

-- Reference: orders_students (table: orders)
ALTER TABLE orders ADD CONSTRAINT orders_students
    FOREIGN KEY (StudentID)
    REFERENCES students (StudentID);

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

-- Reference: students_countries (table: students)
ALTER TABLE students ADD CONSTRAINT students_countries
    FOREIGN KEY (CountryID)
    REFERENCES countries (CountryID);

-- Reference: translator_languages_languages (table: translator_languages)
ALTER TABLE translator_languages ADD CONSTRAINT translator_languages_languages
    FOREIGN KEY (LanguageID)
    REFERENCES languages (LanguageID);

-- Reference: translator_languages_translators (table: translator_languages)
ALTER TABLE translator_languages ADD CONSTRAINT translator_languages_translators
    FOREIGN KEY (TranslatorID)
    REFERENCES translators (TranslatorID);

-- sequences
-- Sequence: Sequence_1
CREATE SEQUENCE Sequence_1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

