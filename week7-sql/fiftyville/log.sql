-- Keep a log of any SQL queries you execute as you solve the mystery.


/*
     First we want the description of the crime that took place the 28-07-2024:
     Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
     Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. |
*/

SELECT description from crime_scene_reports WHERE day = 28 AND month = 07;

/*
Now we can check the interviews with the witnesses

| 161 | Ruth    | 2024 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away.
If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
                                                        |
| 162 | Eugene  | 2024 | 7     | 28  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery,
I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
                                                                                        |
| 163 | Raymond | 2024 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute.
In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
The thief then asked the person on the other end of the phone to purchase the flight ticket.

So according to the interviews the thiefs exited the bakery between 10:16 and 10:23.
The thief was at the ATM in the morning
There was a phone call regarding the purchase of flight tickets
*/

SELECT * from interviews WHERE day = 28 AND month = 07;


/*
Now we check the cars that exited the bakery between 10:16 y 10:23

+---------------+
| license_plate |
+---------------+
| 5P2BI95       |
| 94KL13X       |
| 6P58WS2       |
| 4328GD8       |
| G412CB7       |
| L93JTIZ       |
| 322W7JE       |
| 0NTHK55       |
+---------------+
*/
SELECT license_plate FROM bakery_security_logs WHERE year = 2024 AND month = 7 AND day = 28 AND hour = 10 AND minute BETWEEN 16 AND 23 AND activity = 'exit';



/*
    Check the people that used the ATM that same morning
    +---------+---------------+----------------+
    |  name   | license_plate |  phone_number  |
    +---------+---------------+----------------+
    | Bruce   | 94KL13X       | (367) 555-5533 |
    | Diana   | 322W7JE       | (770) 555-1861 |
    | Brooke  | QX4YZN3       | (122) 555-4581 |
    | Kenny   | 30G67EN       | (826) 555-1652 |
    | Iman    | L93JTIZ       | (829) 555-5269 |
    | Luca    | 4328GD8       | (389) 555-5198 |
    | Taylor  | 1106N58       | (286) 555-6063 |
    | Benista | 8X428L0       | (338) 555-6650 |
    +---------+---------------+----------------+
*/
SELECT people.name, people.license_plate, people.phone_number FROM people JOIN bank_accounts ON people.id = bank_accounts.person_id JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE atm_transactions.year = 2024 AND atm_transactions.month = 7 AND atm_transactions.day = 28 AND atm_location = 'Leggett Street' AND transaction_type = 'withdraw';


/*
    Check the people that withdrew money and exited the bakery
    +---------+---------------+----------------+
    |  name   | license_plate |  phone_number  |
    +---------+---------------+----------------+
    | Bruce   | 94KL13X       | (367) 555-5533 |
    | Diana   | 322W7JE       | (770) 555-1861 |
    | Brooke  | QX4YZN3       | (122) 555-4581 |
    | Kenny   | 30G67EN       | (826) 555-1652 |
    | Iman    | L93JTIZ       | (829) 555-5269 |
    | Luca    | 4328GD8       | (389) 555-5198 |
    | Taylor  | 1106N58       | (286) 555-6063 |
    | Benista | 8X428L0       | (338) 555-6650 |
    +---------+---------------+----------------+
*/
SELECT people.name, people.license_plate, people.phone_number FROM people JOIN bank_accounts ON people.id = bank_accounts.person_id JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE atm_transactions.year = 2024 AND atm_transactions.month = 7 AND atm_transactions.day = 28 AND atm_location = 'Leggett Street' AND transaction_type = 'withdraw';

/*
    Check the phonecalls that the thief makes on the day of the robbery
    +-----+----------------+----------------+------+-------+-----+----------+
    | id  |     caller     |    receiver    | year | month | day | duration |
    +-----+----------------+----------------+------+-------+-----+----------+
    | 233 | (367) 555-5533 | (375) 555-8161 | 2024 | 7     | 28  | 45       |
    +-----+----------------+----------------+------+-------+-----+----------+
*/
SELECT * FROM phone_calls WHERE year = 2024 AND month = 7 AND day = 28 AND duration < 60 AND caller = (SELECT phone_number FROM people WHERE name = 'Bruce');


/*
    Look at flights por that or the following day
    +----+-------------------+------------------------+------+--------+
    | id | origin_airport_id | destination_airport_id | hour | minute |
    +----+-------------------+------------------------+------+--------+
    | 36 | 8                 | 4                      | 8    | 20     |
    | 43 | 8                 | 1                      | 9    | 30     |
    | 23 | 8                 | 11                     | 12   | 15     |
    | 53 | 8                 | 9                      | 15   | 20     |
    | 18 | 8                 | 6                      | 16   | 0      |
    +----+-------------------+------------------------+------+--------+
*/
SELECT id, origin_airport_id, destination_airport_id, hour, minute FROM flights WHERE year = 2024 AND month = 7 AND day = 29 ORDER BY hour, minute;


/*
    Check the passengers of the flight
    +--------+
    |  name  |
    +--------+
    | Doris  |
    | Sofia  |
    | Bruce  |
    | Edward |
    | Kelsey |
    | Taylor |
    | Kenny  |
    | Luca   |
    +--------+
*/
SELECT people.name FROM passengers JOIN people ON passengers.passport_number = people.passport_number WHERE flight_id = 36;


/*
    Check where he escaped
    +---------------+
    |     city      |
    +---------------+
    | New York City |
    +---------------+
*/
SELECT city FROM airports WHERE id = (SELECT destination_airport_id FROM flights WHERE id = 36);

/*
    Check who bought the tickets
    +-------+
    | name  |
    +-------+
    | Robin |
    +-------+
*/

SELECT name FROM people WHERE phone_number = (SELECT receiver FROM phone_calls WHERE caller = (SELECT phone_number FROM people WHERE name = 'Bruce') AND duration < 60 AND year = 2024 AND month = 7 AND day = 28);
