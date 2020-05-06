USE [master]
GO
/****** Object:  Database [EEINVENTORY]    Script Date: 5/05/2020 11:10:10 p. m. ******/
CREATE DATABASE [EEINVENTORY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'INVENTARIOS_IT', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\INVENTARIOS_IT.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'INVENTARIOS_IT_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\INVENTARIOS_IT_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EEINVENTORY] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EEINVENTORY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EEINVENTORY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EEINVENTORY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EEINVENTORY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EEINVENTORY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EEINVENTORY] SET ARITHABORT OFF 
GO
ALTER DATABASE [EEINVENTORY] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EEINVENTORY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EEINVENTORY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EEINVENTORY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EEINVENTORY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EEINVENTORY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EEINVENTORY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EEINVENTORY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EEINVENTORY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EEINVENTORY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EEINVENTORY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EEINVENTORY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EEINVENTORY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EEINVENTORY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EEINVENTORY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EEINVENTORY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EEINVENTORY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EEINVENTORY] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EEINVENTORY] SET  MULTI_USER 
GO
ALTER DATABASE [EEINVENTORY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EEINVENTORY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EEINVENTORY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EEINVENTORY] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EEINVENTORY] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EEINVENTORY]
GO
/****** Object:  Table [dbo].[ACTIVOS]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACTIVOS](
	[NumActivo] [bigint] NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Marca] [varchar](20) NOT NULL,
	[Serial] [varchar](50) NOT NULL,
	[Descripcion] [varchar](250) NULL,
	[Cantidad] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[fkTipoActivo] [int] NULL,
	[fkSede] [int] NULL,
	[fkAmbiente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumActivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRESTAMOS]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRESTAMOS](
	[fkIdentificacion] [bigint] NULL,
	[fkNumeroActivo] [bigint] NULL,
	[FechaPrestamo] [date] NULL,
	[FechaDevolucion] [date] NULL,
	[Observaciones] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEDES]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEDES](
	[CodSede] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Ciudad] [varchar](30) NOT NULL,
	[fkNumeroTraslado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPO_ACTIVO]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_ACTIVO](
	[CodActivo] [int] NOT NULL,
	[TipoActivo] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodActivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPO_IDENTIFICACION]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_IDENTIFICACION](
	[CodID] [int] NOT NULL,
	[TipoID] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPO_USUARIO]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_USUARIO](
	[CodUsuario] [int] NOT NULL,
	[Rol] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRASLADOS]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRASLADOS](
	[NumeroTraslado] [int] NOT NULL,
	[FechaIngreso] [datetime] NULL,
	[FechaSalida] [datetime] NULL,
	[FechaDevolucion] [datetime] NULL,
	[Observaciones] [varchar](100) NULL,
	[fkNumeroActivo] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroTraslado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UBICACION]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UBICACION](
	[Id] [int] NOT NULL,
	[Ambiente] [varchar](100) NOT NULL,
	[fkSede] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 5/05/2020 11:10:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Identificacion] [bigint] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellidos] [varchar](30) NOT NULL,
	[Telefono] [bigint] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Ciudad] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Usuario] [varchar](20) NULL,
	[Contrasena] [varchar](30) NULL,
	[fkRol] [int] NULL,
	[fkTipoID] [int] NULL,
	[fkSede] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ACTIVOS]  WITH CHECK ADD FOREIGN KEY([fkTipoActivo])
REFERENCES [dbo].[TIPO_ACTIVO] ([CodActivo])
GO
ALTER TABLE [dbo].[ACTIVOS]  WITH CHECK ADD  CONSTRAINT [FK_SEDES_ACTIVOS_fkSede] FOREIGN KEY([fkSede])
REFERENCES [dbo].[SEDES] ([CodSede])
GO
ALTER TABLE [dbo].[ACTIVOS] CHECK CONSTRAINT [FK_SEDES_ACTIVOS_fkSede]
GO
ALTER TABLE [dbo].[ACTIVOS]  WITH CHECK ADD  CONSTRAINT [FK_UBICACION_ACTIVOS_fkIdAmbiente] FOREIGN KEY([fkAmbiente])
REFERENCES [dbo].[UBICACION] ([Id])
GO
ALTER TABLE [dbo].[ACTIVOS] CHECK CONSTRAINT [FK_UBICACION_ACTIVOS_fkIdAmbiente]
GO
ALTER TABLE [dbo].[PRESTAMOS]  WITH CHECK ADD FOREIGN KEY([fkIdentificacion])
REFERENCES [dbo].[USUARIOS] ([Identificacion])
GO
ALTER TABLE [dbo].[PRESTAMOS]  WITH CHECK ADD FOREIGN KEY([fkNumeroActivo])
REFERENCES [dbo].[ACTIVOS] ([NumActivo])
GO
ALTER TABLE [dbo].[SEDES]  WITH CHECK ADD  CONSTRAINT [FK_TRASLADOS_SEDES_fkNumeroTraslado] FOREIGN KEY([fkNumeroTraslado])
REFERENCES [dbo].[TRASLADOS] ([NumeroTraslado])
GO
ALTER TABLE [dbo].[SEDES] CHECK CONSTRAINT [FK_TRASLADOS_SEDES_fkNumeroTraslado]
GO
ALTER TABLE [dbo].[TRASLADOS]  WITH CHECK ADD FOREIGN KEY([fkNumeroActivo])
REFERENCES [dbo].[ACTIVOS] ([NumActivo])
GO
ALTER TABLE [dbo].[UBICACION]  WITH CHECK ADD FOREIGN KEY([fkSede])
REFERENCES [dbo].[SEDES] ([CodSede])
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD FOREIGN KEY([fkRol])
REFERENCES [dbo].[TIPO_USUARIO] ([CodUsuario])
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD FOREIGN KEY([fkTipoID])
REFERENCES [dbo].[TIPO_IDENTIFICACION] ([CodID])
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_SEDES_USUARIOS_fkSede] FOREIGN KEY([fkSede])
REFERENCES [dbo].[SEDES] ([CodSede])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_SEDES_USUARIOS_fkSede]
GO
USE [master]
GO
ALTER DATABASE [EEINVENTORY] SET  READ_WRITE 
GO
