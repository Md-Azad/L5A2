### NB: I used google translate to make the answers in Bangla. Since I am not comfortable writing bangla in my computer. That is why I kept the English version for better understanding since google translator sometimes translates with unconventional words.

## What is Postgresql?

-- PostgreSQL is a powerfull and open-source relation database management system. It is known for it's scalibility, modern features and reliability. SQL commands supports and JSON querying make it one of the best choice for complex data operations. It is one of the best selection to developers and big tech indrustries for secure, robust, extensibility, and ACID compliance.

-- PostgreSQL একটি শক্তিশালী এবং ওপেন-সোর্স রিলেশন ডাটাবেস ম্যানেজমেন্ট সিস্টেম। এটি এর স্কেলিবিলিটি, আধুনিক বৈশিষ্ট্য এবং নির্ভরযোগ্যতার জন্য পরিচিত। SQL কমান্ড সাপোর্ট এবং JSON কোয়েরি এটিকে জটিল ডেটা অপারেশনের জন্য সেরা পছন্দগুলির মধ্যে একটি করে তোলে। এটি নিরাপদ, শক্তিশালী, এক্সটেনসিবিলিটি এবং ACID সম্মতির জন্য ডেভেলপার এবং বড় প্রযুক্তি শিল্পের জন্য সেরা নির্বাচনগুলির মধ্যে একটি।

## Explain the Primary Key and Foreign Key concepts in PostgreSQL.

-- A primary key is a unique identifier for a table that helps to identify or find a row of the table. Primay key could not be null or empty. For example, a table named user has 5 user's data and their primary key 1 to 5 respectively. In addition, again assume user table has to users named 'Jabed' with primary key 2 and 5. Now the primary key will helps to find required 'jabed' since primary key dublication is not allowed;

-- Foreign Key is a field that indicated or references another table's primary key. Foreign key is allowed to be dublicate use as a Foreign Key. It helps us to make a relation with another table. In addition, improves query performance with indexing.

-- একটি প্রাইমারি কী হল একটি টেবিলের জন্য একটি অনন্য শনাক্তকারী যা টেবিলের একটি সারি সনাক্ত করতে বা খুঁজে পেতে সাহায্য করে। প্রাইমারি কী শূন্য বা খালি থাকতে পারে না। উদাহরণস্বরূপ, ব্যবহারকারী নামের একটি টেবিলে 5 জন ব্যবহারকারীর ডেটা রয়েছে এবং তাদের প্রাথমিক কীগুলি যথাক্রমে 1 থেকে 5। এছাড়াও, আবার ধরে নিন যে ব্যবহারকারীর টেবিলে 'Jabed' নামে দুটি ব্যবহারকারী রয়েছে যার প্রাথমিক কী 2 এবং 5 রয়েছে। এখন প্রাথমিক কী প্রয়োজনীয় 'jabed' খুঁজে পেতে সাহায্য করবে কারণ প্রাথমিক কী ডুপ্লিকেশন অনুমোদিত নয়;

-- একটি বিদেশী কী হল এমন একটি ক্ষেত্র যা অন্য টেবিলের প্রাথমিক কী নির্দেশ করে বা উল্লেখ করে। একটি বিদেশী কী ডুপ্লিকেট করা এবং একটি বিদেশী কী হিসাবে ব্যবহার করা অনুমোদিত। এটি আমাদের অন্য টেবিলের সাথে সম্পর্ক তৈরি করতে সহায়তা করে। এছাড়াও, সূচীকরণের মাধ্যমে ক্যোয়ারী কর্মক্ষমতা উন্নত করে।

## What are the LIMIT and OFFSET clauses used for?

-- LIMIT is used for constraining the amount of data witll be return to the client and a query result. Besicly, used for implementing pagination and fetching a part of data.
-- OFFSET allows us to tell the database to skip a certain amound of data. This is also used to pagination implementation.

-- ক্লায়েন্টে ফিরে আসা ডেটার পরিমাণ এবং একটি কোয়েরি ফলাফল সীমাবদ্ধ করার জন্য LIMIT ব্যবহার করা হয়। মূলত, পৃষ্ঠাঙ্কন বাস্তবায়ন এবং ডেটার একটি অংশ আনার জন্য ব্যবহৃত হয়।
-- OFFSET আমাদের ডেটাবেসকে নির্দিষ্ট পরিমাণে ডেটা এড়িয়ে যেতে বলার অনুমতি দেয়। এটি পৃষ্ঠাঙ্কন বাস্তবায়নের জন্যও ব্যবহৃত হয়।

## Explain the purpose of the WHERE clause in a SELECT statement.

-- WHERE clause is used to impose conditions in the SELECT statement. Using the WHERE condition in a SELECT statement, we can filter and get only data that meets the condition. The benefit of using WHERE is that the query takes less time since it only returns its condition-satisfied data.

-- SELECT স্টেটমেন্টে শর্ত আরোপ করার জন্য WHERE ক্লজ ব্যবহার করা হয়। SELECT স্টেটমেন্টে WHERE কন্ডিশন ব্যবহার করে আমরা ডেটা ফিল্টার করতে পারি এবং কেবলমাত্র সেই ডেটা পেতে পারি যা শর্ত পূরণ করে। WHERE ব্যবহারের সুবিধা হল যে কোয়েরিটি কম সময় নেয় কারণ এটি কেবল তার শর্ত পূরণ করে এমন ডেটা ফেরত দেয়।

## How can you modify data using UPDATE statements?

-- UPDATE statement modify data of a table but keeps the table structure unchanged. To change the value uses SET column_name and value along with WHERE clause to find the certain data. For example:
UPDATE user_table SET column1 = value1 WHERE id= '1';

-- UPDATE স্টেটমেন্ট একটি টেবিলের ডেটা পরিবর্তন করে কিন্তু টেবিলের কাঠামো অপরিবর্তিত রাখে। মান পরিবর্তন করতে, নির্দিষ্ট ডেটা খুঁজে পেতে WHERE ক্লজের সাথে SET কলামের নাম এবং মান ব্যবহার করুন। উদাহরণস্বরূপ:
UPDATE user_table SET column1 = value1 WHERE id= '1';
