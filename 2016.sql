 
1-

CREATE TABLE Participation(
 	NumParticipation int PRIMARY KEY AUTO_INCREMENT,
  	IdMembre int,
    IdFormation int,
    CONSTRAINT fk_formation FOREIGN KEY (IdFormation) REFERENCES Formation(IdFormation),
    CONSTRAINT fk_Membre FOREIGN KEY (IdMembre) REFERENCES Membre(IdMembre)
) ENGINE=INNODB;

2-
UPDATE formation SET FraisDeParticipation = FraisDeParticipation+(FraisDeParticipation*20/100) 
WHERE Duree > 5;

3-
SELECT COUNT(*) as Effectif FROM formation GROUP BY IdFormation; 

4-
SELECT * FROM membre where IdMembre NOT IN (SELECT IdMembre FROM participation);

5-
    SELECT NomMembre FROM membre NATURAL JOIN participation NATURAL JOIN formation 
    WHERE  Duree = (SELECT MAX(Duree) FROM formation);

# Instruction plsql
1-
DECLARE  VPART formation.FraisDeParticipation%TYPE;

2-
DECLARE VFORM formation%ROWTYPE;

3-
 SELECT FraisDeParticipation INTO VPART FROM formation WHERE IdFormation = 5;

4-
DECLARE CURFOM CURSOR FOR
    SELECT * FOR Formation;
OPEN CURFOM;
    FETCH CURFOM INTO VFORM;
CLOSE CURFOM;

5-
DECLARE VARDUREE formation.Duree%TYPE;
 
OPEN CURFOM
    FETCH CURFOM INTO VFORM;
    SELECT Duree INTO VARDUREE FROM VFORM;
CLOSE CURFOM; 







