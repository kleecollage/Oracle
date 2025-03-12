/* PARTITIONATED INDEXES */

-- Tabla normal e índice particionado

drop table t1;

create table t1
(codigo number,
datos varchar2(50));

create index g1_t1 on t1 (codigo) global partition by hash(codigo) partitions 4;

select * from user_ind_partitions where index_name='G1_T1';



-- Tabla particionada e índice normal

drop table t2;
create table t2
(codigo number,
datos varchar2(50))
PARTITION BY RANGE (codigo)
  (
      PARTITION P1 VALUES LESS THAN (10),
      PARTITION P2 VALUES LESS THAN (20),
      PARTITION P3 VALUES LESS THAN (30),
      PARTITION P4 VALUES LESS THAN (40)
     );
     
     create index t2_i1 on t2(datos);
     
     
-- Tabla particionada e índice global particionado

drop table t3;
create table t3
(codigo number,
datos varchar2(50))
PARTITION BY RANGE (codigo)
  (
      PARTITION P1 VALUES LESS THAN (10),
      PARTITION P2 VALUES LESS THAN (20),
      PARTITION P3 VALUES LESS THAN (30),
      PARTITION P4 VALUES LESS THAN (40)
     );
        
     create index g1_t3 on t3 (datos) global partition by hash(datos) partitions 4;
     
-- indices particionados locales

drop table t4;
create table t4
(codigo number,
datos varchar2(50))
PARTITION BY RANGE (codigo)
  (
      PARTITION P1 VALUES LESS THAN (10),
      PARTITION P2 VALUES LESS THAN (20),
      PARTITION P3 VALUES LESS THAN (30),
      PARTITION P4 VALUES LESS THAN (40)
     );
     create index t4_i1 on t4(codigo) local ;
     select * from user_ind_partitions where index_name='T4_I1';
