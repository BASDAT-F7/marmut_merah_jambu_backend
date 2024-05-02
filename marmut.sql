CREATE TABLE AKUN(
	email VARCHAR(50) PRIMARY KEY,
	password VARCHAR(50) NOT NULL,
	nama VARCHAR(100) NOT NULL,
	gender INTEGER NOT NULL,
	tempat_lahir VARCHAR(50) NOT NULL,
	tanggal_lahir DATE NOT NULL,
	is_verified BOOLEAN NOT NULL,
	kota_asal VARCHAR(50) NOT NULL
);

CREATE TABLE NON_PREMIUM(
	email VARCHAR(50) PRIMARY KEY,
	FOREIGN KEY(email) REFERENCES AKUN(email) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PREMIUM(
	email VARCHAR(50) PRIMARY KEY,
	FOREIGN KEY(email) REFERENCES AKUN(email) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PODCASTER(
	email VARCHAR(50) PRIMARY KEY,
	FOREIGN KEY(email) REFERENCES AKUN (email) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PODCAST(
	id_konten UUID PRIMARY KEY,
	email_podcaster VARCHAR(50),
	FOREIGN KEY(id_konten) REFERENCES KONTEN(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(email_podcaster) REFERENCES PODCASTER(email) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE KONTEN(
    id UUID PRIMARY KEY,
    judul VARCHAR(100) NOT NULL,
    tanggal_rilis DATE NOT NULL,
    tahun INTEGER NOT NULL,
    durasi INTEGER NOT NULL
);

CREATE TABLE GENRE(
    id_konten UUID,
    genre VARCHAR(50),
    PRIMARY KEY(id_konten, genre),
    FOREIGN KEY(id_konten) REFERENCES KONTEN (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE EPISODE(
    id_episode UUID PRIMARY KEY,
    id_konten_podcast UUID,
    judul VARCHAR(100) NOT NULL,
    deskripsi VARCHAR(500) NOT NULL,
    durasi INTEGER NOT NULL,
    tanggal_rilis DATE NOT NULL,
    FOREIGN KEY(id_konten_podcast) REFERENCES PODCAST (id_konten) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO KONTEN VALUES ('a65345df-b0d3-454b-acf0-122c97f0f1ae','Anything You Want','2023-05-26 00:00:00',2023,4),
	('d4af5b64-3bac-47d2-b18c-c635bd844fe6','Alexandra','2019-08-30 00:00:00',2019,4),
	('5b282d63-8146-4af0-9ffb-d3609372a008','Am I Bothering You?','2023-05-26 00:00:00',2023,4),
	('bfb1d70d-1d30-463d-9631-79d7cd94644f','Is It the Answer','2017-08-19 00:00:00',2017,4),
	('8041b7c9-af83-4c61-be8b-aa1198803b2b','Love Epiphany','2023-05-26 00:00:00',2023,5),
	('cff0aaeb-57ad-4585-85f9-5a2b7b537fec','2112','2019-08-30 00:00:00',2019,6),
	('1ffe4bc3-9b0e-46ae-a4c7-3f49def72c74','A Sorrowful Reunion','2019-08-30 00:00:00',2019,4),
	('2550eeed-ff38-4695-8d0e-5598e3f7746d','Telenovia','2019-08-30 00:00:00',2019,5),
	('bca44f1a-0ca5-4171-9b73-886ee784f6ea','Elastic Hearts','2017-08-19 00:00:00',2017,4),
	('f01020a2-1046-4def-8c8c-57f257935164','Drunk text','2023-02-10 00:00:00',2023,3),
	('0069e974-fd2a-4214-8e1e-a42c6a87546b','Easily','2016-11-25 00:00:00',2016,3),
	('c4049bcb-5504-4156-aff2-5c5bdd1a3761','Home','2016-12-23 00:00:00',2016,3),
	('17cb6677-1739-4082-84ca-5e1ac39b83ad','Fair-Weather Friend','2017-05-04 00:00:00',2017,3),
	('1ae47aa3-5cd3-4d71-b20b-4bfff920cea2','The Most Beautiful Thing','2020-05-01 00:00:00',2020,4),
	('ff975a2f-9d4f-4c54-938a-1f5f850b0b8a','Nothing','2019-09-12 00:00:00',2019,2),
	('1e8020d7-a962-490b-8d4e-949b3e3244e9','Jurus Rahasia Teleport','2012-05-17 00:00:00',2012,3),
	('8868a7ff-d1be-4ace-a0de-f3b2050023a7','Rapsodi','2020-01-09 00:00:00',2020,4),
	('5eb93ec5-319c-40db-9912-86d6263ee73f','Bersepeda Berdua','2012-05-17 00:00:00',2012,5),
	('f34496a3-1eef-4141-bbd7-5ea8abbfb412','Jiwaru Days','2022-02-20 00:00:00',2022,5),
	('a4ba7411-5790-49c9-b397-8d940c12c40e','Eureka Milik Kita','2022-11-18 00:00:00',2022,4),
	('8ba569dc-0e5e-4961-bc97-b2fc2f551a05','Shonichi','2012-05-17 00:00:00',2012,4),
	('8b742b3e-2e52-4d3d-917b-4a8edc68cc5c','Love wins all','2024-01-24 00:00:00',2024,4),
	('41056f89-f00b-41a8-b3e3-75d726bd3cdf','Blueming','2019-11-18 00:00:00',2019,3),
	('d6b564ab-982f-4681-8a89-96081c53822f','BBIBBI','2018-10-10 00:00:00',2018,3),
	('02180e51-54a3-4c51-8d7c-f08bdec8bb00','LILAC','2021-05-25 00:00:00',2021,3),
	('ebccf8ce-97bf-4c1f-8d50-6fe33c64c5b0','Pink Venom','2022-08-19 00:00:00',2022,3),
	('2e081fba-b234-4eec-8ba8-0fbefa212fe6','How You Like That','2020-06-26 00:00:00',2020,3),
	('5f695c06-564f-4ba6-9057-a149f2e81b74','Shut Down','2022-09-16 00:00:00',2022,3),
	('ff914af6-628a-48b1-9d93-2b7d57354c76','Kill This Love','2019-04-05 00:00:00',2019,3),
	('ddb50e99-0653-4278-832e-af79b50aed6e','Cincin','2023-07-07 00:00:00',2023,4),
	('4242523d-6d14-4efd-bb6e-6db097549a88','Berdansalah, Karir Ini Tak Ada Artinya','2023-07-21 00:00:00',2023,3),
	('195966b4-88d5-41b0-9634-8a6951270dbf','Secukupnya','2019-05-03 00:00:00',2019,3),
	('bfc49895-4e1f-43ee-966f-be88b4ad915c','Evaluasi','2019-03-22 00:00:00',2019,3),
	('b9173dd8-5219-4900-b3de-e3841ec76abd','Take A Chance With Me','2022-08-12 00:00:00',2022,5),
	('67abec76-8b5b-4f7c-a3fb-48178adc2dad','Backburner','2022-08-12 00:00:00',2022,4),
	('8baf1da1-ae80-484f-9881-7e3877cecadf','High School in Jakarta','2022-08-05 00:00:00',2022,3),
	('fe70428a-349d-4353-a0a2-761a4806d913','Anaheim','2022-08-12 00:00:00',2022,4),
	('d0c91949-8127-4ed0-a3e9-66d0480dba30','Vampire','2023-06-30 00:00:00',2023,3),
	('1b3f21aa-bb46-4c31-bada-46bb863605d9','Drivers license','2021-01-08 00:00:00',2021,4),
	('37b4ae2a-c41c-4d51-9cee-e1658b7158b5','Happier','2021-05-21 00:00:00',2021,3),
	('28e9e354-7516-458f-9486-f05b6de8e5a5','So american','2024-03-22 00:00:00',2024,2),
	('849d96e7-d0e6-4622-9e76-910f95282fe7','So Long, London','2024-04-19 00:00:00',2024,4),
	('b8b85e2d-e15c-4164-93ca-95d3a19065e3','I Can Do It With a Broken Heart','2024-04-19 00:00:00',2024,3),
	('479eb7f8-3fd8-44d6-83a2-21b4b9f1e6aa','Down bad','2024-04-19 00:00:00',2024,4),
	('f8849fd1-ad68-40e0-b4c4-59f2c0b30c00','The Story Of Us (Taylor''s Version)','2023-07-07 00:00:00',2023,4),
	('09a0dce7-b7c7-442e-92ae-19efc8e0ff2d','Labyrinth','2022-10-21 00:00:00',2022,4),
	('73b0d63e-60b9-4200-8d29-61e6c0703131','New Jeans','2023-07-07 00:00:00',2023,1),
	('b071f7ce-8175-42be-89bf-872ddd085fae','Super Shy','2023-07-07 00:00:00',2023,2),
	('6d1db724-e442-4112-89e1-bd4c0eba7121','Mungkin Takut Perubahan','2021-03-26 00:00:00',2021,3),
	('2d7cbf51-35c8-49e9-bef9-af36449bc00f','Kami Belum tentu','2018-09-13 00:00:00',2018,4),
	('94fbb145-f819-49a8-ad01-79b040d36f68','Rintik Sedu','2020-02-16 00:00:00',2020,260),
	('4900c472-2794-4ba8-8cb3-3dd03086fd68','Pengembangan Diri','2020-02-10 00:00:00',2020,540),
	('292b474e-2c6c-48f3-95de-84ebf8bd14fb','Podcast Raditya Dika','2019-04-25 00:00:00',2019,450),
	('c361b55a-dc8d-46b6-8a97-93fa7df0a3ac','AGAK LAEN!','2021-04-26 00:00:00',2021,350),
	('829027cb-4eee-4435-88c2-fdefb5069ca0','PODKESMAS','2021-09-21 00:00:00',2021,240),
	('7bb29c3c-1002-4da5-9c33-4acef03d2b95','I Apologise If You Feel Something','2019-01-25 00:00:00',2019,2),
	('19612ad1-f12c-4f27-bed6-7aa80d774794','Mantra','2019-08-21 00:00:00',2019,4),
	('172f3b2a-02e0-4951-8164-80868f77da57','Nihilist Blues (featuring Grimes)','2019-01-24 00:00:00',2019,5),
	('318128b6-1b89-4309-9964-f7917267b24f','In the Dark','2019-01-25 00:00:00',2019,4),
	('ca97c11b-e128-4634-88a1-829bad2a308d','Wonderful Life (featuring Dani Filth)','2019-10-21 00:00:00',2019,4),
	('82e0800a-2bcf-4fd4-b3e4-8fdd4a816f80','Ouch','2019-01-25 00:00:00',2019,2),
	('b4a0fb67-a893-42a9-a00e-406913fa1f53','Medicine','2019-01-03 00:00:00',2019,3),
	('1c51e2c7-14fa-4906-8735-9331d4c12ce0','Sugar Honey Ice & Tea','2019-01-25 00:00:00',2019,4),
	('5c804e41-0fca-4c96-9900-06dd940d6400','Why You Gotta Kick Me When I''m Down?','2019-01-25 00:00:00',2019,4),
	('bc1e3e0d-ccc5-40fe-900c-cd827f0e0f6e','Fresh Bruises','2019-01-25 00:00:00',2019,3),
	('5b0ca1bf-87d9-4b74-992b-e4d514e13b90','Mother Tongue','2019-01-22 00:00:00',2019,3),
	('b94a3542-57a8-45fc-93b7-86c14ea676b3','Heavy Metal (featuring Rahzel)','2019-01-25 00:00:00',2019,4),
	('c649beb1-0f35-4a31-b7d7-5e26d7ef5433','I Don''t Know What to Say','2019-01-25 00:00:00',2019,6),
	('1d0e54a8-ebd4-4d68-9dfa-e91bb4a060ed','The End.','2006-10-23 00:00:00',2006,2),
	('7bab316a-2663-4875-a085-dd132f97a77e','Dead!','2006-10-23 00:00:00',2006,3),
	('6e16d494-4a47-44e6-9166-9eb5105b2cb9','This Is How I Disappear','2006-10-23 00:00:00',2006,4),
	('71666064-8bd7-46de-9470-4707a1fa980d','The Sharpest Lives','2006-10-23 00:00:00',2006,3),
	('4423a438-ad9c-490c-8066-cafd27274067','Welcome to the Black Parade','2006-09-12 00:00:00',2006,5),
	('929a4c7e-4c89-4fc9-885a-46e8257a6a22','I Don''t Love You','2006-10-23 00:00:00',2006,4),
	('e2b909d7-b8a4-4ef5-81e0-bf85f3da5a7a','House of Wolves','2006-10-23 00:00:00',2006,2),
	('e4b3bf63-d722-4349-8dd8-b61603538a36','Cancer','2006-10-23 00:00:00',2006,2),
	('b7f0a083-dcd3-4c40-a25a-e184ec2cdc36','Mama (featuring Liza Minnelli)','2006-10-24 00:00:00',2006,4),
	('0b03bca1-8666-4de0-8701-8d88d59ada83','Sleep','2006-10-23 00:00:00',2006,4),
	('87d4dc84-272e-4e74-bcf3-196df3e5d5a7','Teenagers','2006-07-09 00:00:00',2006,2),
	('0bd1d807-a6e4-4792-b22f-d10c0e3ae61b','Disenchanted','2006-10-23 00:00:00',2006,5),
	('e83e0440-70ea-41bd-8524-564e620f527a','Famous Last Words','2006-01-22 00:00:00',2006,5),
	('70763e28-0aca-4327-a2a6-beac8600d4b6','Blood','2006-10-23 00:00:00',2006,3);

INSERT INTO GENRE VALUES ('a65345df-b0d3-454b-acf0-122c97f0f1ae','Indie Pop'),
	('d4af5b64-3bac-47d2-b18c-c635bd844fe6','Indie Rock'),
	('5b282d63-8146-4af0-9ffb-d3609372a008','Indie Pop'),
	('bfb1d70d-1d30-463d-9631-79d7cd94644f','Alternative Rock'),
	('8041b7c9-af83-4c61-be8b-aa1198803b2b','Indie Pop'),
	('cff0aaeb-57ad-4585-85f9-5a2b7b537fec','Indie Pop'),
	('1ffe4bc3-9b0e-46ae-a4c7-3f49def72c74','Indie Pop'),
	('2550eeed-ff38-4695-8d0e-5598e3f7746d','Indie Pop'),
	('bca44f1a-0ca5-4171-9b73-886ee784f6ea','Alternative Rock'),
	('f01020a2-1046-4def-8c8c-57f257935164','Pop'),
	('0069e974-fd2a-4214-8e1e-a42c6a87546b','R&B'),
	('c4049bcb-5504-4156-aff2-5c5bdd1a3761','R&B'),
	('17cb6677-1739-4082-84ca-5e1ac39b83ad','R&B'),
	('1ae47aa3-5cd3-4d71-b20b-4bfff920cea2','R&B'),
	('ff975a2f-9d4f-4c54-938a-1f5f850b0b8a','R&B'),
	('1e8020d7-a962-490b-8d4e-949b3e3244e9','J-pop'),
	('8868a7ff-d1be-4ace-a0de-f3b2050023a7','Pop'),
	('5eb93ec5-319c-40db-9912-86d6263ee73f','J-pop'),
	('f34496a3-1eef-4141-bbd7-5ea8abbfb412','J-pop'),
	('a4ba7411-5790-49c9-b397-8d940c12c40e','J-pop'),
	('8ba569dc-0e5e-4961-bc97-b2fc2f551a05','J-pop'),
	('8b742b3e-2e52-4d3d-917b-4a8edc68cc5c','K-pop'),
	('41056f89-f00b-41a8-b3e3-75d726bd3cdf','K-pop'),
	('d6b564ab-982f-4681-8a89-96081c53822f','K-pop'),
	('02180e51-54a3-4c51-8d7c-f08bdec8bb00','K-pop'),
	('ebccf8ce-97bf-4c1f-8d50-6fe33c64c5b0','K-pop'),
	('2e081fba-b234-4eec-8ba8-0fbefa212fe6','K-pop'),
	('5f695c06-564f-4ba6-9057-a149f2e81b74','K-pop'),
	('ff914af6-628a-48b1-9d93-2b7d57354c76','K-pop'),
	('ddb50e99-0653-4278-832e-af79b50aed6e','Pop Rock'),
	('4242523d-6d14-4efd-bb6e-6db097549a88','Pop Rock'),
	('195966b4-88d5-41b0-9634-8a6951270dbf','Electropop'),
	('bfc49895-4e1f-43ee-966f-be88b4ad915c','Pop Rock'),
	('b9173dd8-5219-4900-b3de-e3841ec76abd','Alternative Pop'),
	('67abec76-8b5b-4f7c-a3fb-48178adc2dad','Alternative Pop'),
	('8baf1da1-ae80-484f-9881-7e3877cecadf','Alternative Pop'),
	('fe70428a-349d-4353-a0a2-761a4806d913','Alternative Pop'),
	('d0c91949-8127-4ed0-a3e9-66d0480dba30','Pop'),
	('1b3f21aa-bb46-4c31-bada-46bb863605d9','Pop'),
	('37b4ae2a-c41c-4d51-9cee-e1658b7158b5','Pop'),
	('28e9e354-7516-458f-9486-f05b6de8e5a5','Pop'),
	('849d96e7-d0e6-4622-9e76-910f95282fe7','Synth-pop'),
	('b8b85e2d-e15c-4164-93ca-95d3a19065e3','Electropop'),
	('479eb7f8-3fd8-44d6-83a2-21b4b9f1e6aa','Pop'),
	('f8849fd1-ad68-40e0-b4c4-59f2c0b30c00','Country pop'),
	('09a0dce7-b7c7-442e-92ae-19efc8e0ff2d','Synth-pop'),
	('73b0d63e-60b9-4200-8d29-61e6c0703131','K-pop'),
	('b071f7ce-8175-42be-89bf-872ddd085fae','K-pop'),
	('6d1db724-e442-4112-89e1-bd4c0eba7121','Indie Rock'),
	('2d7cbf51-35c8-49e9-bef9-af36449bc00f','Indie Rock'),
	('94fbb145-f819-49a8-ad01-79b040d36f68','Self improvement'),
	('4900c472-2794-4ba8-8cb3-3dd03086fd68','Self improvement'),
	('292b474e-2c6c-48f3-95de-84ebf8bd14fb','Comedy'),
	('c361b55a-dc8d-46b6-8a97-93fa7df0a3ac','Comedy'),
	('829027cb-4eee-4435-88c2-fdefb5069ca0','Comedy'),
	('7bb29c3c-1002-4da5-9c33-4acef03d2b95','Alternative Metal'),
	('19612ad1-f12c-4f27-bed6-7aa80d774794','Alternative Metal'),
	('172f3b2a-02e0-4951-8164-80868f77da57','Alternative Metal'),
	('318128b6-1b89-4309-9964-f7917267b24f','Alternative Metal'),
	('ca97c11b-e128-4634-88a1-829bad2a308d','Alternative Metal'),
	('82e0800a-2bcf-4fd4-b3e4-8fdd4a816f80','Alternative Metal'),
	('b4a0fb67-a893-42a9-a00e-406913fa1f53','Alternative Metal'),
	('1c51e2c7-14fa-4906-8735-9331d4c12ce0','Alternative Metal'),
	('5c804e41-0fca-4c96-9900-06dd940d6400','Alternative Metal'),
	('bc1e3e0d-ccc5-40fe-900c-cd827f0e0f6e','Alternative Metal'),
	('5b0ca1bf-87d9-4b74-992b-e4d514e13b90','Alternative Rock'),
	('b94a3542-57a8-45fc-93b7-86c14ea676b3','Alternative Rock'),
	('c649beb1-0f35-4a31-b7d7-5e26d7ef5433','Alternative Rock'),
	('1d0e54a8-ebd4-4d68-9dfa-e91bb4a060ed','Alternative Rock'),
	('7bab316a-2663-4875-a085-dd132f97a77e','Alternative Rock'),
	('6e16d494-4a47-44e6-9166-9eb5105b2cb9','Alternative Rock'),
	('71666064-8bd7-46de-9470-4707a1fa980d','Alternative Rock'),
	('4423a438-ad9c-490c-8066-cafd27274067','Alternative Rock'),
	('929a4c7e-4c89-4fc9-885a-46e8257a6a22','Hard Rock'),
	('e2b909d7-b8a4-4ef5-81e0-bf85f3da5a7a','Hard Rock'),
	('e4b3bf63-d722-4349-8dd8-b61603538a36','Hard Rock'),
	('b7f0a083-dcd3-4c40-a25a-e184ec2cdc36','Hard Rock'),
	('0b03bca1-8666-4de0-8701-8d88d59ada83','Hard Rock'),
	('87d4dc84-272e-4e74-bcf3-196df3e5d5a7','Hard Rock'),
	('0bd1d807-a6e4-4792-b22f-d10c0e3ae61b','Hard Rock'),
	('e83e0440-70ea-41bd-8524-564e620f527a','Hard Rock'),
	('70763e28-0aca-4327-a2a6-beac8600d4b6','Hard Rock');

INSERT INTO EPISODE VALUES ('c530200d-e142-437f-9b1e-383e9eb61066','94fbb145-f819-49a8-ad01-79b040d36f68','interaksi diri.#berKata','kita banyak bicara sama orang tentang semua hal, tapi kita minim interaksi sama diri sendiri,
dan itu yang bikin kita jadi sering salah ngerti. dan di episode ini, aku kasih resep rahasianya.',8,'2024-01-26 00:00:00'),
	('3d671e8f-e8d5-4e1d-b5f0-d0641af22061','94fbb145-f819-49a8-ad01-79b040d36f68','biarkan tumbuh.#berKata','Growing up is hard, but it would be harder if we didn''t grow up at all. Cause this year i have 
encountered many things that have grown and changed into forms that may not be familiar, but 
have been a nice direction. And i think you should try it too.',10,'2023-12-15 00:00:00'),
	('a3606052-7db0-4661-b8b0-d55e1ff7d5b3','c361b55a-dc8d-46b6-8a97-93fa7df0a3ac','Agak Laen!Versi:Ke Amerika','S4E12. Komandan sudah kembali! Kami mau cerita gimana pilem kami bisa sampe negeri Tulang
Sam. Selamat menikmati, mauliate',59,'2024-03-23 00:00:00'),
	('df9db598-44d7-4a11-87f9-ff7ec173cbdf','c361b55a-dc8d-46b6-8a97-93fa7df0a3ac','Agak Laen!Versi:Numpang','S4E10. Mumpung lagi numpang di Studio ketua Bene sang tiktoker, kami mau cerita pengalaman
numpang kami. Selamat menikmati, Mauliate',65,'2024-03-09 00:00:00'),
	('7a2d1cc1-1129-41c1-b68c-5f31683f038f','c361b55a-dc8d-46b6-8a97-93fa7df0a3ac','Agak Laen!Versi: Penjaga Kos','S4E7. Ketua dan Komandan mau nostalgia cerita mereka jaman masih ngekos. Selamat
mendengarkan!',69,'2024-02-17 00:00:00'),
	('a19cd8dc-2e6e-4668-9bd7-80d8a7593681','829027cb-4eee-4435-88c2-fdefb5069ca0','Kalau Ada Yang Nanya Darto 
Ngejar Atau Engga, Ini Ngejar 
Banget Ya','S11E20 Drama bapak-bapak di era teknologi ini, ketika ngetik di whatsapp pake titik-titik, voice note 
sampe ada yang lupa bales, tau kan siapa dia? nih dengerin Masyarakat',18,'2024-03-28 00:00:00'),
	('104ab562-6140-4391-b092-80b8cde242f3','829027cb-4eee-4435-88c2-fdefb5069ca0','Big Match : Darto Si Ngeselin
VS Omesh Si Gamau Kalah','S11E17 Perkara bahas cincin ngakaknya sampe sakit perut, minimal apresiasi dulu ngapa To, jangan
dar der dor gini konsenya',20,'2024-03-18 00:00:00'),
	('d4c98212-4e95-424a-85f6-b38a6e43914e','292b474e-2c6c-48f3-95de-84ebf8bd14fb','Kangen Main DnD','Raditya Dika ngobrol bareng Pandu Winoto dan Rais Marasabessy tentang kangan dengan karakter
pertama main DnD',47,'2024-02-16 00:00:00'),
	('4d01e896-5d84-4897-9249-f905579e4b15','292b474e-2c6c-48f3-95de-84ebf8bd14fb','Bikin Podcast di Bandung','Raditya Dika ngobrol barang Rais Marasabessy tentang kenapa mereka ada di Bandung dan 
membahas Spotify Wrapped
',58,'2023-12-20 00:00:00'),
	('985e88d5-a0d5-41f2-a49e-5845698789e3','4900c472-2794-4ba8-8cb3-3dd03086fd68','Prinsip Negosiasi Penting dalam 
Dunia Kerja','Untuk bisa mendapatkan yang kita inginkan, namun berbenturan dengan apa yang diinginkan orang 
lain, kita perlu menerapkan prinsip negosiasi ini!',5,'2022-07-17 00:00:00');