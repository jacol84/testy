-- 1. Tabela użytkowników
CREATE TABLE users (
                       id INT PRIMARY KEY,
                       first_name VARCHAR(50),
                       last_name VARCHAR(50),
                       email VARCHAR(100)
);

-- 2. Tabela kategorii
CREATE TABLE categories (
                            id INT PRIMARY KEY,
                            name VARCHAR(50) NOT NULL
);

-- 3. Tabela transakcji (powiązana z użytkownikami i kategoriami)
CREATE TABLE transactions (
                              id INT PRIMARY KEY,
                              user_id INT,
                              category_id INT,
                              amount VARCHAR(50),
                              status VARCHAR(20),
                              FOREIGN KEY (user_id) REFERENCES users(id),
                              FOREIGN KEY (category_id) REFERENCES categories(id)
);


INSERT INTO users VALUES
                      (1, 'Jan', 'Kowalski', 'jan@kowalski.pl'),
                      (2, 'Anna', 'Nowak', 'anna@nowak.pl');

INSERT INTO categories VALUES
                           (10, 'Elektronika'),
                           (20, 'Moda'),
                           (30, 'Sport');

INSERT INTO transactions VALUES
                             (1, 1, 10, '120.50', 'SUCCESS'), -- Jan kupił elektronikę
                             (2, 1, 20, '45.00', 'SUCCESS'),  -- Jan kupił modę
                             (3, 2, 30, NULL, 'SUCCESS'),      -- Anna, błędna kwota
                             (4, 2, 10, '300.00', 'FAILED'),   -- Anna, nieudana transakcja
                             (5, 2, 20, '15.99', 'SUCCESS');   -- Anna kupiła modę