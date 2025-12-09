INSERT INTO customers (customer_id, full_name, email, phone, district, address, registration_date)
VALUES (1, 'Jean Uwase', 'jean.uwase@gmail.com', '+250780123456', 'Kicukiro',
        'Kicukiro - Sector 5 - Cell 12 - House 88', SYSDATE - 20);

INSERT INTO customers VALUES (2, 'Alice Mugisha', 'alice.mugisha@yahoo.com', '+250788654321',
       'Gasabo', 'Gasabo - Sector 2 - Cell 4 - House 67', SYSDATE - 12);

INSERT INTO customers VALUES (3, 'Emmanuel Niyonzima', 'emmanuel.niyo@mtn.com', '+250789445522',
       'Nyarugenge', 'Nyarugenge - Sector 7 - Cell 10 - House 25', SYSDATE - 30);

INSERT INTO customers VALUES (4, 'Sandrine Kamanzi', 'sandrine.kamanzi@gmail.com', '+250783221100',
       'Huye', 'Huye - Sector 3 - Cell 6 - House 12', SYSDATE - 18);

INSERT INTO customers VALUES (5, 'Patrick Ishimwe', 'patrick.ishimwe@hotmail.com', '+250739876543',
       'Musanze', 'Musanze - Sector 4 - Cell 9 - House 45', SYSDATE - 8);

INSERT INTO customers VALUES (6, 'Beatrice Uwimana', 'beatrice.u@gmail.com', '+250785112299',
       'Rubavu', 'Rubavu - Sector 6 - Cell 5 - House 33', SYSDATE - 14);

INSERT INTO customers VALUES (7, 'Yves Rwigema', 'yves.rwigema@gmail.com', '+250780332211',
       'Rwamagana', 'Rwamagana - Sector 1 - Cell 3 - House 98', SYSDATE - 5);

INSERT INTO customers VALUES (8, 'Diane Kabasita', 'diane.kabasita@yahoo.com', '+250739221188',
       'Gasabo', 'Gasabo - Sector 8 - Cell 4 - House 62', SYSDATE - 22);

INSERT INTO customers VALUES (9, 'Claire Ndizeye', 'claire.ndizeye@mtn.com', '+250788334455',
       'Nyamasheke', 'Nyamasheke - Sector 9 - Cell 12 - House 78', SYSDATE - 17);

INSERT INTO customers VALUES (10, 'Fabrice Maniraguha', 'fabrice.mani@gmail.com', '+250780556677',
       'Nyarugenge', 'Nyarugenge - Sector 6 - Cell 7 - House 41', SYSDATE - 10);
       
       
       INSERT INTO products VALUES (1, 'Smartphone Model A', 'High quality smartphone', 320000, 15);
INSERT INTO products VALUES (2, 'LED TV 32-inch', 'HD television', 210000, 8);
INSERT INTO products VALUES (3, 'Bluetooth Headphones', 'Wireless audio headset', 45000, 25);
INSERT INTO products VALUES (4, 'Electric Kettle', '2L stainless steel kettle', 18000, 40);
INSERT INTO products VALUES (5, 'Rice Cooker', '5L large rice cooker', 35000, 30);
INSERT INTO products VALUES (6, 'Women Dress', 'Summer fashion dress', 25000, 50);
INSERT INTO products VALUES (7, 'Sneakers', 'Unisex running shoes', 38000, 20);
INSERT INTO products VALUES (8, 'Cooking Pot', 'Non-stick pot', 40000, 18);
INSERT INTO products VALUES (9, 'Knife Set', 'Kitchen knife set (6 pcs)', 15000, 22);
INSERT INTO products VALUES (10, 'Backpack', 'Waterproof laptop backpack', 30000, 14);


INSERT INTO orders VALUES (1, 1, SYSDATE - 10, 'Delivered', 0);
INSERT INTO orders VALUES (2, 3, SYSDATE - 8, 'Processing', 0);
INSERT INTO orders VALUES (3, 2, SYSDATE - 6, 'Shipped', 0);
INSERT INTO orders VALUES (4, 5, SYSDATE - 12, 'Cancelled', 0);
INSERT INTO orders VALUES (5, 4, SYSDATE - 7, 'Delivered', 0);
INSERT INTO orders VALUES (6, 6, SYSDATE - 9, 'Processing', 0);
INSERT INTO orders VALUES (7, 7, SYSDATE - 3, 'Pending', 0);
INSERT INTO orders VALUES (8, 9, SYSDATE - 11, 'Delivered', 0);
INSERT INTO orders VALUES (9, 10, SYSDATE - 5, 'Shipped', 0);
INSERT INTO orders VALUES (10, 8, SYSDATE - 4, 'Processing', 0);


INSERT INTO order_items VALUES (1, 1, 1, 1, 320000, 320000);
INSERT INTO order_items VALUES (2, 1, 3, 2, 45000, 90000);
INSERT INTO order_items VALUES (3, 2, 4, 1, 18000, 18000);
INSERT INTO order_items VALUES (4, 3, 2, 1, 210000, 210000);
INSERT INTO order_items VALUES (5, 3, 7, 1, 38000, 38000);
INSERT INTO order_items VALUES (6, 4, 6, 3, 25000, 75000);
INSERT INTO order_items VALUES (7, 5, 10, 1, 30000, 30000);
INSERT INTO order_items VALUES (8, 6, 3, 1, 45000, 45000);
INSERT INTO order_items VALUES (9, 7, 8, 1, 40000, 40000);
INSERT INTO order_items VALUES (10, 8, 9, 2, 15000, 30000);


INSERT INTO payments VALUES (1, 1, SYSDATE - 9, 410000, 'MTN MoMo', 'Completed');
INSERT INTO payments VALUES (2, 2, SYSDATE - 7, 18000, 'Airtel Money', 'Completed');
INSERT INTO payments VALUES (3, 3, SYSDATE - 5, 248000, 'Card', 'Completed');
INSERT INTO payments VALUES (4, 4, SYSDATE - 12, 75000, 'Cash', 'Failed');
INSERT INTO payments VALUES (5, 5, SYSDATE - 6, 30000, 'MTN MoMo', 'Completed');
INSERT INTO payments VALUES (6, 6, SYSDATE - 8, 45000, 'Airtel Money', 'Completed');
INSERT INTO payments VALUES (7, 7, SYSDATE - 3, 40000, 'Cash', 'Pending');
INSERT INTO payments VALUES (8, 8, SYSDATE - 10, 30000, 'Card', 'Completed');
INSERT INTO payments VALUES (9, 9, SYSDATE - 4, 210000, 'MTN MoMo', 'Completed');
INSERT INTO payments VALUES (10, 10, SYSDATE - 3, 45000, 'Airtel Money', 'Completed');


INSERT INTO delivery VALUES (1, 1, 'Jean Delivery', 'Kicukiro - House 88', 'Delivered', SYSDATE - 8, SYSDATE - 7);
INSERT INTO delivery VALUES (2, 2, 'Amina Courier', 'Gasabo - House 67', 'On the way', SYSDATE - 5, NULL);
INSERT INTO delivery VALUES (3, 3, 'Patrick Transport', 'Gasabo - House 67', 'Delivered', SYSDATE - 4, SYSDATE - 3);
INSERT INTO delivery VALUES (4, 4, 'Emmanuel Rider', 'Musanze - House 45', 'Failed', SYSDATE - 10, NULL);
INSERT INTO delivery VALUES (5, 5, 'Jean Delivery', 'Huye - House 12', 'Delivered', SYSDATE - 6, SYSDATE - 5);
INSERT INTO delivery VALUES (6, 6, 'Amina Courier', 'Rubavu - House 33', 'Preparing', SYSDATE - 7, NULL);
INSERT INTO delivery VALUES (7, 7, 'Patrick Transport', 'Rwamagana - House 98', 'Preparing', SYSDATE - 2, NULL);
INSERT INTO delivery VALUES (8, 8, 'Emmanuel Rider', 'Nyamasheke - House 78', 'Delivered', SYSDATE - 9, SYSDATE - 8);
INSERT INTO delivery VALUES (9, 9, 'Jean Delivery', 'Nyarugenge - House 41', 'On the way', SYSDATE - 3, NULL);
INSERT INTO delivery VALUES (10, 10, 'Amina Courier', 'Gasabo - House 62', 'Preparing', SYSDATE - 2, NULL);
