﻿Use master
Drop Database QLBanHoa
Create Database QLBanHoa
Go
Use QLBanHoa
Go
--Drop table KhachHang
--Go
Create Table	KhachHang
(
	MaKH	Int	Identity(1,1),
	HoTen	Nvarchar(50)	Not Null,
	TaiKhoan	Varchar(50)	Unique,
	MatKhau	Varchar(50)	Not Null,
	Email	Varchar(100)	Unique,
	DiachiKH	Nvarchar(200),
	DienThoaiKH	Varchar(50),
	NgaySinh	DateTime,
	Constraint	Pk_KhachHang	Primary Key(MaKH)
)
Go
--Drop table ChuDe
--Go
Create Table	Loaihoa
(
	MaLH	Int	Identity(1,1),
	Tenloaihoa	Nvarchar(50)	Not Null,
	Constraint Pk_ChuDe Primary Key(MaLH)
)
Go
--Drop table NhaXuatBan
--Go
Create Table	Nhacungcap
(
	MaNCC	Int Identity(1,1),
	TenNCC	Nvarchar(50)	Not Null,
	DiaChi	Nvarchar(200),
	DienThoai	Varchar(50),
	Constraint	Pk_Nhacungcap Primary Key(MaNCC),
)
Go
--Drop table Hoa
--Go
Create Table	Hoa
(
	Mahoa	Int	Identity(1,1),
	Tenloaihoa	Nvarchar(100)	Not Null,
	GiaBan	Decimal(18,0)	Check(GiaBan>=0),
	MoTa	Nvarchar(Max),
	AnhBia	Varchar(50),
	NgayCapNhat	DateTime,
	SoLuongTon	Int,
	MaLH	Int,
	MaNCC	Int,
	Constraint	Pk_Sach	Primary Key(Mahoa),
	Constraint	Fk_Loaihoa	Foreign	Key(MaLH) References Loaihoa(MaLH),
	Constraint	Fk_Nhcungcap	Foreign Key(MaNCC) References Nhacungcap(MaNCC)
)
Go
--Drop table DonDatHang
--Go
Create Table	DonDatHang
(
	SoDH	Int Identity(1,1),
	MaKH	Int,
	NgayDH	DateTime,
	NgayGiao	DateTime,
	DaThanhToan	Bit,
	TinhTrangGiaoHang	Bit,
	Constraint	Pk_DonDatHang	Primary Key(SoDH),
	Constraint	Fk_KhachHang	Foreign	Key(MaKH)	References	KhachHang(MaKH)
)
Go
--Drop table ChiTietDatHang
--Go
Create Table	ChiTietDatHang
(
	SoDH	Int,
	Mahoa	Int,
	SoLuong	Int	Check(SoLuong>0),
	DonGia Decimal(18,0)	Check(DonGia>=0),
	Constraint	Pk_ChiTietDatHang	Primary Key(SoDH,Mahoa),
	Constraint	Fk_DonHang	Foreign	Key(SoDH)	References	DonDatHang(SoDH),
	Constraint	Fk_Hoa	Foreign Key(Mahoa)	References	Hoa(Mahoa)
)
Go
--Thêm dữ liệu:
---Loại hoa
	Insert into Loaihoa Values (N'Hoa Hồng')
	Insert into Loaihoa Values (N'Hoa Mai')
	Insert into Loaihoa values (N'Hoa Đào')
	Insert into Loaihoa values (N'Hoa Thạch Thảo')
	Insert into Loaihoa values (N'Hoa Cẩm Tú Cầu')
select *from Loaihoa
---Nhà cung cấp
	Insert into Nhacungcap  values ('Flower Corner',N'225/3 Nguyễn Đình Chiểu, Phường 5, Quận 3, TPHCM','19006 33045')
	Insert into Nhacungcap  values ('Alohoatuoi',N'613 Thống Nhất, phường 16, quận Gò Vấp, TP. HCM','0339 680 689')
	Insert into Nhacungcap  values ('Chợ hoa Hồ Thị Kỷ',N'270L Võ Thị Sáu, phường 7, Quận 3, TP.HCM','1800 6353')
	Insert into Nhacungcap  values ('Hoa yêu thương',	N'230B Võ Thị Sáu, phường 7, Quận 3, TP.HCM','1800 6353')
	Insert into Nhacungcap  values ('Flower Box',N'17D Nguyễn Thái Học, phường Cầu Ông Lãnh, Quận 1, TP.HCM','1800 6353')
	Insert into Nhacungcap  values ('Potico',N'86 - 88 Đinh Tiên Hoàng, phường Đakao, Quận 1, TP. HCM','0286 660 0707')
	Insert into Nhacungcap  values ('Hoa Tươi 9x',N'74E Hai Bà Trưng, phường Bến Nghé, Quận 1, TP.HCM','0286 660 0707')
select *from Nhacungcap
---Hoa
	Insert into Hoa values (N'Hoa Hồng Đỏ',25000,N'Hoa hồng đỏ là biểu tượng của sự lãng mạn trong tình yêu, niềm đam mê mãnh liệt. Màu sắc này thể hiện cho tình cảm sâu đậm mà bạn dành cho người ấy. Để bày tỏ và thổ lộ tình cảm với đối phương thì đây quả là món quà valentine ý nghĩa','hoahongdo.jpg','01/04/2016',15,1,1)
	Insert into Hoa values (N' Hoa hồng Trắng',15000,N'Hoa hồng trắng tôn vinh sự vĩnh cửu, lòng trung thành trong tình yêu và tình bạn. Một sự gắn bó của hai tâm hồn vượt qua mọi cám dỗ và khó khăn. Loài hoa này còn có thể thay cho lời yêu chung thủy, biểu đạt một tình cảm trong sáng, một lời hứa sát cánh cùng nhau khi nắm tay nhau bước qua mọi thăng trầm cuộc sống.','hoahongtrang.jpg','01/04/2016',17,1,1)
	Insert into Hoa values (N'Hoa hồng Vàng',35000,N'Hoa hồng vàng tượng trưng cho tình bạn vô tư, thân thiết, chân thành. Khi muốn động viên hay muốn ai đó biết rằng bạn đang quan tâm đến họ, thì hãy tặng ngay một đóa hoa hồng vàng nhé. Loại hoa này thường được dành như một lời chúc mừng hay chia sẻ niềm vui với những người thân quen.','hoahongvang.jpg','02/04/2016',30,1,1)
	Insert into Hoa values (N'Mai Năm Cánh',75000,N'Số 5 tượng trưng cho 5 điều ý nghĩa đó là thuận lợi, hoa bình, khoái lạc, trường thọ và hạnh phúc. Bên cạnh đó, hoa mai 5 cánh còn là biểu tượng của ngũ hành âm dương. Nó đại diện cho năm mới với nhiều điều như ý. Chính vì thế, mai 5 cánh luôn được săn lùng để trưng trong nhà ngày Tết.','hoamai5canh.jpg','03/04/2016',5,2,2)
	Insert into Hoa values (N'Mai núi',455000,N'Người ta chưng hoa mai vào dịp Tết với mong muốn một năm mới phát tài, giàu sang. Theo quan niệm của nhiều người, nhà nào có hoa mai nở càng nhiều cánh thì nhà đó càng may mắn và sung túc trong năm mới. Hoa mai tượng trưng cho phẩm đức nhẫn nại và đức hy sinh cao cả, sự bền bỉ của người Việt Nam.','hoamainui.jpg','04/04/2016',9,2,4)
	Insert into Hoa values (N'Mai chủy',45000,N'xua đuổi những điều xấu xa, không tốt đẹp và cầu cho một năm mới luôn được bình an, hạnh phúc và phát đạt. Và có lẽ vì thế mà hoa mai vàng là một trong những sự lựa chọn hàng đầu của người dân Việt, đặc biệt là người miền Nam, chọn để thờ cúng và trang trí trong nhà vào dịp Tết Nguyên Đán.','hoamaichuy.jpg','04/04/2016',9,2,4)
	Insert into Hoa values (N'Đào Nhật Tân',500000,N'Hoa đào được coi là tinh hoa của Ngũ hành, có thể xua đuổi bách quỷ mang đến cho con người cuộc sống bình an, hạnh phúc. Không chỉ vậy, hoa đào còn tượng trưng cho sự sinh sôi nảy nở. Ai cũng mong muốn có một năm an khang thịnh vượng, làm ăn thuận lợi, phát tài, gia đình vui vẻ.','daonhattan.jpg','04/04/2016',9,3,4)
	Insert into Hoa values (N'Đào Thất Thốn',400000,N'Cây không nở hoa quá nhiều nhưng lại rất bền, lan tỏa hương thơm vào ban đêm. Đến độ hoa tàn, cánh không bị rơi lả tả như các giống đào bình thường mà vẫn giữ nguyên trên đài. Bởi thế, đào Thất Thốn ý nghĩa mang đến cho người thưởng lãm thấy sự trọn vẹn, đủ đầy và viên mãn.','daothatthon.jpg','04/04/2016',9,3,4)
	Insert into Hoa values (N'Đào phai',55000,N'Hoa đào là tinh hoa ngũ hành: Vẻ đẹp tươi thắm và sắc độ của hoa đào từ xưa đến nay đã được xem như tinh hoa ngũ hành của trời đất. Ý nghĩa của đào trong phong thủy chính là nó có thể giúp xua đuổi bách quỷ cùng những điều không may, từ đó mang lại cho con người một năm mới bình yên và hạnh phúc.','daophai.jpg','04/04/2016',9,3,4)
	Insert into Hoa values (N'Hoa Thạch Thảo Trắng',500000,N'Sắc trắng của hoa thạch thảo mang ý nghĩa và đại diện cho sự trong sáng, thuần khiết của những thiếu nữ đang ngại ngùng, e ấp và cần được sự chở che và bảo vệ. Những sắc hoa này đại diện cho sự may mắn và tài lộc. Đồng thời, với sắc hoa này cũng thể hiện được sự mến mộ đối với người nhận','thachthaotrang.jpg','04/04/2016',9,4,4)
	Insert into Hoa values (N'Hoa Thạch Thảo Tím',500000,N'Ý nghĩa hoa Thạch Thảo màu này tượng trưng cho sự may mắn, vui vẻ. Người Việt Nam mình thường hay chọn hoa hồng này vào dịp lễ tết trưng bày trong nhà để mang niềm vui, hạnh phúc, bình an về nhà. Bình hoa Thạch Thảo hồng điểm tô cho không gian nhà rực rỡ, tươi tắn, chỉ cần nhìn ngắm thôi là tâm trạng phấn chấn.','thachthaotim.jpg','04/04/2016',9,4,4)
	Insert into Hoa values (N'Hoa Thạch Thảo Xanh',500000,N'Những sắc hoa này đại diện cho sự may mắn và tài lộc. Đồng thời, với sắc hoa này cũng thể hiện được sự mến mộ đối với người nhận.','thachthaoxanh.jpg','04/04/2016',9,4,4)
	Insert into Hoa values (N'Hoa Cẩm Tú Cầu Trắng',500000,N'Hoa cẩm tú cầu trắng. Đây là loài hoa tượng trưng cho sự thuần khiết, trong sáng và ngây thơ. Đồng thời, ý nghĩa của cẩm tú cầu này còn thể hiện sự giàu có và sắc đẹp.','camtucautrang.jpg','04/04/2016',9,5,4)
	Insert into Hoa values (N'Hoa Cẩm Tú Cầu Xang',500000,N'Hoa cẩm tú cầu màu xanh là đại diện cho một lời xin lỗi chân thành, được dùng để từ chối tình cảm của người khác hoặc cũng có thể là bày tỏ sự hối hận và xin được tha thứ.','camtucauxanh.jpg','04/04/2016',9,5,4)
select *from Hoa
Create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
)
Insert into Admin values('admin','123456','Văng Hoàng Phi')
Insert into Admin values('user','654321','Mr Phi')
select *from Admin
