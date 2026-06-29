select * from sakila.emp_data; # menampilkan semua data

# menampilkan kolom tertent
select EEID, Department from sakila.emp_data; 

-- ========== Where Clause ===========
# menampilkan kolom city yg hanya bernilai "seattle" tetapi di tampilkan semua data
select * from sakila.emp_data where City = "seattle"; 

# menampilkan kolom tertenu berdasarkan kolom Jobtitle yg bernilai Sr. Manger
SELECT `Job Title`, `Full Name`, `Annual Salary` FROM sakila.emp_data WHERE `Job Title` = "Sr. Manger"; 

-- ========== AND, OR AND NOT Operators ===========
# menampilkan kolom tertentu berdasarkan kolom dengan nilai tertentu
SELECT  `Full Name`, `Annual Salary`, `Job Title`, `City` FROM sakila.emp_data WHERE `Job Title` = "Sr. Manger" AND `City` = "Seattle"; 

# menampilkan kolom tertentu berdasarkan kolom nilai ini atau nilai satunya
select `Full Name`, `Annual Salary`, `Gender`, `Country` from sakila.emp_data where `Gender` = "Female" or `Country` = "China";

# menampilkan semua data karyawan yang bukan "female"
select * from sakila.emp_data where not `Gender` = "Female";

# menampilkan data yang kemungkinan nilai begitu (mungkin atau kira-kira)
select * from sakila.emp_data where `Full Name` like "%mar%";
select * from sakila.emp_data where `Full Name` like "%mar";
select * from sakila.emp_data where `Full Name` like "mar%";

# mengurutkan data dari kecil ke besar
select * from sakila.emp_data order by Age asc;

# urutkan berdasarkan Department, lalu urutkan umur dari kecil ke besar di setiap Department.
select * from sakila.emp_data order by Department, Age asc limit 3;

# menampilkan nilai int dalam rentang tertenu
select * from sakila.emp_data where `Annual Salary` between 140000 and 150000;

# menampilkan semua data berdasarkan nilai tertentu pada kolom
select * from sakila.emp_data where City in  ("Seattle", "Miami");

# menampilkan semua data yang bukan nilai tersebut pada kolom
select * from sakila.emp_data where City not in  ("Seattle", "Miami");

# menampilkan dua kolom yang nilainya di tentukan 
select * from sakila.emp_data where City in  ("Seattle", "Miami") and Department in ("IT", "Accounting");

-- ========== String Functions ==========
# Menggabungkan dua kolom yaitu Job Title dan Department menjadi satu kolom baru bernama Designation.
select concat(`Job Title`, " - ", Department) as Designation from sakila.emp_data;

# menggbungkan tiga kolom dan menamakan kolom baru yaitu Emp_details
select concat_ws(" - ", `Job Title`, Department, Gender) as Emp_details from sakila.emp_data;

# menghitung jumlah karakter (digit) dari nilai pada kolom Annual Salary, lalu menampilkannya sebagai kolom baru bernama digtCount.
select length(`Annual Salary`) as digitCount from sakila.emp_data;

# rubah nilai string menjadi huruf besar semua
select upper(`Full Name`) as Names from sakila.emp_data;

# ganti nilai string menjadi huruf kecil semua
select lower(`Full Name`) as Names from sakila.emp_data;

# mengambil 4 karakter pertama dari kolom Full Name, lalu menampilkannya sebagai kolom baru bernam username
select left(`Full Name`, 4) as username from sakila.emp_data;

# mengambil 4 karakter terakhir dari kolom Full Name, lalu menampilkannya sebagai kolom baru bernama username
select right(`Full Name`, 4) as username from sakila.emp_data;

# Mengambil 5 karakter dari kolom “Full Name” mulai dari posisi ke-2, lalu menampilkannya sebagai kolom baru bernama mid_name
select mid(`Full Name`, 2, 5) as mid_name from sakila.emp_data;

-- ========== Data Aggregation Numeric Functions =============
# menampilkan total amount dan diletakkan di kolom baru
select sum(amount) as total_amount from sakila.payment;

select * from sakila.customers;
select count(customerNumber) as totalCustomers from sakila.customers;

# menampilkan nilai rata-rata pada kolom tertentu dan menempatkannya di kolom baru
select * from sakila.orderdetails;
select avg(quantityOrdered) as avg_quantity from sakila.orderdetails;

select * from sakila.payments;
select sum(amount) as total_amount from sakila.payments;	# menampilkan total amount
select max(amount) as max_value from sakila.payments;		# menampilkan nilai terbersar
select min(amount) as min_value from sakila.payments;		# menampilkan nilai terkecil
select truncate(amount, 1) as amount from sakila.payments;	# menampilkan angka menggunakan 1 desimal
select ceil(amount) as higher_amount from sakila.payments;	# membulatkan nilai ke atas dan ditampilkan
select floor(amount) as lower_value from sakila.payments;	# membulatkan nilai ke bawah dan ditampilkan

-- ========== Date Functions ==========

-- ========== Group By ==========
select Department, count(EEID) from sakila.emp_data group by Department;

-- ========== Having Clause ==========
# menghitung jumlah karyawan di setiap department, lalu hanya menampilkan department yang memiliki lebih dari 150 karyawan.
select Department, count(EEID) from sakila.emp_data group by Department having count(EEID) > 150;

select * from sakila.payment;

# mengurtkan nilai pada kolom tertentu
select * from sakila.payment order by amount desc;

-- ========== Data Aggregation Numeric Functions =============
# menampilkan total amount dan diletakkan di kolom baru
select sum(amount) as total_amount from sakila.payment;

select * from sakila.payments;
select sum(amount) as total_amount from sakila.payments;	# menampilkan total amount
select max(amount) as max_value from sakila.payments;		# menampilkan nilai terbersar
select min(amount) as min_value from sakila.payments;		# menampilkan nilai terkecil
select truncate(amount, 1) as amount from sakila.payments;	# menampilkan angka menggunakan 1 desimal
select ceil(amount) as higher_amount from sakila.payments;	# membulatkan nilai ke atas dan ditampilkan
select floor(amount) as lower_value from sakila.payments;	# membulatkan nilai ke bawah dan ditampilkan

select time(payment_date) as dates from sakila.payment;		# melihat nilai kolom tertentu sesuai tipe data
select dayname(payment_date) as dates from sakila.payment;	# menampilkan hari pada kolom yg tipe data nya waktu
select month(payment_date) as dates from sakila.payment;	# menampilkan bulan pada tipe data waktu
select monthname(payment_date) as dates from sakila.payment; # menampilkan nama bulan pada tipe data waktu
select year(payment_date) as dates from sakila.payment;		# menampilkan tahun pada tipe data waktu
select minute(payment_date) as hours from sakila.payment;	# menampilkan bagian menit pada tipe data waktu

select * from demo2.orders;

# menghitung selisih dua kolom, artinya dari kolom sebelumnya dan setelahnya berapa selisihnya
select datediff(shippedDate, orderDate) as dates from demo2.orders;

# menampilkan tahun
select year(orderDate) as years from demo2.orders;

# 
select * from demo2.products;

# untuk mengevaluasi stok produk dan memberi status kondisi stok berdasarkan jumlah
select productName, quantityInStock,
case
	when quantityInStock < 1000 then "urgent need of more stock"
    else "no requirement as of now"
end as production_details
from demo2.products;

-- ========== Group By ==========
# menghitung jumlah nilai produk pada setiap product line, lalu mengurutkannya dari yang paling sedikit sampai paling banyak.
select productline, count(productCode) from demo2.products group by productline order by count(productCode) asc;

-- ========== Having Clause ==========
select productLine, sum(quantityInStock) from demo2.products group by productLine having sum(quantityInStock) < 50000;

-- ========== Join (inner, left, right, cross) ==========
# menggabungkan dua data untuk melihat data ini dan data sebelah
select products.productName, orderdetails.quantityOrdered from demo2.products
inner join demo2.orderdetails
on products.productCode = orderdetails.productCode;

# untuk menghitung total jumlah penjualan setiap produk.
select products.productName, sum(orderdetails.quantityOrdered) from demo2.products
inner join demo2.orderdetails
on products.productCode = orderdetails.productCode
group by products.productName;

# menampilkan semua produk, beserta jumlah yang dipesan (jika ada), dengan menggunakan LEFT JOIN.
select products.productName, orderdetails.quantityOrdered
from demo2.products left join demo2.orderdetails
on products.productCode = orderdetails.productCode;

select products.productName, orderdetails.quantityOrdered
from demo2.products right join demo2.orderdetails
on products.productCode = orderdetails.productCode;

select products.productName, products.quantityInstock, orderdetails.quantityOrdered from demo2.products cross join demo2.orderdetails
on products.productCode = orderdetails.productCode;

# menampilkan nilai rata-rata pada kolom tertentu dan menempatkannya di kolom baru
select * from demo2.orderdetails;
select avg(quantityOrdered) as avg_quantity from sakila.orderdetails;

# manampilkan nilai yang kurang dari dan memberikan status serta diiringi kolom lainnya
select orderNumber, quantityOrdered,
case
	when quantityOrdered >= 40 then "high order"
    when quantityOrdered <= 30 then "low order"
    else "avg order"
end as order_type # menyimpan status di kolom yang baru dibuat
from demo2.orderdetails;

select * from sakila.customers;
select count(customerNumber) as totalCustomers from sakila.customers;

-- ========== Subqueries ==========
select avg(creditLImit) from sakila.customers;

# menampilkan nilai pada kolom yang lebih besar dari 67659
select * from sakila.customers where creditLimit > 67659;

# menampilkan nilai diatas rata-rata
select * from sakila.customers where creditLimit > 
(select avg(creditLimit) from sakila.customers);

-- ========== Views (tabel virtual) ==========
select country, count(customerNumber) from sakila.customers
group by country;

# query ini untuk membuat VIEW (tabel virtual) yang berisi jumlah customer berdasarkan negara (country), supaya hasil perhitungan itu bisa dipakai kembali dengan mudah.
create view count_of_customers as
select country, count(customerNumber) from sakila.customers
group by country;

# menyimpan data customer yang hanya berasal dari France ke dalam VIEW bernama france_data agar bisa digunakan kembali dengan mudah
create view france_data as 
select * from sakila.customers where country = "France";

# percobaan penerapan view yang dibuat di atas
select * from sakila.france_data;
select sum(creditLimit) from sakila.france_data;

-- ========== Stored procedure ==========
# Membuat prosedur yang bisa dipanggil kapan saja untuk menampilkan semua data customer. (telpon cepat ke data base)
Delimiter &&
create procedure get_data()
begin
	select * from sakila.customers;
end && 
Delimiter ;
call sakila.get_data()

Delimiter && 
create procedure get_limt(in var int)
begin
	select * from sakila.customers limit var;
end &&
Delimiter ;

call sakila.get_limit(3)

Delimiter &&
create procedure get_credit(out var int)
begin 
	select max(creditLimit) into var from sakila.customers;
end &&
Delimiter ;
call sakila.get_credit(@m);
select @m

Delimiter &&
create procedure get_name(inout var int)
begin
	select customerName from customers where customerNumber = var;
end &&
Delimiter ;

set @m = 201;
call sakila.get_name(@m);
select @m;

select * from demo2.customers_data;

-- =========== window functions ==========
select FirstName, Occupation, EducationLevel, sum(TotalChildren)
from demo2.customers_data
group by FirstName, Occupation, EducationLevel;


select FirstName, Occupation, EducationLevel, TotalChildren, sum(TotalChildren)
over (partition by Occupation order by EducationLevel) from demo2.customers_data;

# Memberi nomor urut (ranking) pada setiap data produk berdasarkan kelompok harga (Price).
select *, row_number()
over(partition by product_details.Price) from sakila.product_details;

select * from demo2.superstoreus_2015_combined;

# untuk memberikan peringkat (ranking) pada setiap produk berdasarkan kelompok harga (Price).
select *, rank()
over(partition by product_details.Price) from demo2.product_details;

# untuk memberikan peringkat (ranking) berdasarkan nilai kids di dalam setiap kelompok Product_name, tanpa melewati angka ranking (tidak ada gap).
select *, dense_rank()
over(partition by product_details.Product_name
order by product_details.kids) from sakila.product_details;

# untuk menghitung jumlah kumulatif (running total) dari TotalChildren berdasarkan setiap Occupation, yang diurutkan berdasarkan EducationLevel.
select FirstName, Occupation, EducationLevel, TotalChildren, sum(TotalChildren)
over (partition by Occupation order by EducationLevel) from demo2.customers_data;

# untuk memberikan peringkat (ranking) berdasarkan tingkat pendidikan (EducationLevel) di dalam setiap kelompok pekerjaan (Occupation) menggunakan metode DENSE_RANK().
select FirstName, Occupation, EducationLevel, TotalChildren, dense_rank()
over (partition by Occupation order by EducationLevel) from demo2.customers_data;
