PRAGMA foreign_keys = ON;

CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    passport TEXT NOT NULL UNIQUE,
    address TEXT NOT NULL,
    login TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    role TEXT NOT NULL DEFAULT 'resident'
);

CREATE TABLE apartment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    number TEXT NOT NULL UNIQUE,
    address TEXT NOT NULL,
    area REAL,
    user_id INTEGER UNIQUE,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE meter (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    serial_number TEXT NOT NULL UNIQUE,
    type TEXT NOT NULL,
    unit TEXT NOT NULL,
    apartment_id INTEGER NOT NULL,
    FOREIGN KEY (apartment_id) REFERENCES apartment(id)
);

CREATE TABLE reading (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    meter_id INTEGER NOT NULL,
    value REAL NOT NULL,
    period TEXT NOT NULL,
    FOREIGN KEY (meter_id) REFERENCES meter(id)
);

CREATE TABLE invoice (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    apartment_id INTEGER NOT NULL,
    period TEXT NOT NULL,
    amount REAL NOT NULL,
    status TEXT NOT NULL DEFAULT 'unpaid',
    FOREIGN KEY (apartment_id) REFERENCES apartment(id)
);