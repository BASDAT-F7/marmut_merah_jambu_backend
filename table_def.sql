CREATE TABLE PAKET (
  jenis VARCHAR(50) PRIMARY KEY,
  harga int NOT NULL
);

CREATE TABLE PLAYLIST (
    id uuid primary key
);

CREATE TABLE PEMILIK_HAK_CIPTA (
    id UUID primary key,
    rate_royalti int not null
);

CREATE TABLE TRANSACTION (
  id UUID,
  jenis_paket varchar(50),
  email varchar(50),
  timestamp_dimulai timestamp not null,
  timestamp_berakhir timestamp not null,
  metode_bayar varchar(50) not null,
  nominal int not null,
  PRIMARY KEY(id, jenis_paket, email),
  FOREIGN KEY(jenis_paket) REFERENCES PAKET (jenis) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(email) REFERENCES AKUN (email) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SONGWRITER (
  id UUID,
  email_akun varchar(50),
  id_pemilik_hak_cipta UUID,
  PRIMARY KEY(id),
  FOREIGN KEY(email_akun) REFERENCES AKUN(email) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_pemilik_hak_cipta) REFERENCES PEMILIK_HAK_CIPTA(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE USER_PLAYLIST (
  email_pembuat varchar(50),
  id_user_playlist UUID,
  judul varchar(100) not null,
  deskripsi varchar(500) not null,
  jumlah_lagu int not null,
  tanggal_dibuat date not null,
  id_playlist UUID,
  total_durasi int not null default 0,

  PRIMARY KEY(email_pembuat, id_user_playlist),
  FOREIGN KEY(email_pembuat) REFERENCES AKUN(email) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_playlist) REFERENCES PLAYLIST(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CHART (
  tipe varchar(50),
  id_playlist UUID,
  PRIMARY KEY(tipe),
  FOREIGN KEY(id_playlist) REFERENCES PLAYLIST(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE AKUN_PLAY_USER_PLAYLIST (

  email_pemain varchar(50),
  id_user_playlist UUID,
  email_pembuat varchar(50),
  waktu timestamp,

  PRIMARY KEY(email_pemain, id_user_playlist, email_pembuat, waktu),
  FOREIGN KEY(email_pemain) REFERENCES AKUN(email) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_user_playlist, email_pembuat) REFERENCES USER_PLAYLIST(id_user_playlist, email_pembuat) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ROYALTI (
  id_pemilik_hak_cipta UUID,
  id_song UUID,
  jumlah int not null,

  PRIMARY KEY(id_pemilik_hak_cipta, id_song),
  FOREIGN KEY(id_pemilik_hak_cipta) REFERENCES PEMILIK_HAK_CIPTA(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_song) REFERENCES SONG(id_konten) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SONGWRITER_WRITE_SONG (
  id_songwriter UUID,
  id_song UUID,
  PRIMARY KEY(id_songwriter, id_song),
  FOREIGN KEY(id_songwriter) REFERENCES SONGWRITER(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_song) REFERENCES SONG(id_konten) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE DOWNLOADED_SONG (
  id_song UUID,
  email_downloader varchar(50),
  PRIMARY KEY(id_song, email_downloader),
  FOREIGN KEY(id_song) REFERENCES SONG(id_konten) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(email_downloader) REFERENCES PREMIUM(email) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE AKUN_PLAY_SONG (
  email_pemain varchar(50),
  id_song UUID,
  waktu timestamp,
  PRIMARY KEY(email_pemain, id_song, waktu),
  FOREIGN KEY(email_pemain) REFERENCES AKUN(email) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_song) REFERENCES SONG(id_konten) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PLAYLIST_SONG (
  id_playlist UUID,
  id_song UUID,
  PRIMARY KEY(id_playlist, id_song),
  FOREIGN KEY(id_playlist) REFERENCES PLAYLIST(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(id_song) REFERENCES SONG(id_konten) ON UPDATE CASCADE ON DELETE CASCADE
);