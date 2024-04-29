CREATE TABLE ARTIST (
                        id UUID PRIMARY KEY,
                        email_akun VARCHAR(50) NOT NULL,
                        id_pemilik_hak_cipta uuid,
                        FOREIGN KEY (email_akun) REFERENCES AKUN (email),
                        FOREIGN KEY (id_pemilik_hak_cipta) REFERENCES PEMILIK_HAK_CIPTA (id)
);

CREATE TABLE LABEL (
                       id UUID PRIMARY KEY,
                       nama VARCHAR(100) NOT NULL,
                       email VARCHAR(50) NOT NULL,
                       password VARCHAR(50) NOT NULL,
                       kontak VARCHAR(50) NOT NULL,
                       id_pemilik_hak_cipta UUID,
                       FOREIGN KEY (id_pemilik_hak_cipta) REFERENCES PEMILIK_HAK_CIPTA (id)
);

CREATE TABLE ALBUM (
                       id UUID PRIMARY KEY,
                       judul VARCHAR(100) NOT NULL,
                       jumlah_lagu INT NOT NULL DEFAULT 0,
                       id_label UUID,
                       total_durasi INT NOT NULL DEFAULT 0,
                       FOREIGN KEY (id_label) REFERENCES LABEL (id)
);

CREATE TABLE SONG (
                      id_konten UUID PRIMARY KEY,
                      id_artist UUID,
                      id_album UUID,
                      total_play INT NOT NULL DEFAULT 0,
                      total_download INT NOT NULL DEFAULT 0,
                      FOREIGN KEY (id_konten) REFERENCES KONTEN (id)
                          FOREIGN KEY (id_artist) REFERENCES ARTIST (id)
                          FOREIGN KEY (id_album) REFERENCES ALBUM (id)
);

