
CREATE DATABASE medical_center;

\c medical_center

-- - A medical center employs several doctors
CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  hire_date DATE NOT NULL,
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  diseases TEXT NOT NULL,
);

-- - During a visit, a patient may be diagnosed to have one or more diseases.
CREATE TABLE diagnosed
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  diagnosed TEXT INTEGER REFERENCES diseases ON DELETE CASCADE,
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  primary_doctor INTEGER REFERENCES doctors ON DELETE NULL,
  secondary_doctor INTEGER REFERENCES doctors ON DELETE NULL,
);

-- - A patient can be seen by many doctors
-- - A doctors can see many patients
CREATE TABLE check_in
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors ON DELETE NULL,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  date_visited DATE NOT NULL,
);

