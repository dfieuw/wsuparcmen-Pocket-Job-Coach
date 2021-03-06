USE [master]
GO
/****** Object:  Database [pjc]    Script Date: 4/26/2015 10:38:37 PM ******/
CREATE DATABASE [pjc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pjc', FILENAME = N'c:\databases\pjc\pjc.mdf' , SIZE = 3072KB , MAXSIZE = 10485760KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'pjc_log', FILENAME = N'c:\databases\pjc\pjc_log.ldf' , SIZE = 1024KB , MAXSIZE = 1048576KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [pjc] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pjc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pjc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pjc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pjc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pjc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pjc] SET ARITHABORT OFF 
GO
ALTER DATABASE [pjc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pjc] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [pjc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pjc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pjc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pjc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pjc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pjc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pjc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pjc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pjc] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [pjc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pjc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pjc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pjc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pjc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pjc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pjc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pjc] SET  MULTI_USER 
GO
ALTER DATABASE [pjc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pjc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pjc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pjc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [pjc] SET DELAYED_DURABILITY = DISABLED 
GO
USE [pjc]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](235) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[job]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job](
	[jobID] [int] IDENTITY(1,1) NOT NULL,
	[jobTitle] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_job_jobID] PRIMARY KEY CLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jobtask]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobtask](
	[jobID] [int] NOT NULL,
	[taskID] [int] NOT NULL,
 CONSTRAINT [PK_jobtask_jobID] PRIMARY KEY CLUSTERED 
(
	[jobID] ASC,
	[taskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](max) NOT NULL,
	[PropertyValueStrings] [nvarchar](max) NOT NULL,
	[PropertyValueBinary] [varbinary](max) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prompt]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prompt](
	[promptID] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NOT NULL,
	[taskID] [int] NOT NULL,
	[title] [nvarchar](25) NOT NULL,
	[description] [nvarchar](255) NULL DEFAULT (NULL),
 CONSTRAINT [PK_prompt_promptID] PRIMARY KEY CLUSTERED 
(
	[promptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[prompttype]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prompttype](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](255) NULL DEFAULT (NULL),
 CONSTRAINT [PK_prompttype_typeID] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[task]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task](
	[taskID] [int] IDENTITY(1,1) NOT NULL,
	[taskCategoryID] [int] NOT NULL,
	[taskName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_task_taskID] PRIMARY KEY CLUSTERED 
(
	[taskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taskcategory]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taskcategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_taskcategory_categoryID] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userjob]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userjob](
	[userID] [uniqueidentifier] NOT NULL,
	[jobID] [int] NOT NULL,
 CONSTRAINT [PK_userjob] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userrelationship]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrelationship](
	[useridParent] [uniqueidentifier] NOT NULL,
	[useridChild] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_userrelationship] PRIMARY KEY CLUSTERED 
(
	[useridParent] ASC,
	[useridChild] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usertask]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertask](
	[userID] [uniqueidentifier] NOT NULL,
	[taskID] [int] NOT NULL,
	[startTime] [datetime2](0) NULL DEFAULT (NULL),
	[endTime] [datetime2](0) NULL DEFAULT (NULL),
	[daysOfWeek] [nvarchar](7) NULL DEFAULT (NULL),
	[lastCompleted] [datetime2](0) NULL DEFAULT (NULL),
	[sendNotification] [smallint] NOT NULL,
	[feedbackMessage] [nvarchar](255) NULL DEFAULT (NULL),
 CONSTRAINT [PK_usertask] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[taskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usertaskprompt]    Script Date: 4/26/2015 10:38:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertaskprompt](
	[userID] [uniqueidentifier] NOT NULL,
	[taskID] [int] NOT NULL,
	[promptID] [int] NOT NULL,
	[promptLengthMin] [int] NULL DEFAULT (NULL),
 CONSTRAINT [PK_usertaskprompt_userID] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[taskID] ASC,
	[promptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_UserName]    Script Date: 4/26/2015 10:38:38 PM ******/
CREATE NONCLUSTERED INDEX [IDX_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[jobtask]  WITH NOCHECK ADD  CONSTRAINT [jobtask$jobtask_jobid_fk] FOREIGN KEY([jobID])
REFERENCES [dbo].[job] ([jobID])
GO
ALTER TABLE [dbo].[jobtask] CHECK CONSTRAINT [jobtask$jobtask_jobid_fk]
GO
ALTER TABLE [dbo].[jobtask]  WITH NOCHECK ADD  CONSTRAINT [jobtask$jobtask_taskid_fk] FOREIGN KEY([taskID])
REFERENCES [dbo].[task] ([taskID])
GO
ALTER TABLE [dbo].[jobtask] CHECK CONSTRAINT [jobtask$jobtask_taskid_fk]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_Application]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_User]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [ProfileEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [ProfileEntity_User]
GO
ALTER TABLE [dbo].[prompt]  WITH NOCHECK ADD  CONSTRAINT [prompt$prompt_taskID_FK] FOREIGN KEY([taskID])
REFERENCES [dbo].[task] ([taskID])
GO
ALTER TABLE [dbo].[prompt] CHECK CONSTRAINT [prompt$prompt_taskID_FK]
GO
ALTER TABLE [dbo].[prompt]  WITH NOCHECK ADD  CONSTRAINT [prompt$prompt_typeid_FK] FOREIGN KEY([typeID])
REFERENCES [dbo].[prompttype] ([typeID])
GO
ALTER TABLE [dbo].[prompt] CHECK CONSTRAINT [prompt$prompt_typeid_FK]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleEntity_Application]
GO
ALTER TABLE [dbo].[task]  WITH NOCHECK ADD  CONSTRAINT [task$task_taskCategoryID_FK] FOREIGN KEY([taskCategoryID])
REFERENCES [dbo].[taskcategory] ([categoryID])
GO
ALTER TABLE [dbo].[task] CHECK CONSTRAINT [task$task_taskCategoryID_FK]
GO
ALTER TABLE [dbo].[userjob]  WITH CHECK ADD  CONSTRAINT [FK_userjob_job] FOREIGN KEY([jobID])
REFERENCES [dbo].[job] ([jobID])
GO
ALTER TABLE [dbo].[userjob] CHECK CONSTRAINT [FK_userjob_job]
GO
ALTER TABLE [dbo].[userjob]  WITH CHECK ADD  CONSTRAINT [FK_userjob_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[userjob] CHECK CONSTRAINT [FK_userjob_Users]
GO
ALTER TABLE [dbo].[userrelationship]  WITH CHECK ADD  CONSTRAINT [FK_userrelationship_User2] FOREIGN KEY([useridChild])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[userrelationship] CHECK CONSTRAINT [FK_userrelationship_User2]
GO
ALTER TABLE [dbo].[userrelationship]  WITH CHECK ADD  CONSTRAINT [FK_userrelationship_Users] FOREIGN KEY([useridParent])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[userrelationship] CHECK CONSTRAINT [FK_userrelationship_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [User_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [User_Application]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_Role]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_User]
GO
ALTER TABLE [dbo].[usertask]  WITH CHECK ADD  CONSTRAINT [FK_usertask_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[usertask] CHECK CONSTRAINT [FK_usertask_Users]
GO
ALTER TABLE [dbo].[usertask]  WITH NOCHECK ADD  CONSTRAINT [usertask$usertask_taskID_FK] FOREIGN KEY([taskID])
REFERENCES [dbo].[task] ([taskID])
GO
ALTER TABLE [dbo].[usertask] CHECK CONSTRAINT [usertask$usertask_taskID_FK]
GO
ALTER TABLE [dbo].[usertaskprompt]  WITH NOCHECK ADD  CONSTRAINT [usertaskprompt$usertaskprompt_promptID_FK] FOREIGN KEY([promptID])
REFERENCES [dbo].[prompt] ([promptID])
GO
ALTER TABLE [dbo].[usertaskprompt] CHECK CONSTRAINT [usertaskprompt$usertaskprompt_promptID_FK]
GO
ALTER TABLE [dbo].[usertaskprompt]  WITH NOCHECK ADD  CONSTRAINT [usertaskprompt$usertaskprompt_taskID_FK] FOREIGN KEY([taskID])
REFERENCES [dbo].[task] ([taskID])
GO
ALTER TABLE [dbo].[usertaskprompt] CHECK CONSTRAINT [usertaskprompt$usertaskprompt_taskID_FK]
GO
ALTER TABLE [dbo].[usertaskprompt]  WITH NOCHECK ADD  CONSTRAINT [usertaskprompt$usertaskprompt_userid_FK] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[usertaskprompt] CHECK CONSTRAINT [usertaskprompt$usertaskprompt_userid_FK]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.job' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'job'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.jobtask' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'jobtask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.prompt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'prompt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.prompttype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'prompttype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.task' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.taskcategory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'taskcategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.usertask' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usertask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pjc.usertaskprompt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usertaskprompt'
GO
USE [master]
GO
ALTER DATABASE [pjc] SET  READ_WRITE 
GO
