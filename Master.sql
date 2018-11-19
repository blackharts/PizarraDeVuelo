USE [C:\USERS\KALBL\DOCUMENTS\GITHUB\PIZARRADEVUELO\PIZARRADEVUELO\DATABASE1.MDF];

CREATE TABLE Areonave (
  idAvion VARCHAR(9) NOT NULL,
  Modelo VARCHAR(45) NULL,
  is_activo INT NOT NULL,
  PRIMARY KEY (idAvion))

  CREATE TABLE Piloto (
  idPiloto int,
  Nombre VARCHAR(45) NULL,
  Apellido VARCHAR(45) NULL,
  PRIMARY KEY (idPiloto));

  CREATE TABLE Mision (
  idMision VARCHAR(10) NOT NULL,
  nombre VARCHAR(45) NULL,
  PRIMARY KEY (idMision));

  CREATE TABLE Localidad (
  idLocalidad VARCHAR(6) NOT NULL,
  Nombre VARCHAR(45) NULL,
  PRIMARY KEY (idLocalidad));

  CREATE TABLE Reservas (
  idReservas INT NOT NULL IDENTITY,
  aeronave VARCHAR(9) NULL,
  piloto INT NULL,
  disponibilidad VARCHAR(2) NULL,
  mision VARCHAR(40) NULL,
  fecha DATE NULL,
  hora_reserva TIME NULL,
  PRIMARY KEY (idReservas),
  CONSTRAINT fk_aeronave
    FOREIGN KEY (aeronave)
    REFERENCES Areonave (idAvion)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_pilot
    FOREIGN KEY (piloto)
    REFERENCES Piloto (idPiloto)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

CREATE TABLE Vuelo (
  idVuelo INT NOT NULL IDENTITY,
  aeronave VARCHAR(9) NULL,
  piloto INT NULL,
  mision VARCHAR(10) NULL,
  desde VARCHAR(6) NULL,
  hasta VARCHAR(6) NULL,
  fecha DATE NULL,
  hora_salida TIME NULL,
  hora_llegada TIME NULL,
  Observacion VARCHAR(45) NULL,
  plan_vuelo VARCHAR(2) NULL,
  Combustible INT NULL,
  comb_medida VARCHAR(5) NULL,
  PRIMARY KEY (idVuelo),
  CONSTRAINT fk_avion
    FOREIGN KEY (aeronave)
    REFERENCES Areonave (idAvion)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_pilot2
    FOREIGN KEY (piloto)
    REFERENCES Piloto (idPiloto)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_mision
    FOREIGN KEY (mision)
    REFERENCES Mision (idMision)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_desde
    FOREIGN KEY (desde)
    REFERENCES Localidad (idLocalidad)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_hasta
    FOREIGN KEY (hasta)
    REFERENCES Localidad (idLocalidad)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);