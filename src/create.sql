CREATE DOMAIN file_path AS TEXT CHECK (VALUE ~ '^(.*)\/([^\/]+)$');

CREATE DOMAIN email AS text CHECK (VALUE ~ '^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$');

CREATE DOMAIN my_money AS numeric(10, 2);

CREATE TYPE release_type AS ENUM (
	'single',
	'ep',
	'album',
	'mixtape'
);

CREATE TYPE access_type AS ENUM (
	'private',
	'sharable',
	'public'
);

CREATE TYPE deletion_reason_t AS ENUM (
	'ban',
	'voluntary' -- пользователь сам удалил свой аккаунт
);

CREATE TYPE payment_method AS ENUM (
	'card',
	'fps' -- СБП
);

CREATE TYPE payment_status AS ENUM (
	'pending',
	'completed',
	'failed'
);

CREATE TABLE songs (
	song_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	audio file_path NOT NULL UNIQUE,
	lyrics file_path,
	title text NOT NULL,
	duration_sec int NOT NULL,
	explicit boolean NOT NULL,
	publication_date date NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE genres (
	genre_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name text NOT NULL UNIQUE,
	description text
);

CREATE TABLE artists (
	artist_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name text NOT NULL,
	description text
);

CREATE TABLE labels (
	label_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name text NOT NULL,
	description text
);

CREATE TABLE releases (
	release_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	label_id int NOT NULL REFERENCES labels,
	title text NOT NULL,
	release_type release_type NOT NULL,
	publication_date date NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE users (
	user_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	subscription_auto_renewal boolean NOT NULL DEFAULT TRUE,
	name text NOT NULL,
	email email NOT NULL,
	password_hash text NOT NULL,
	registration_date date NOT NULL DEFAULT CURRENT_DATE,
	deleted boolean NOT NULL DEFAULT FALSE,
	deletion_reason deletion_reason_t,
	CHECK ((deleted) AND (deletion_reason IS NOT NULL) OR (NOT deleted) AND (deletion_reason IS NULL))
);

CREATE TABLE playlists (
	playlist_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	user_id int NOT NULL REFERENCES users ON DELETE CASCADE,
	title text NOT NULL,
	description text,
	access_type access_type NOT NULL
);

CREATE TABLE subscriptions (
	subscription_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name text NOT NULL,
	price my_money NOT NULL CHECK (price >= 0),
	duration interval NOT NULL
);

CREATE TABLE payments (
	payment_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	user_id int NOT NULL REFERENCES users,
	subscription_id int NOT NULL REFERENCES subscriptions,
	amount_paid my_money NOT NULL CHECK (amount_paid >= 0),
	method payment_method NOT NULL,
	status payment_status NOT NULL DEFAULT 'pending',
	dt timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE play_history (
	user_id int REFERENCES users,
	song_id int REFERENCES songs ON DELETE CASCADE,
	played_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	duration_sec int NOT NULL,
	PRIMARY KEY (user_id, song_id)
);

CREATE TABLE artist_songs (
	artist_id int REFERENCES artists,
	song_id int REFERENCES songs ON DELETE CASCADE,
	PRIMARY KEY (artist_id, song_id)
);

CREATE TABLE song_genres (
	song_id int REFERENCES songs,
	genre_id int REFERENCES genres ON DELETE CASCADE,
	PRIMARY KEY (song_id, genre_id)
);

CREATE TABLE song_releases (
	song_id int REFERENCES songs,
	release_id int REFERENCES releases ON DELETE CASCADE,
	track_no int CHECK (track_no > 0) NOT NULL,
	UNIQUE (release_id, track_no),
	PRIMARY KEY (song_id, release_id)
);

CREATE TABLE song_playlists (
	song_id int REFERENCES songs,
	playlist_id int REFERENCES playlists ON DELETE CASCADE,
	track_no int CHECK (track_no > 0) NOT NULL,
	UNIQUE (playlist_id, track_no),
	PRIMARY KEY (song_id, playlist_id)
);

CREATE TABLE user_labels (
	user_id int REFERENCES users,
	label_id int REFERENCES labels ON DELETE CASCADE,
	appointment_date date NOT NULL DEFAULT CURRENT_DATE,
	PRIMARY KEY (user_id, label_id)
);

CREATE TABLE user_artists (
	user_id int REFERENCES users,
	artist_id int REFERENCES artists ON DELETE CASCADE,
	nickname text NOT NULL,
	joining_date date NOT NULL DEFAULT CURRENT_DATE,
	PRIMARY KEY (user_id, artist_id)
);

CREATE INDEX ON releases (label_id);

CREATE UNIQUE INDEX ON users (lower(email));

CREATE INDEX ON playlists (user_id);

CREATE INDEX ON payments (user_id);

CREATE INDEX ON payments (subscription_id);

CREATE INDEX ON play_history (song_id);

CREATE INDEX ON artist_songs (song_id);

CREATE INDEX ON song_genres (genre_id);

CREATE INDEX ON song_releases (release_id);

CREATE INDEX ON song_playlists (playlist_id);

CREATE INDEX ON user_labels (label_id);

CREATE INDEX ON user_artists (artist_id);
