Create database Sistema_Gestion_Turistica;

use Sistema_Gestion_Turistica;

create table Turista(
Id_Usuario int not null,
Nombre varchar(20) not null,
Primer_Apellido varchar(20) not null, 
Segundo_Apellido varchar(20), 
Tipo_Documento varchar(20), 
Numero_Documento varchar(20), 
Fecha_Nacimiento date, 
Correo_Electronico varchar(255) not null unique, 
Contrasenia varchar(255) not null, 
Categoria varchar(255)
);

alter table Turista add constraint pk_turista primary key (Id_Usuario);

alter table Turista add constraint ck_contrasenia_largo check (len(Contrasenia) >= 8);

create table Telefono(
Id_Telefono int not null,
Numero_Telefono int,
Tipo varchar(20),
Id_Usuario int not null
);

alter table Telefono add constraint pk_telefono primary key (Id_Telefono);

alter table Telefono add constraint fk_telefono_usuario foreign key(Id_Usuario) references Turista (Id_Usuario); 

alter table Telefono add constraint ck_tipo check (Tipo = 'Movil' or Tipo = 'Fijo');

create table Departamento(
Id_Departamento int not null,
Nombre varchar(255)
);

alter table Departamento add constraint pk_departamento primary key (Id_Departamento);

create table Terminal(
Id_Terminal int not null,
Nombre varchar(255),
Id_Departamento int not null
);

alter table Terminal add constraint pk_terminal primary key (Id_Terminal);

alter table Terminal add constraint fk_terminal_departamento foreign key (Id_Departamento) references Departamento(Id_Departamento);

create table Bus(
Id_Bus int not null,
Marca varchar(50),
Tipo varchar(50),
Capacidad_asientos int
);

alter table Bus add constraint pk_bus primary key (Id_Bus);

alter table Bus add constraint ck_asientos_10_40 check (Capacidad_asientos >= 10 and Capacidad_asientos <= 40);

create table Destino(
Id_Destino int not null,
Importe_Viaje int,
Fecha_Hora_Salida date,
Duracion_Aproximada int,
Informacion_General varchar(255),
Terminal_Origen int not null,
Terminal_Destino int not null,
Id_Bus int not null
);

alter table Destino add constraint pk_destino primary key (Id_Destino);

alter table Destino add constraint fk_destino_terminal_origen foreign key (Terminal_Origen) references Terminal(Id_Terminal);

alter table Destino add constraint fk_destino_terminal_destino foreign key (Terminal_Destino) references Terminal(Id_Terminal);

alter table Destino add constraint fk_bus foreign key (Id_Bus) references Bus(Id_Bus);

alter table Destino add constraint ck_origen_destino check (Terminal_Origen <> Terminal_Destino);

create table Asiento (
Id_Asiento int not null, 
Numero_Fila int, 
Letra varchar(1), 
Id_Bus int not null);

alter table Asiento add constraint pk_asiento primary key (Id_Asiento);

alter table Asiento add constraint fk_asiento_bus foreign key (Id_Bus) references Bus(Id_Bus);

create table Pasaje (
Id_Pasaje int not null, 
Fecha_Compra date, 
Estado varchar(20),
Id_Usuario int not null, 
Id_Destino int not null, 
Id_Asiento int not null);

alter table Pasaje add constraint pk_pasaje primary key (Id_Pasaje);

alter table Pasaje add constraint fk_pasaje_usuario foreign key (Id_Usuario) references Turista(Id_Usuario);

alter table Pasaje add constraint fk_pasaje_destino foreign key (Id_Destino) references Destino(Id_Destino);

alter table Pasaje add constraint fk_pasaje_asiento foreign key (Id_Asiento) references Asiento(Id_Asiento);

alter table Pasaje add constraint ck_estado_utilizado_no check (Estado = 'Utilizado' or Estado = 'No Utilizado');

create table Funcionario(
Id_Funcionario int not null, 
Nombre varchar(20), 
Cargo varchar(50)
);

alter table Funcionario add constraint pk_funcionario primary key (Id_Funcionario);

create table Acompaniante (
Id_Usuario int not null, 
Nombre varchar(50) not null, 
Primer_Apellido varchar(50) not null, 
Segundo_Apellido varchar(50), 
Tipo_Documento varchar(50), 
Numero_Documento varchar(50),
Fecha_Nacimiento date, 
Correo_Electronico varchar(50), 
Categoria varchar(50)
);

alter table Acompaniante add constraint pk_acompaniante primary key (Id_Usuario);

create table Beneficio_Mercosur (
Id_Beneficio int not null, 
Descripcion varchar(255)
);

alter table Beneficio_Mercosur add constraint pk_beneficio_mercosur primary key (Id_Beneficio);

create table Turista_Beneficio_Mercosur (
Id_Turista int not null, 
Id_Beneficio int not null
);

alter table Turista_Beneficio_Mercosur add constraint fk_turista_beneficio_mercosur_turista foreign key (Id_Turista) references Turista(Id_Usuario);

alter table Turista_Beneficio_Mercosur add constraint fk_turista_beneficio_mercosur_beneficio foreign key (Id_Beneficio) references Beneficio_Mercosur(Id_Beneficio);