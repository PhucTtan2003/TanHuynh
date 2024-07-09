                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      /* Lấy danh sách tất cả các sản phẩm có giá trên 500 đồng: */
SELECT * FROM Product WHERE GIASP > 500;  --> okiee

/*Lấy danh sách các hóa đơn chưa thanh toán:*/
SELECT * FROM Bill WHERE TRANGTHAI != 'Đã thanh toán';--> okie

/*Tính tổng số tiền của tất cả các hóa đơn:*/
SELECT SUM(TONGSOTIEN) AS TotalAmount FROM Bill; -->  okiee

/*Lấy danh sách các quyền và mô tả của chúng:*/
SELECT * FROM Permission;
--> okiee 

/*Lấy danh sách các sản phẩm và chi tiết của từng sản phẩm trong hóa đơn có mã 1:*/
SELECT Product.*, DetailBill.SOLUONG
FROM Product
JOIN DetailBill ON Product.MASANPHAM = DetailBill.MASANPHAM
WHERE DetailBill.MAHOADON = 1; --> okiee
--> lưu ý có thể dùng Entity e lấy e để lấy thuộc tính nhee
--> lý do các thực thể có thể có cấc thuộc tính trùng nhau
--> nếu không định danh bằng cách đó thì thuộc tính không hiểu là của entity nào


/*Lấy danh sách các sản phẩm chưa được bán trong hóa đơn nào:*/
SELECT * FROM Product
WHERE MASANPHAM NOT IN (SELECT MASANPHAM FROM DetailBill); --> okiee


/*Lấy danh sách các khách hàng và tổng số tiền mà họ đã mua:*/

SELECT u.HOTEN, u.SODIENTHOAI, u.Email, SUM(b.TONGSOTIEN) AS TongSoTienDaMua
FROM [user] u
JOIN Bill b ON u.MAND = b.MAND
GROUP BY u.HOTEN, u.SODIENTHOAI, u.Email
ORDER BY TongSoTienDaMua DESC;  --> okiee

/*Lấy danh sách các sản phẩm đã được bán trong hóa đơn có mã 2:*/

SELECT p.TENSP, db.SOLUONG, p.GIASP, (db.SOLUONG * p.GIASP) AS ThanhTien
FROM DetailBill db
JOIN Product p ON db.MASANPHAM = p.MASANPHAM
WHERE db.MAHOADON = 2;  --> okieee
/*Lấy danh sách các tài khoản và thông tin người dùng tương ứng:*/
--> suggestion lấy thông tin người dùng dựa vào mã tài khoản
SELECT a.MATAIKHOAN, a.TAIKHOAN, u.HOTEN, u.SODIENTHOAI, u.Email
FROM Account a
JOIN [user] u ON a.MAND = u.MAND; --> okieee




/*Lấy danh sách các tài khoản và người dùng tương ứng có quyền là 'Admin'*/
--> suggestion select tài khoản có quyền là admin  entity account và user

SELECT a.TAIKHOAN, u.HOTEN
FROM Account a
JOIN [user] u ON a.MAND = u.MAND
JOIN Permission p ON a.MAQUYEN = p.MAQUYEN
WHERE p.TENQUYEN = 'Admin';

--> với điều kiện này thì e sẽ lấy được một số tài khoản có quyền là Admin
--> SELECT * FROM Account a, Permission p, [user] u
--> xem cái đó select bên trên để biết tại sao query không ra kết quả


/*Lấy danh sách các hóa đơn và tổng số tiền của từng hóa đơn:*/
SELECT BillID, SUM(TONGSOTIEN) AS TotalAmount
FROM Bill
GROUP BY BillID; 
Select * FROM DetailBill
--->?????? BillId 


/*Lấy danh sách các sản phẩm theo từng danh mục:*/

SELECT DANHMUCSANPHAM, TENSP, GIASP, CHITIETSP
FROM Product
ORDER BY DANHMUCSANPHAM ASC, GIASP DESC;  
---> dùng một trong 2 thôi asc hoặc desc ???  --> Order by dùng để sắp xếp
---> ví dụ a muốn lấy Bánh kẹo thì phải làm sao 
---> truy vấn có điều kiện thì kết quả sẽ hợp lý hơn

