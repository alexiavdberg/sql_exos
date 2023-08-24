CREATE TABLE T_MAINTENANCE_MTN(
    [Jour] CHAR(3) NOT NULL,
    [Machine] VARCHAR(30) NOT NULL,
    [Numero] INT NOT NULL CONSTRAINT PK_MNT UNIQUE,
    [Vitesse] TINYINT,
    [Temperature] TINYINT,
    [Heure] TIME NOT NULL,
    [Evenement] VARCHAR(30) NOT NULL,
    CONSTRAINT PK_MTN PRIMARY KEY ([Numero]),
    CONSTRAINT UK_MTN_Numero UNIQUE ([Numero]),
    CONSTRAINT UK_MNT_JourHeure UNIQUE ([Jour], [Heure]),
    CONSTRAINT CK_MTN_Vitesse CHECK ([Vitesse] >= 0),
    CONSTRAINT CK_MTN_Temperature CHECK ([Temperature] BETWEEN 0 and 100),
    CONSTRAINT CK_MTN_Heure CHECK ([Heure] BETWEEN '9:00:00' and '17:00:00'),
    CONSTRAINT CK_MTN_Jour CHECK ([Jour] in ('Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'))
)