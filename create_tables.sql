CREATE DATABASE StudentPerformanceDW;
GO

USE StudentPerformanceDW;
GO


CREATE TABLE dim_student (
    StudentID INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Gender CHAR(1) NULL,
    City NVARCHAR(50) NOT NULL
);


CREATE TABLE dim_course (
    CourseID INT NOT NULL PRIMARY KEY,
    CourseName NVARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);


CREATE TABLE dim_date (
    DateKey INT NOT NULL PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL
);

CREATE TABLE fact_student_performance (
    FactID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Grade INT,
    Attendance INT,
    DateKey INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES dim_student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES dim_course(CourseID),
    FOREIGN KEY (DateKey) REFERENCES dim_date(DateKey)
);
