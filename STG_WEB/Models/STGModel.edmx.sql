
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/18/2016 22:19:26
-- Generated from EDMX file: F:\AGH\INŻ\STG_WEB\STG_WEB\STG_WEB\Models\STGModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-STG_WEB-20160718081533];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Teacher'
CREATE TABLE [dbo].[Teacher] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Subject'
CREATE TABLE [dbo].[Subject] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ShortName] nvarchar(max)  NOT NULL,
    [SchoolId] int  NOT NULL
);
GO

-- Creating table 'Group'
CREATE TABLE [dbo].[Group] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ShortName] nvarchar(max)  NOT NULL,
    [Count] smallint  NOT NULL,
    [SchoolId] int  NOT NULL
);
GO

-- Creating table 'RoomType'
CREATE TABLE [dbo].[RoomType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Room'
CREATE TABLE [dbo].[Room] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nr] nvarchar(max)  NOT NULL,
    [Conut] smallint  NOT NULL,
    [RoomTypeId] int  NOT NULL,
    [SchoolId] int  NOT NULL
);
GO

-- Creating table 'GroupSubjectTeacher'
CREATE TABLE [dbo].[GroupSubjectTeacher] (
    [Semester] nvarchar(max)  NOT NULL,
    [Schedule] nvarchar(max)  NOT NULL,
    [TeacherId] int  NOT NULL,
    [GroupId] int  NOT NULL,
    [SubjectId] int  NOT NULL,
    [RoomTypeId] int  NOT NULL
);
GO

-- Creating table 'Timetable'
CREATE TABLE [dbo].[Timetable] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Size] smallint  NOT NULL,
    [Part] smallint  NOT NULL,
    [Day] nvarchar(max)  NOT NULL,
    [Hour] nvarchar(max)  NOT NULL,
    [SchoolId] int  NOT NULL,
    [GroupSubjectTeacherSemester] nvarchar(max)  NOT NULL,
    [GroupSubjectTeacherTeacherId] int  NOT NULL,
    [GroupSubjectTeacherGroupId] int  NOT NULL,
    [GroupSubjectTeacherSubjectId] int  NOT NULL,
    [RoomId] int  NOT NULL
);
GO

-- Creating table 'School'
CREATE TABLE [dbo].[School] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'SchoolTeacher'
CREATE TABLE [dbo].[SchoolTeacher] (
    [TeacherId] int  NOT NULL,
    [SchoolId] int  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [RoleId] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Teacher'
ALTER TABLE [dbo].[Teacher]
ADD CONSTRAINT [PK_Teacher]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Subject'
ALTER TABLE [dbo].[Subject]
ADD CONSTRAINT [PK_Subject]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Group'
ALTER TABLE [dbo].[Group]
ADD CONSTRAINT [PK_Group]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RoomType'
ALTER TABLE [dbo].[RoomType]
ADD CONSTRAINT [PK_RoomType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Room'
ALTER TABLE [dbo].[Room]
ADD CONSTRAINT [PK_Room]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Semester], [TeacherId], [GroupId], [SubjectId] in table 'GroupSubjectTeacher'
ALTER TABLE [dbo].[GroupSubjectTeacher]
ADD CONSTRAINT [PK_GroupSubjectTeacher]
    PRIMARY KEY CLUSTERED ([Semester], [TeacherId], [GroupId], [SubjectId] ASC);
GO

-- Creating primary key on [Id] in table 'Timetable'
ALTER TABLE [dbo].[Timetable]
ADD CONSTRAINT [PK_Timetable]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'School'
ALTER TABLE [dbo].[School]
ADD CONSTRAINT [PK_School]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [TeacherId], [SchoolId] in table 'SchoolTeacher'
ALTER TABLE [dbo].[SchoolTeacher]
ADD CONSTRAINT [PK_SchoolTeacher]
    PRIMARY KEY CLUSTERED ([TeacherId], [SchoolId] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [TeacherId] in table 'GroupSubjectTeacher'
ALTER TABLE [dbo].[GroupSubjectTeacher]
ADD CONSTRAINT [FK_TeacherGroupSubjectTeacher]
    FOREIGN KEY ([TeacherId])
    REFERENCES [dbo].[Teacher]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherGroupSubjectTeacher'
CREATE INDEX [IX_FK_TeacherGroupSubjectTeacher]
ON [dbo].[GroupSubjectTeacher]
    ([TeacherId]);
GO

-- Creating foreign key on [GroupId] in table 'GroupSubjectTeacher'
ALTER TABLE [dbo].[GroupSubjectTeacher]
ADD CONSTRAINT [FK_GroupGroupSubjectTeacher]
    FOREIGN KEY ([GroupId])
    REFERENCES [dbo].[Group]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupGroupSubjectTeacher'
CREATE INDEX [IX_FK_GroupGroupSubjectTeacher]
ON [dbo].[GroupSubjectTeacher]
    ([GroupId]);
GO

-- Creating foreign key on [SubjectId] in table 'GroupSubjectTeacher'
ALTER TABLE [dbo].[GroupSubjectTeacher]
ADD CONSTRAINT [FK_SubjectGroupSubjectTeacher]
    FOREIGN KEY ([SubjectId])
    REFERENCES [dbo].[Subject]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectGroupSubjectTeacher'
CREATE INDEX [IX_FK_SubjectGroupSubjectTeacher]
ON [dbo].[GroupSubjectTeacher]
    ([SubjectId]);
GO

-- Creating foreign key on [RoomTypeId] in table 'GroupSubjectTeacher'
ALTER TABLE [dbo].[GroupSubjectTeacher]
ADD CONSTRAINT [FK_RoomTypeGroupSubjectTeacher]
    FOREIGN KEY ([RoomTypeId])
    REFERENCES [dbo].[RoomType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomTypeGroupSubjectTeacher'
CREATE INDEX [IX_FK_RoomTypeGroupSubjectTeacher]
ON [dbo].[GroupSubjectTeacher]
    ([RoomTypeId]);
GO

-- Creating foreign key on [RoomTypeId] in table 'Room'
ALTER TABLE [dbo].[Room]
ADD CONSTRAINT [FK_RoomTypeRoom]
    FOREIGN KEY ([RoomTypeId])
    REFERENCES [dbo].[RoomType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomTypeRoom'
CREATE INDEX [IX_FK_RoomTypeRoom]
ON [dbo].[Room]
    ([RoomTypeId]);
GO

-- Creating foreign key on [TeacherId] in table 'SchoolTeacher'
ALTER TABLE [dbo].[SchoolTeacher]
ADD CONSTRAINT [FK_TeacherSchoolTeacher]
    FOREIGN KEY ([TeacherId])
    REFERENCES [dbo].[Teacher]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SchoolId] in table 'SchoolTeacher'
ALTER TABLE [dbo].[SchoolTeacher]
ADD CONSTRAINT [FK_SchoolSchoolTeacher]
    FOREIGN KEY ([SchoolId])
    REFERENCES [dbo].[School]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolSchoolTeacher'
CREATE INDEX [IX_FK_SchoolSchoolTeacher]
ON [dbo].[SchoolTeacher]
    ([SchoolId]);
GO

-- Creating foreign key on [SchoolId] in table 'Subject'
ALTER TABLE [dbo].[Subject]
ADD CONSTRAINT [FK_SchoolSubject]
    FOREIGN KEY ([SchoolId])
    REFERENCES [dbo].[School]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolSubject'
CREATE INDEX [IX_FK_SchoolSubject]
ON [dbo].[Subject]
    ([SchoolId]);
GO

-- Creating foreign key on [SchoolId] in table 'Room'
ALTER TABLE [dbo].[Room]
ADD CONSTRAINT [FK_SchoolRoom]
    FOREIGN KEY ([SchoolId])
    REFERENCES [dbo].[School]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolRoom'
CREATE INDEX [IX_FK_SchoolRoom]
ON [dbo].[Room]
    ([SchoolId]);
GO

-- Creating foreign key on [SchoolId] in table 'Group'
ALTER TABLE [dbo].[Group]
ADD CONSTRAINT [FK_SchoolGroup]
    FOREIGN KEY ([SchoolId])
    REFERENCES [dbo].[School]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolGroup'
CREATE INDEX [IX_FK_SchoolGroup]
ON [dbo].[Group]
    ([SchoolId]);
GO

-- Creating foreign key on [SchoolId] in table 'Timetable'
ALTER TABLE [dbo].[Timetable]
ADD CONSTRAINT [FK_SchoolTimetable]
    FOREIGN KEY ([SchoolId])
    REFERENCES [dbo].[School]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SchoolTimetable'
CREATE INDEX [IX_FK_SchoolTimetable]
ON [dbo].[Timetable]
    ([SchoolId]);
GO

-- Creating foreign key on [GroupSubjectTeacherSemester], [GroupSubjectTeacherTeacherId], [GroupSubjectTeacherGroupId], [GroupSubjectTeacherSubjectId] in table 'Timetable'
ALTER TABLE [dbo].[Timetable]
ADD CONSTRAINT [FK_GroupSubjectTeacherTimetable]
    FOREIGN KEY ([GroupSubjectTeacherSemester], [GroupSubjectTeacherTeacherId], [GroupSubjectTeacherGroupId], [GroupSubjectTeacherSubjectId])
    REFERENCES [dbo].[GroupSubjectTeacher]
        ([Semester], [TeacherId], [GroupId], [SubjectId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupSubjectTeacherTimetable'
CREATE INDEX [IX_FK_GroupSubjectTeacherTimetable]
ON [dbo].[Timetable]
    ([GroupSubjectTeacherSemester], [GroupSubjectTeacherTeacherId], [GroupSubjectTeacherGroupId], [GroupSubjectTeacherSubjectId]);
GO

-- Creating foreign key on [RoomId] in table 'Timetable'
ALTER TABLE [dbo].[Timetable]
ADD CONSTRAINT [FK_RoomTimetable]
    FOREIGN KEY ([RoomId])
    REFERENCES [dbo].[Room]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomTimetable'
CREATE INDEX [IX_FK_RoomTimetable]
ON [dbo].[Timetable]
    ([RoomId]);
GO

-- Creating foreign key on [AspNetUsersId] in table 'Teacher'
ALTER TABLE [dbo].[Teacher]
ADD CONSTRAINT [FK_AspNetUsersTeacher]
    FOREIGN KEY ([AspNetUsersId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUsersTeacher'
CREATE INDEX [IX_FK_AspNetUsersTeacher]
ON [dbo].[Teacher]
    ([AspNetUsersId]);
GO

-- Creating foreign key on [AspNetUsersId] in table 'School'
ALTER TABLE [dbo].[School]
ADD CONSTRAINT [FK_AspNetUsersSchool]
    FOREIGN KEY ([AspNetUsersId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUsersSchool'
CREATE INDEX [IX_FK_AspNetUsersSchool]
ON [dbo].[School]
    ([AspNetUsersId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------