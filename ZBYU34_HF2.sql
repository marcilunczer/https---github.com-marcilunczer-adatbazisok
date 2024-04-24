CREATE TABLE VENDEG
(MemberID INT IDENTITY PRIMARY KEY,
USERNEV varchar(100),
NEV varchar(100) MASKED WITH (Function = 'partial(1,"XXX",1)'),
Email varchar(100) MASKED WITH (function = 'email()'),
SZAML_CIM varchar(100) MASKED WITH (Function = 'default()'),
KOR int MASKED WITH (Function = 'random(1,5)'),
)

INSERT INTO VENDEG
(USERNEV, NEV, Email,SZAML_CIM,KOR)
VALUES
('Peti','Péter','peti@gmail.com','Király utca 2',19),
('Gabi','Gábor','gabi@somewhere.lk','Király utca 2',20),
('Marci','Marcell','marci@uniersity.edu.org','Király utca 2',21),
('Berni','Bernadett','berni@rose.lk','Király utca 2',22)

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON VENDEG TO MaskUser

EXECUTE AS User= 'MaskUser';
SELECT * FROM VENDEG
REVERT
