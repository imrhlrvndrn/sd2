CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    actor VARCHAR(255) NOT NULL,
    box_office_collection INT NOT NULL
);


INSERT INTO movies (id, title, director, genre, release_year, rating, actor, box_office_collection) VALUES
(1, 'Dangal', 'Nitesh Tiwari', 'Biography', 2016, 4.8, 'Aamir Khan', 220),
(2, 'Baahubali 2: The Conclusion', 'S.S. Rajamouli', 'Action', 2017, 4.7, 'Prabhas', 181),
(3, 'PK', 'Rajkumar Hirani', 'Comedy', 2014, 4.6, 'Aamir Khan', 140),
(4, 'Bajrangi Bhaijaan', 'Kabir Khan', 'Drama', 2015, 4.5, 'Salman Khan', 130),
(5, 'Sultan', 'Ali Abbas Zafar', 'Drama', 2016, 4.3, 'Salman Khan', 120),
(6, 'Sanju', 'Rajkumar Hirani', 'Biography', 2018, 4.4, 'Ranbir Kapoor', 120),
(7, 'Padmaavat', 'Sanjay Leela Bhansali', 'Drama', 2018, 4.2, 'Ranveer Singh', 112),
(8, '3 Idiots', 'Rajkumar Hirani', 'Comedy', 2009, 4.9, 'Aamir Khan', 202),
(9, 'Chennai Express', 'Rohit Shetty', 'Comedy', 2013, 4.0, 'Shah Rukh Khan', 100),
(10, 'War', 'Siddharth Anand', 'Action', 2019, 4.3, 'Hrithik Roshan', 100),
(11, 'Kabir Singh', 'Sandeep Reddy Vanga', 'Romance', 2019, 4.2, 'Shahid Kapoor', 80),
(12, 'Gully Boy', 'Zoya Akhtar', 'Drama', 2019, 4.4, 'Ranveer Singh', 75),
(13, 'Andhadhun', 'Sriram Raghavan', 'Thriller', 2018, 4.5, 'Ayushmann Khurrana', 60),
(14, 'Tumbbad', 'Rahi Anil Barve', 'Horror', 2018, 4.3, 'Sohum Shah', 50),
(15, 'Stree', 'Amar Kaushik', 'Comedy', 2018, 4.0, 'Rajkummar Rao', 60),
(16, 'Badhaai Ho', 'Amit Sharma', 'Comedy', 2018, 4.2, 'Ayushmann Khurrana', 45),
(17, 'Article 15', 'Anubhav Sinha', 'Drama', 2019, 4.6, 'Ayushmann Khurrana', 35),
(18, 'URI: The Surgical Strike', 'Aditya Dhar', 'Action', 2019, 4.7, 'Vicky Kaushal', 70);

      