Minu esimene Urbanstyle päring
Nimi: Egely Kink
Kuupäev: 04.11.2026

Create table if not exists team_members (
    id serial primary key,
    name varchar (100) not null,
    role varchar (100),
    week int default now (),
);

INSERT INTO team_members (name, role, week)
values ('Egely Kink','Andmeanalüütik',0);

SELECT * FROM team_members ORDER BY joined_at;