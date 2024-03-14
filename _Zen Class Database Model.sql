CREATE TABLE [studentinfo] (
  [studentid] INT PRIMARY KEY IDENTITY(1, 1),
  [studentname] VARCHAR(255),
  [mobilenumber] VARCHAR(255) UNIQUE,
  [email] VARCHAR(255) UNIQUE,
  [mentorname] VARCHAR(255),
  [batchid] INT,
  [batchname] VARCHAR(255)
)
GO

CREATE TABLE [taskinfo] (
  [taskid] INT PRIMARY KEY IDENTITY(1, 1),
  [taskname] VARCHAR(255) UNIQUE,
  [studentid] INT,
  [mentorid] INT,
  [mentorname] VARCHAR(25),
  [batchname] VARCHAR(50)
)
GO

CREATE TABLE [mentorinfo] (
  [mentorid] INT PRIMARY KEY IDENTITY(1, 1),
  [email] VARCHAR(50) UNIQUE,
  [contactno] VARCHAR(15) UNIQUE,
  [assignedbatch] VARCHAR(100)
)
GO

CREATE TABLE [batchinfo] (
  [batchid] INT PRIMARY KEY IDENTITY(1, 1),
  [batchname] VARCHAR(255),
  [totalstudents] INT,
  [mentorid] INT
)
GO

CREATE TABLE [queryinfo] (
  [queryid] INT PRIMARY KEY IDENTITY(1, 1),
  [querytext] TEXT,
  [studentid] INT,
  [mentorid] INT
)
GO

CREATE TABLE [dashboardinfo] (
  [dashboardid] INT PRIMARY KEY IDENTITY(1, 1),
  [studentid] INT,
  [mentorid] INT,
  [batchid] INT
)
GO

CREATE TABLE [mockinterviewinfo] (
  [mockinterviewid] INT PRIMARY KEY IDENTITY(1, 1),
  [studentid] INT,
  [mentorid] INT,
  [batchid] INT
)
GO

ALTER TABLE [studentinfo] ADD FOREIGN KEY ([batchid]) REFERENCES [batchinfo] ([batchid])
GO

ALTER TABLE [taskinfo] ADD FOREIGN KEY ([studentid]) REFERENCES [studentinfo] ([studentid])
GO

ALTER TABLE [taskinfo] ADD FOREIGN KEY ([mentorid]) REFERENCES [mentorinfo] ([mentorid])
GO

ALTER TABLE [batchinfo] ADD FOREIGN KEY ([mentorid]) REFERENCES [mentorinfo] ([mentorid])
GO

ALTER TABLE [queryinfo] ADD FOREIGN KEY ([studentid]) REFERENCES [studentinfo] ([studentid])
GO

ALTER TABLE [queryinfo] ADD FOREIGN KEY ([mentorid]) REFERENCES [mentorinfo] ([mentorid])
GO

ALTER TABLE [dashboardinfo] ADD FOREIGN KEY ([studentid]) REFERENCES [studentinfo] ([studentid])
GO

ALTER TABLE [dashboardinfo] ADD FOREIGN KEY ([mentorid]) REFERENCES [mentorinfo] ([mentorid])
GO

ALTER TABLE [dashboardinfo] ADD FOREIGN KEY ([batchid]) REFERENCES [batchinfo] ([batchid])
GO

ALTER TABLE [mockinterviewinfo] ADD FOREIGN KEY ([studentid]) REFERENCES [studentinfo] ([studentid])
GO

ALTER TABLE [mockinterviewinfo] ADD FOREIGN KEY ([mentorid]) REFERENCES [mentorinfo] ([mentorid])
GO

ALTER TABLE [mockinterviewinfo] ADD FOREIGN KEY ([batchid]) REFERENCES [batchinfo] ([batchid])
GO
