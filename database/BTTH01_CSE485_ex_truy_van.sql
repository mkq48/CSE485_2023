
USE btth01_cse485_ex;

CREATE TABLE tacgia(
	ma_tgia int not null PRIMARY KEY,
    ten_tgia varchar(100) not null,
    hinh_tgia varchar(100)

);


CREATE TABLE theloai(
	ma_tloai int not null PRIMARY KEY,
	ten_tloai varchar(50)
);


CREATE TABLE baiviet(
	ma_bviet int not null PRIMARY KEY,
    tieude varchar(200) not null,
    ten_bhat varchar(100) not null,
    ma_tloai int  not null,
    tomtat text not null,
    noidung text,
    ma_tgia int not null,
    ngayviet datetime not null,
    hinhanh varchar(200),
    FOREIGN Key (ma_tloai) REFERENCES theloai(ma_tloai),
    FOREIGN KEY (ma_tgia) REFERENCES tacgia(ma_tgia)
);


CREATE TABLE Users(

	username VARCHAR(30) NOT NULL UNIQUE,
	pass VARCHAR(255) NOT NULL

);
	


--d)Tìm thể loại có số bài viết nhiều nhất

SELECT theloai.ten_tloai, COUNT(*) AS so_bai_viet
FROM theloai
JOIN baiviet ON theloai.ma_tloai = baiviet.ma_tloai
GROUP BY theloai.ma_tloai, theloai.ten_tloai
HAVING COUNT(*) = (
    SELECT COUNT(*) AS max_so_bai_viet
    FROM theloai
    JOIN baiviet ON theloai.ma_tloai = baiviet.ma_tloai
    GROUP BY theloai.ma_tloai
    ORDER BY max_so_bai_viet DESC
    LIMIT 1
);

/*a. Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình*/

SELECT baiviet.tieude, baiviet.ten_bhat
FROM baiviet
INNER JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
WHERE theloai.ten_tloai = 'Nhạc trữ tình';

/*b. Liệt kê các bài viết của tác giả “Nhacvietplus”*/
SELECT baiviet.tieude, baiviet.ten_bhat
FROM baiviet
INNER JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
WHERE tacgia.ten_tgia = 'Nhacvietplus';

/*c. Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào*/

SELECT theloai.ten_tloai
FROM theloai
LEFT JOIN baiviet ON theloai.ma_tloai = baiviet.ma_tloai
WHERE baiviet.ma_bviet IS NULL;



/*d. Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên thể loại, ngày viết. */

SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, tacgia.ten_tgia, theloai.ten_tloai, baiviet.ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai;


/*e. Tìm thể loại có số bài viết nhiều nhất*/

SELECT theloai.ten_tloai, COUNT(*) AS so_bai_viet
FROM theloai
JOIN baiviet ON theloai.ma_tloai = baiviet.ma_tloai
GROUP BY theloai.ma_tloai, theloai.ten_tloai
HAVING COUNT(*) = (
    SELECT COUNT(*) AS max_so_bai_viet
    FROM theloai
    JOIN baiviet ON theloai.ma_tloai = baiviet.ma_tloai
    GROUP BY theloai.ma_tloai
    ORDER BY max_so_bai_viet DESC
    LIMIT 1
);


/*f. Liệt kê 2 tác giả có số bài viết nhiều nhất (2 đ)*/

SELECT tacgia.ten_tgia, COUNT(*) as So_bai_viet FROM tacgia
JOIN baiviet ON baiviet.ma_tgia = tacgia.ma_tgia
GROUP BY tacgia.ma_tgia, tacgia.ten_tgia
ORDER BY COUNT(*) DESC
LIMIT 2;



/*g. Liệt kê các bài viết về các bài hát có tựa bài hát chứa 1 trong các từ “yêu”, “thương”, “anh”, “em” (2 đ)*/

SELECT * from baiviet 
WHERE baiviet.ten_bhat LIKE '%yêu%'
OR baiviet.ten_bhat LIKE '%thương%'
OR baiviet.ten_bhat LIKE '%anh%'
OR baiviet.ten_bhat LIKE '%em%';



/*h. Liệt kê các bài viết về các bài hát có tiêu đề bài viết hoặc tựa bài hát chứa 1 trong các từ “yêu”, “thương”, “anh”, “em” (2 đ)*/

SELECT * from baiviet 
WHERE baiviet.tieude LIKE '%yêu%'
OR baiviet.tieude LIKE '%thương%'
OR baiviet.tieude LIKE '%anh%'
OR baiviet.tieude LIKE '%em%';


/*i. Tạo 1 view có tên vw_Music để hiển thị thông tin về Danh sách các bài viết kèm theo Tên thể loại và tên tác giả */

CREATE VIEW vw_Music AS
SELECT baiviet.ma_bviet, baiviet.tieude, theloai.ten_tloai, tacgia.ten_tgia
FROM baiviet
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia;
SELECT * FROM vw_Music;


/*j. Tạo 1 thủ tục có tên sp_DSBaiViet với tham số truyền vào là Tên thể loại và trả về danh sách 
Bài viết của thể loại đó. Nếu thể loại không tồn tại thì hiển thị thông báo lỗi. */

DELIMITER //
CREATE PROCEDURE sp_DSBaiViet(IN ten_tloai_param VARCHAR(50))
BEGIN
    DECLARE ma_tloai_var INT;
    
    SELECT ma_tloai INTO ma_tloai_var FROM theloai WHERE ten_tloai = ten_tloai_param;
    
    IF ma_tloai_var IS NULL THEN
        SELECT 'Thể loại không tồn tại' AS ErrorMsg;
    ELSE
        SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, baiviet.tomtat, baiviet.noidung, baiviet.ngayviet
        FROM baiviet
        WHERE baiviet.ma_tloai = ma_tloai_var;
    END IF;
END //
DELIMITER ;



/*k. Thêm mới cột SLBaiViet vào trong bảng theloai. Tạo 1 trigger có tên tg_CapNhatTheLoai để
khi thêm/sửa/xóa bài viết thì số lượng bài viết trong bảng theloai được cập nhật theo*/

ALTER TABLE theloai
ADD COLUMN SLBaiViet INT DEFAULT 0;


-- Tạo trigger tg_CapNhatTheLoai
DELIMITER //
CREATE TRIGGER tg_CapNhatTheLoai
AFTER INSERT ON baiviet
FOR EACH ROW
BEGIN
    -- Cập nhật số lượng bài viết trong bảng theloai khi có bài viết mới được thêm
    UPDATE theloai
    SET SLBaiViet = SLBaiViet + 1
    WHERE ma_tloai = NEW.ma_tloai;
END //

CREATE TRIGGER tg_CapNhatTheLoai2
AFTER UPDATE ON baiviet
FOR EACH ROW
BEGIN
    -- Cập nhật số lượng bài viết trong bảng theloai khi có bài viết được sửa
    IF NEW.ma_tloai <> OLD.ma_tloai THEN
        UPDATE theloai
        SET SLBaiViet = SLBaiViet - 1
        WHERE ma_tloai = OLD.ma_tloai;
        
        UPDATE theloai
        SET SLBaiViet = SLBaiViet + 1
        WHERE ma_tloai = NEW.ma_tloai;
    END IF;
END //

CREATE TRIGGER tg_CapNhatTheLoai3
AFTER DELETE ON baiviet
FOR EACH ROW
BEGIN
    -- Cập nhật số lượng bài viết trong bảng theloai khi có bài viết bị xóa
    UPDATE theloai
    SET SLBaiViet = SLBaiViet - 1
    WHERE ma_tloai = OLD.ma_tloai;
END //
DELIMITER ;



/*l. Bổ sung thêm bảng Users để lưu thông tin Tài khoản đăng nhập và sử dụng cho chức năng Đăng nhập/Quản trị trang web.*/
CREATE TABLE Users
(
	username VARCHAR(30) NOT NULL UNIQUE PRIMARY KEY,
	pass VARCHAR(255) NOT NULL,
	role ENUM('Admin', 'User') NOT NULL
);

	
