
// Etape 1 create keyspace
CREATE KEYSPACE elections WITH replication = {'class' : 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE ADMINISTRE (
	NOM_A text PRIMARY KEY,
	PRENOM_A text,
	ADRESSE text,
	NIN varint 

);

CREATE TABLE CANDIDAT(
	NOM_P text,
	PRENOM_P text,
	PARTI_POLITIQUE text,
  NBR_VOTE int,
  PRIMARY KEY (PARTI_POLITIQUE, NBR_VOTE, NOM_P)
  
);


CREATE TABLE VOTE(
	NOM_A text,
	NOM_P text,
	PRIMARY KEY(NOM_A, NOM_P)
);



// CREER DES CANDIDATS

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Dupont', 'Jean', 'B', 43);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Mid', 'Jeanne', 'A', 64);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Quiche', 'Luc', 'C', 25);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Titi', 'Jean', 'B', 42);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Mad', 'Jeanne', 'A', 63);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Mud', 'Luc', 'C', 26);


// CREER DES ADMINISTRES

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Martin', 'Matin', '90 rue des etoiles 34000', 4);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Michelle', 'Jacques', '17 rue de la fontaine 23450', 6);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Guigui', 'Lucienne', '56 rue du faubourg 78900', 2);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Boun', 'Dany', '87 rue de la joie 87654', 9);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Joud', 'Jas', '6 rue de la chaud 12678', 1);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Nouille', 'Chine', '9 rue du passage 75900', 3);

// CREER DES VOTES

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Martin', 'Mud');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Guigui', 'Mad');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Boun', 'Titi');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Michelle', 'Quiche');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Joud', 'Mid');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Nouille', 'Dupont');



// Exercice 1:


// Q1:
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT GROUP BY PARTI_POLITIQUE;
SELECT parti_politique, sum(nbr_vote) FROM Candidat WHERE parti_politique='A' ALLOW FILTERING;

// Quand je lance la première ligne, ca ne me donne pas juste le parti politique qui a obtenu le plus de voix


// Q2:
SELECT NOM_P, PARTI_POLITIQUE, NBR_VOTE FROM CANDIDAT ORDER BY NBR_VOTE DESC;


// Q3:

CREATE TABLE gagnant_candidat (
    Nom_C text ,
    Prenom_C text,
    Parti_politique text,
    nbr_vote int,
    commune text,
    PRIMARY KEY (parti_politique,nbr_vote));

SELECT Nom_P, Prenom_P, Parti_politique, max(nbr_vote) from candidat where parti_politique='A';


// Exercice 2:

// Q1:

SELECT PARTI_POLITIQUE, SUM(NBR_VOTE)FROM gagnant_candidat GROUP BY PARTI_POLITIQUE='A';


//Q2:

SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM Candidat GROUP BY PARTI_POLITIQUE;
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM Candidat WHERE PARTI_POLITIQUE='B' ALLOW FILTERING;
