create table CIUDAD (
	ciudad_id serial PRIMARY KEY, 
	ciudad_nombre varchar(16)
);

create table PAIS (
	pais_id serial PRIMARY KEY, 
	pais_nombre varchar(16)
);

create table MUSICA (
	musica_id serial PRIMARY KEY, 
	musica_nombre varchar(16)
);

create table CITA (
	cita_id serial PRIMARY KEY, 
	cita_hora time,
	cita_fecha date
);

create table ESTUDIOS  (
	estuido_id serial PRIMARY KEY, 
	estudio_nombre varchar(16)
);

create table HOBBY (
	hobby_id serial PRIMARY KEY, 
	hobby_nombre varchar(16)
);



create table USUARIO (
	usuario_id serial PRIMARY KEY, 
	usuario_nombre varchar(10),
	usuario_apellido varchar(10),
	usuario_fecha date,
	usuario_hora time,
	usuario_pais_id serial,
	usuario_ciudad_id serial,
	usuario_estuido_id serial,
	usuario_musica_id serial,
	usuario_hobby_id serial,
	
	constraint pais_FK foreign key (usuario_pais_id) references PAIS (pais_id)
	on delete restrict on update cascade,
	constraint ciudad_FK foreign key (usuario_ciudad_id) references CIUDAD (ciudad_id)
	on delete restrict on update cascade,
	constraint MUSICA_FK foreign key (usuario_musica_id) references MUSICA (musica_id)
	on delete restrict on update cascade,
	constraint estudio_FK foreign key (usuario_estuido_id) references ESTUDIOS (estuido_id)
	on delete restrict on update cascade,
	constraint hobby_FK foreign key (usuario_hobby_id) references HOBBY (hobby_id)
	on delete restrict on update cascade
	
);

create table HOBBYUSUARIO(
   hobbyusuario_id serial PRIMARY KEY,
   hobbyusuario_hobby_id serial,
   hobbyusuario_usuario_id serial,
	
	constraint ho_hobby_FK foreign key (hobbyusuario_hobby_id) references HOBBY (hobby_id)
	on delete restrict on update cascade,
	constraint ho_usuario_FK foreign key (hobbyusuario_usuario_id) references 
	USUARIO (usuario_id)
	on delete restrict on update cascade
);


create table ESTUDIOUSUARIO(
   estudiousuario_id serial PRIMARY KEY,
   estudiousuario_estuido_id serial,
   estudiousuario_usuario_id serial,
	
	constraint es_estudio_FK foreign key (estudiousuario_estuido_id) references 
	ESTUDIOS (estuido_id)
	on delete restrict on update cascade,
	constraint es_usuario_FK foreign key (estudiousuario_usuario_id) references 
	USUARIO (usuario_id)
	on delete restrict on update cascade
	
);


create table MUSICAUSUARIO(
   musicausuario_id serial PRIMARY KEY,
   musicausuario_musica_id serial,
   musicausuario_usuario_id serial,
	
	constraint mu_musica_FK foreign key (musicausuario_musica_id) references 
	MUSICA (musica_id) on delete restrict on update cascade,
	constraint mu_usuario_FK foreign key (musicausuario_usuario_id) references 
	USUARIO (usuario_id)
	on delete restrict on update cascade
	
);



create table CITAUSUARIO(
   citausuario_id serial,
   citausuario_uno serial,
   citausuario_dos serial,
   citausuario_cita_id serial,
	
	constraint usuario_uno_FK foreign key (citausuario_uno) references USUARIO (usuario_id)
	on delete restrict on update cascade,
	constraint usuario_dos_FK foreign key (citausuario_dos) references USUARIO (usuario_id)
	on delete restrict on update cascade,
	constraint cita_id_FK foreign key (citausuario_cita_id) references CITA (cita_id)
	on delete restrict on update cascade
	
);


create table PUNTAJE(
	puntaje_id serial PRIMARY KEY ,
	puntaje_usuario_id serial,
	puntaje_cita_id serial,
	puntaje_perfecto smallint,
	puntaje_descripcion varchar(80),
	
    constraint puntaje_FK foreign key (puntaje_usuario_id) references USUARIO (usuario_id)
	on delete restrict on update cascade,
	constraint cita_id_FK foreign key (puntaje_cita_id) references CITA (cita_id)
	on delete restrict on update cascade
   
);
















































insert into ESTUDIOS values (1, 'Universidad');
insert into ESTUDIOS values (2, 'Colegio');

insert into HOBBY values (1, 'Cantar');
insert into HOBBY values (2, 'Patinar');

insert into CITA values (1, '18:00:00','2020-02-14');
insert into CITA values (2, '20:30:00','2020-07-11');
insert into CITA values (3, '19:00:00','2020-10-11');




insert into CIUDAD  values (1,'Manta');
insert into CIUDAD  values (2,'Cartagena');

insert into MUSICA  values (1,'Electronica');
insert into MUSICA  values (2,'Cumbia');


insert into PAIS  values (1,'Ecuador');
insert into PAIS  values (2,'Colombia');

insert into USUARIO values (1,'Mica','Face', '2020-02-14','18:00:00',1,1,1,1,1);
insert into USUARIO values (2,'Gustavo','Cedeño', '2020-07-11','20:30:00',1,1,2,1,2);
insert into USUARIO values (3, 'Kati','Mendoza','2020-10-11','19:00:00',2,2,1,2,3);
insert into USUARIO values (4, 'Yita','Cedeño', '2020-02-14', '18:00:00',2,2,1,1,1);
insert into USUARIO values (5, 'LEO','Cedeño','2020-07-11','18:00:00' ,2,2,2,1,2);



insert into HOBBYUSUARIO  values (1,1,5);
insert into HOBBYUSUARIO  values (2,1,3);
insert into HOBBYUSUARIO  values (3,2,2);
insert into HOBBYUSUARIO  values (4,1,4);
insert into HOBBYUSUARIO  values (5,1,5);
insert into HOBBYUSUARIO  values (6,2,3);


insert into ESTUDIOUSUARIO  values (1,1,5);
insert into ESTUDIOUSUARIO  values (2,1,3);
insert into ESTUDIOUSUARIO  values (3,2,2);
insert into ESTUDIOUSUARIO  values (4,1,4);
insert into ESTUDIOUSUARIO  values (5,1,5);
insert into ESTUDIOUSUARIO  values (6,2,3);



insert into MUSICAUSUARIO  values (1,1,5);
insert into MUSICAUSUARIO  values (2,1,3);
insert into MUSICAUSUARIO  values (3,2,2);
insert into MUSICAUSUARIO  values (4,1,4);
insert into MUSICAUSUARIO  values (5,1,5);
insert into MUSICAUSUARIO  values (6,2,3);


insert into CITAUSUARIO  values (1,1,2,1);
insert into CITAUSUARIO  values (2,3,4,2);
insert into CITAUSUARIO  values (3,1,4,3);

insert into PUNTAJE  values (1,1,1,3,'ME ENCANTO');
insert into PUNTAJE  values (2,2,1,4,'ES UN ENGREIDO');
insert into PUNTAJE  values (3,3,2,3,'NO LLEGO');
insert into PUNTAJE  values (4,4,2,5,'MARAVILLOSA PERSONA');
insert into PUNTAJE  values (5,1,3,2,'ES MACHISTA');
insert into PUNTAJE  values (6,1,3,2,'NO FUE DE MI AGRADO');











select usuario_nombre, round(avg(puntaje_perfecto),2) as promedio
from USUARIO inner join PUNTAJE on usuario.usuario_id= puntaje.puntaje_usuario_id
group by usuario_nombre
order by promedio desc


with recursive CANTIDAD(usuario_nombre, cantidad_citas) as (
	select usuario_nombre as nombre, count(citausuario_uno)
	from USUARIO inner join CITAUSUARIO on usuario.usuario_id= citausuario.citausuario_uno
	group by usuario_nombre
	union all 
	select usuario_nombre, count(citausuario_dos)
	from USUARIO inner join CITAUSUARIO on usuario.usuario_id= citausuario.citausuario_dos
	group by usuario_nombre
	

)
select * from CANTIDAD










with recursive CANTIDAD(usuario_nombre, cantidad_citas) as (
	select usuario_nombre as nombre, count(citausuario_uno)
	from USUARIO inner join CITAUSUARIO on usuario.usuario_id= citausuario.citausuario_uno
	group by usuario_nombre
	union all 
	select usuario_nombre, count(citausuario_dos)
	from USUARIO inner join CITAUSUARIO on usuario.usuario_id= citausuario.citausuario_dos
	group by usuario_nombre
	

)
select * from CANTIDAD order by cantidad_citas desc 
fetch first 2 rows only 




with recursive CANTIDAD(usuario_nombre, cantidad_citas) as (
	select usuario_nombre as nombre,citausuario_id
	from USUARIO 
	left join CITAUSUARIO on usuario.usuario_id= citausuario.citausuario_uno
	where citausuario_uno isnull
	group by usuario_nombre, citausuario_id
	union all 
	select usuario_nombre, citausuario_id
	from USUARIO left join CITAUSUARIO on usuario_id= citausuario.citausuario_dos
	where citausuario_dos isnull
	group by usuario_nombre, citausuario_id
)
select usuario_nombre from CANTIDAD
group by usuario_nombre 
having count(*) > 1;
