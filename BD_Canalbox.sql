/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  12/08/2026 11:18:31                      */
/*==============================================================*/


drop table if exists CLIENT;

drop table if exists CONTRAT;

drop table if exists DOSSIER_AUXILIAIRE;

drop table if exists GARANTIE;

drop table if exists INSPECTEUR;

drop table if exists INTERVENTION_INSPECTEUR;

drop table if exists PREVOIR;

drop table if exists RISQUE;

drop table if exists TYPE_DE_CONTRAT;

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT
(
   NUM_CLIENT           varchar(50) not null,
   NOM                  varchar(20) not null,
   _PRENOM              varchar(30) not null,
   ADRESSE              varchar(50),
   TEL                  varchar(20) not null,
   LOCALITE             varchar(20) not null,
   primary key (NUM_CLIENT)
);

/*==============================================================*/
/* Table : CONTRAT                                              */
/*==============================================================*/
create table CONTRAT
(
   NUM_CONTRAT_______________________ varchar(50) not null,
   NUM_CLIENT           varchar(50) not null,
   NUM_RISQUE________________________ varchar(50) not null,
   RIS_NUM_RISQUE________________________ varchar(50) not null,
   DATE_SOUSCRIPTION    date not null,
   ECHEANCE             date not null,
   primary key (NUM_CONTRAT_______________________)
);

/*==============================================================*/
/* Table : DOSSIER_AUXILIAIRE                                   */
/*==============================================================*/
create table DOSSIER_AUXILIAIRE
(
   NUM_DOSSIER_______________________ varchar(50) not null,
   CODE_GARANTIE_____________________ varchar(50) not null,
   DATE_OUVERTURE       date not null,
   DATE_FERMETURE       date,
   RESERVE_FINANCIERE__ decimal(20),
   PAIEMENTS            decimal(50),
   primary key (NUM_DOSSIER_______________________)
);

/*==============================================================*/
/* Table : GARANTIE                                             */
/*==============================================================*/
create table GARANTIE
(
   CODE_GARANTIE_____________________ varchar(50) not null,
   LIBELLE_G            varchar(50) not null,
   TARIF                decimal(50) not null,
   primary key (CODE_GARANTIE_____________________)
);

/*==============================================================*/
/* Table : INSPECTEUR                                           */
/*==============================================================*/
create table INSPECTEUR
(
   CODE_INSPECTEUR___________________ varchar(20) not null,
   NOM                  varchar(20) not null,
   PRENOM               varchar(50) not null,
   TEL                  varchar(20),
   primary key (CODE_INSPECTEUR___________________)
);

/*==============================================================*/
/* Table : INTERVENTION_INSPECTEUR                              */
/*==============================================================*/
create table INTERVENTION_INSPECTEUR
(
   NUM_INTERVENTION__________________ int not null,
   NUM_DOSSIER_______________________ varchar(50) not null,
   CODE_INSPECTEUR___________________ varchar(20) not null,
   DATE                 date not null,
   primary key (NUM_INTERVENTION__________________)
);

/*==============================================================*/
/* Table : PREVOIR                                              */
/*==============================================================*/
create table PREVOIR
(
   CODE_TYPE_________________________ varchar(20) not null,
   CODE_GARANTIE_____________________ varchar(50) not null,
   primary key (CODE_TYPE_________________________, CODE_GARANTIE_____________________)
);

/*==============================================================*/
/* Table : RISQUE                                               */
/*==============================================================*/
create table RISQUE
(
   NUM_RISQUE________________________ varchar(50) not null,
   DESIGNATION          varchar(100) not null,
   INFO_SUPLEMENTAIRE___ text,
   primary key (NUM_RISQUE________________________)
);

/*==============================================================*/
/* Table : TYPE_DE_CONTRAT                                      */
/*==============================================================*/
create table TYPE_DE_CONTRAT
(
   CODE_TYPE_________________________ varchar(20) not null,
   LIBELLE              varchar(50) not null,
   primary key (CODE_TYPE_________________________)
);

alter table CONTRAT add constraint FK_CARACTERISER foreign key (NUM_RISQUE________________________)
      references RISQUE (NUM_RISQUE________________________) on delete restrict on update restrict;

alter table CONTRAT add constraint FK_CONCLURE foreign key (NUM_CLIENT)
      references CLIENT (NUM_CLIENT) on delete restrict on update restrict;

alter table CONTRAT add constraint FK_COUVRIR foreign key (RIS_NUM_RISQUE________________________)
      references RISQUE (NUM_RISQUE________________________) on delete restrict on update restrict;

alter table DOSSIER_AUXILIAIRE add constraint FK_CONCERNER foreign key (CODE_GARANTIE_____________________)
      references GARANTIE (CODE_GARANTIE_____________________) on delete restrict on update restrict;

alter table INTERVENTION_INSPECTEUR add constraint FK_EFFECTUER foreign key (CODE_INSPECTEUR___________________)
      references INSPECTEUR (CODE_INSPECTEUR___________________) on delete restrict on update restrict;

alter table INTERVENTION_INSPECTEUR add constraint FK_LANCER foreign key (NUM_DOSSIER_______________________)
      references DOSSIER_AUXILIAIRE (NUM_DOSSIER_______________________) on delete restrict on update restrict;

alter table PREVOIR add constraint FK_PREVOIR foreign key (CODE_GARANTIE_____________________)
      references GARANTIE (CODE_GARANTIE_____________________) on delete restrict on update restrict;

alter table PREVOIR add constraint FK_PREVOIR2 foreign key (CODE_TYPE_________________________)
      references TYPE_DE_CONTRAT (CODE_TYPE_________________________) on delete restrict on update restrict;

