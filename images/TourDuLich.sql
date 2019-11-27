CREATE DATABASE TOURDULICH
GO
USE TOURDULICH
CREATE TABLE TaiKhoan
(
	TenTaiKhoan varchar(50) PRIMARY KEY NOT NULL,
	MatKhau varchar(50),
	QuyenHan Nvarchar(50),
	TrangThai bit
)
GO
CREATE TABLE TinTuc
(
	MaTinTuc int PRIMARY KEY NOT NULL,
	TieuDe Nvarchar(max),
	HinhAnhTinTuc Nvarchar(max),
	MoTa Nvarchar(max),
	NoiDung Nvarchar(max),
	NgayDang datetime,
	TrangThai bit
)
GO

CREATE TABLE TuyenDung
(
	MaTuyenDung int PRIMARY KEY,
	TieuDe Nvarchar(max),
	HinhAnhTuyenDung Nvarchar(max),
	MoTa Nvarchar(max),
	NoiDung Nvarchar(max),
	NgayDang DateTime,
	TrangThai bit
)
/*
CREATE TABLE DiaDiem
(
	MaDiaDiem int PRIMARY KEY NOT NULL,
	TenDiaDiem Nvarchar(250),
	MoTa Nvarchar(max),
	DiaDiemNoiTieng bit,
	KhuVuc Nvarchar(100)
)

GO
CREATE TABLE DanhLamThangCanh
(
	MaDLTC int PRIMARY KEY NOT NULL,
	TenDLTC Nvarchar(max),
	MaDiaDiem int,
	CONSTRAINT fk_MaDD1 FOREIGN KEY(MaDiaDiem) REFERENCES DiaDiem(MaDiaDiem),
	MoTaTomTat Nvarchar(400),
	MoTaChiTiet Nvarchar(max),
	NoiDung Nvarchar(max),
	LoaiDLTC Nvarchar(250),
	HinhAnhDLTC Nvarchar(250),
	SLTruyCap int,
	TrangThai bit
)
GO
*/
CREATE TABLE KhachSan
(
	MaKhachSan int PRIMARY KEY NOT NULL,
	TenKhachSan Nvarchar(250),
	HinhAnhKS Nvarchar(250),
	DiaChi Nvarchar(250),
	SoDienThoai varchar(50),
	TieuChuan Nvarchar(50),
	GhiChu Nvarchar(max)
)
--drop table KhachSan
GO
/*
CREATE TABLE HuongDanVien
(
	MaHDV int PRIMARY KEY NOT NULL,
	TenHDV Nvarchar(100),
	NgaySinh Date,
	DiaChi Nvarchar(200),
	SoDienThoai varchar(20),
	HinhAnhHDV varchar(100)
)
GO

CREATE TABLE PhuPhi
(
	MaTour Bigint PRIMARY KEY NOT NULL,
	TenPhuPhi Nvarchar(100),
	GiaNguoiLon float,
	GiaTreEm float,
)
GO
*/
CREATE TABLE KhachHang
(
	MaKH int PRIMARY KEY NOT NULL,
	TenKH Nvarchar(100),
	HinhAnhKH Nvarchar(100),
	NgaySinh Date,
	GioiTinh bit,
	DiaChi Nvarchar(250),
	QuocTich Nvarchar(50),
	SoDienThoai varchar(20),
	Email varchar(50),
)

GO
CREATE TABLE LoaiTour
(
	MaLoaiTour int PRIMARY KEY NOT NULL,
	TenLoaiTour Nvarchar(200) NOT NULL
)

CREATE TABLE Tour
(
	MaTour Bigint PRIMARY KEY NOT NULL,
	MaLoaiTour int,
	CONSTRAINT fk_MLTour FOREIGN KEY(MaLoaiTour) REFERENCES LoaiTour(MaLoaiTour),
	TenTour Nvarchar(300),
	MoTa Nvarchar(max),
	DiaDiemTapTrung Nvarchar(300),
	ThoiGianTapTrung Time,
	NgayDi Date,
	NgayVe Date,
	SoNgay Nvarchar(100),
	LichTrinh Nvarchar(max),
	GhiChu Nvarchar(max),
	HinhAnhTour Nvarchar(400),
	SoNguoiLon int,
	SoTreEm int,
	GiaNguoiLon float,
	GiaTreEm float,
	DonViTien Varchar(10),
	TrangThai bit,
)
GO
CREATE TABLE BookTour
(
	MaDatTour int PRIMARY KEY,
	MaTour Bigint,
	CONSTRAINT fk_MaTour1 FOREIGN KEY(MaTour) REFERENCES Tour(MaTour),
	HoTenKhachHang Nvarchar(100),
	SoDT varchar(15),
	Email varchar(100),
	SoNguoiLon int,
	SoTreEm int,
	NgayDat DateTime,
	GhiChu Nvarchar(max),
)
CREATE TABLE SoChoCon
(
	STT int Primary key,
	MaTour Bigint,
	CONSTRAINT fk_MaTour2 FOREIGN KEY(MaTour) REFERENCES Tour(MaTour),
	SoChoNLCon int,
	SoChoTCCon int
)
CREATE TABLE Tour_KhachSan
(
	MaTour Bigint PRIMARY KEY,
	MaKhachSan int,
	CONSTRAINT fk_MaKS FOREIGN KEY(MaKhachSan) REFERENCES KhachSan(MaKhachSan),

)
CREATE TABLE BookKhachSan(
	MaDatKS int PRIMARY KEY,
	MaKhachSan int,
	CONSTRAINT fk_MaKS2 FOREIGN KEY(MaKhachSan) REFERENCES KhachSan(MaKhachSan),
	HoTenKhachHang Nvarchar(100),
	SoDT varchar(15),
	Email varchar(100),
	NgayDat DateTime,
	GhiChu Nvarchar(max),
)
--drop table BookKhachSan
--drop table Tour_KhachSan
/*
CREATE TABLE BookVeMayBay
(
	MaBookVe int PRIMARY KEY,
	MaKH int,
	CONSTRAINT fk_MaKH2 FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH),
	TenHangBay Nvarchar(100),
	DiemKhoiHanh Nvarchar(200),
	DiemDen Nvarchar(200),
	NgayKhoiHanh Date,
	ThoiGianKhoiHanh Time,
	NgayDen Date,
	ThoiGianDen Time,
	SoHanhKhach int,
	TrangThai bit
)
Drop Table BookVeMayBay
*/
-- INSERT TABLE LoaiTour
INSERT INTO LoaiTour VALUES(1,N'DU LỊCH MIỀN BẮC');
INSERT INTO LoaiTour VALUES(2,N'DU LỊCH MIỀN TRUNG');
INSERT INTO LoaiTour VALUES(3,N'DU LỊCH MIỀN NAM');
INSERT INTO LoaiTour VALUES(4,N'DU LỊCH CHÂU Á');
INSERT INTO LoaiTour VALUES(5,N'DU LỊCH CHÂU ÂU');
INSERT INTO LoaiTour VALUES(6,N'DU LỊCH CHÂU ÚC');
-- INSERT TABLE Tour
--MIỀN BẮC
INSERT INTO Tour VALUES(001,1,N'Du lịch Hà Nội du xuân chùa Thầy - chùa Tây Phương khởi hành từ Hà Nội',N'Du lịch chùa Thầy - chùa Tây Phương đầu năm khởi hành từ Hà Nội, du khách sẽ cùng ghé thăm 2 ngôi chùa nổi tiếng nhất nhì tại Hà Nội.<br/>Chùa Thầy và chùa Tây Phương là 2 ngôi chùa vừa có giá trị văn hóa, lịch sử vô cùng lớn lại là 2 điểm tham quan du lịch có nét đẹp riêng của Hà Nội. Du lịch chùa Thầy - chùa Tây Phương đầu năm khởi hành từ Hà Nội, du khách sẽ cùng ghé thăm 2 ngôi chùa nổi tiếng nhất nhì tại Hà Nội. Chùa Thầy và chùa Tây Phương là 2 ngôi chùa vừa có giá trị văn hóa, lịch sử vô cùng lớn lại là 2 điểm tham quan du lịch có nét đẹp riêng của Hà Nội.Chùa Thầy còn gọi là chùa Cả, tên chữ là: "Thiên Phúc Tự" thuộc xã Sài Sơn, huyện Quốc Oai, tỉnh Hà Tây (cũ), nay là Hà Nội. Núi Sài Sơn có tên Nôm là núi Thầy, nên chùa được gọi là chùa Thầy. Tương truyền chùa được xây dựng từ thời nhà Lý. Đây là nơi tu hành của Thiền sư Từ Đạo Hạnh, người có công lớn trong việc dạy học, chữa bệnh cho dân và sáng lập ra bộ môn múa rối nước.Chùa Thầy có ba tòa nằm song song với nhau, toà ngoài gọi là nhà tiền tế hay chùa Hạ. Toà giữa là trung điện hay chùa Trung, toà trong cùng là thượng điện, thờ các hóa thân của thiền sư Từ Đạo Hạnh, diễn tả ba "kiếp" của Từ Đạo Hạnh: Tăng, Phật và Đế vương. Phía sau chùa có lầu chuông, lầu trống. Phía trước chùa là sân rộng nhìn ra hồ Long Chiểu. Rời chùa Thầy, du khách sẽ ghé thăm chùa Tây Phương. Chùa Tây Phương còn có tên chữ là Sùng Phúc tự, nằm trên ngọn núi Tây Phương thuộc thôn Yên, xã Thạch Xá, huyện Thạch Thất, cách trung tâm Hà Nội 40km về hướng Tây Bắc. Chùa được xây dựng khoảng thể kỷ 8 và được coi là chùa cổ thứ hai sau chùa Dâu ở Bắc Ninh. Hội chùa Tây Phương diễn ra từ ngày mùng 6 đến mùng 10/3 âm lịch. Không chỉ nổi bật với kiến trúc độc đáo, chùa Tây Phương còn là nơi tập trung những tác phẩm đặc sắc của nghệ thuật điêu khắc tôn giáo bao gồm chạm trổ, phù điêu và tạc tượng. Hầu hết các đầu bẩy, các bức cổn, xà nách, ván long... làm bằng gỗ trong chùa đều được bàn tay của các nghệ nhân chạm trổ những hình ảnh quen thuộc của dân tộc Việt Nam như: hình lá dâu, lá đề, hoa sen, hoa cúc, rồng, phượng, hổ phù... Tác giả của những tác phẩm điêu khắc tinh xảo này chính là các nghệ nhân làng mộc trong vùng Tổng Nủa, làng truyền thống Chàng Sơn – làng mộc nổi tiếng nhất xứ Đoài thời bấy giờ.Điểm nổi bật nhất ở chùa Tây Phương là các bộ tượng. Trong chùa có hơn 70 pho tượng cùng với các bức phù điêu, chủ yếu được tạc bằng gỗ mít sơn son thếp vàng, như các bộ tượng Tam Thế Phật, bộ tượng Di Đà Tam Tôn, tượng Tuyết Sơn, tượng Bồ tát Di Lặc, tượng Bồ tát Văn Thù, tượng Bồ tát Phổ Hiền, ... Nhiều pho được tạc cao hơn người thật như 8 pho tượng Kim Cương và Hộ Pháp, cao chừng 3 m, trang nghiêm phúc hậu. Phần lớn các tượng này đều được coi là có niên đại cuối thế kỷ 18. Một số tượng khác được tạc vào giữa thế kỷ 19. Đặt tour du lịch chùa Thầy, chùa Tây Phương cùng Du lịch Việt HN để khám phá nào!',N'Xe và HDV Du Lịch việt đón Quý khách tại điểm hẹn','06:00','08-12-2019','08-12-2019',N'1 ngày',N'NGÀY 1 | HÀ NỘI – CHÙA THẦY – CHÙA TÂY PHƯƠNG – HÀ NỘI<br/>
06h00: Xe và HDV Du Lịch việt đón Quý khách tại điểm hẹn, khởi hành đi chùa Thầy.<br/>
07h40: Đến chùa Thầy (được xây dựng vào thế kỷ 15 đời vua Lý Nhân Tông), Quý khách vào thăm và vãn cảnh chùa gồm: hang Cắc Cớ, động Gió Trời, hang Thánh Hóa, chiêm ngưỡng 3 pho tượng diễn tả 3 kiếp của thiền sư Từ Đạo Hạnh.<br/> Lễ hội chùa Thầy được tổ chức vào ngày 7/3 âm lịch hàng năm :<br/>
“ Nhớ ngày mùng 7 tháng 3,<br/>
Trở vào hội Láng trở ra hội Thầy”<br/>
09h30: Quý khách lên xe sang chùa Tây Phương.  <br/>
10h00: Tới chùa Tây Phương, Quý khách leo 237 bậc đá ong dẫn lên chùa. Chùa Tây Phương - một bảo tàng tượng Phật của Việt Nam với 87 pho tượng sơn son thiếp vàng đậm nét dân gian và chiêm ngưỡng 18 pho tượng La Hán nổi tiếng có từ thế kỷ 18. Đồng thời tìm hiểu nghệ thuật kiến trúc xây dựng ngôi chùa nổi tiếng của thời Hậu Lê hình chữ tam theo thuyết Âm Dương
<br/>11h00: Quý khách lên xe về làng cổ Đường Lâm -  Ngày nay, làng Đường Lâm vẫn giữ được hầu hết các đặc trưng cơ bản của một ngôi làng người Việt với cổng làng, cây đa, bến nước, sân đình, chùa, miếu, điếm canh, giếng nước, ruộng nước, gò đồi….
<br/>12h00: Quý khách ăn trưa tại làng cổ.
<br/>13h30: Quý khách tự do dạo quanh làng cổ - Một khu làng Cổ trung du Bắc Bộ gồm rất nhiều nhà cổ, thăm làng Cam Thịnh, Cam Lâm - Làng thờ 2 Vua : Phùng Hưng và Ngô Quyền. Đến đây Quý khách sẽ được chiêm ngưỡng rặng Duối cổ. Quý khách sẽ được giới thiệu về cách làm tương – một đặc sản ngon không kém tương Bần – Hưng Yên.
<br/>16h00: Quý khách lên xe về Hà Nội. Trên đường về đoàn dừng chân mua đặc sản bánh sữa, các đặc sản từ sữa Ba Vì.
<br/>18h30: Về đến Hà Nội, chia tay Quý khách , kết thúc chương trình. <br/>Hẹn gặp lại đoàn trong một lộ trình mới.',N'GIÁ BAO GỒM <br/>
- Bữa ăn theo lịch trình: 1 bữa x 120.000vnđ<br/>
- Xe du lịch đời mới, điều hòa, tiện nghi phục vụ suốt tuyến<br/>
- Vé thắng cảnh thăm quan theo chương trình ( mỗi điểm 01 lần).<br/> 
- Bảo hiểm du lịch 10.000.000vnd/trường hợp.<br/>
- HDV tiếng Việt nhiệt tình, kinh nghiệm. <br/>
- Nước uống trên xe 02 chai/khách/ngày.<br/>

KHÔNG BAO GỒM <br/>
- Đồ uống gọi thêm trong  bữa ăn. <br/>
- Thuế VAT 10% ','~/Images/HinhAnhTour/TourMienBac/tourMB1.jpg',15,5,600000,400000,'VNĐ',1);
INSERT INTO Tour VALUES(002,1,N'Tour du lịch Hà Nội - Chùa Hương - Hà Nội ',N'Du lịch Chùa Hương là một nét đẹp trong đời sống tâm linh của người dân Việt Nam, bởi chùa là nơi linh thiêng để gìn giữ và truyền bá tư tưởng của Đức Phật. Để quên đi những ồn ào của cuộc sống và cầu mong cho gia đình, người thân một năm mới tràn đầy hạnh phúc và sức khỏe. Hãy đồng hành cùng Du Lịch Việt trong touir lễ chùa Hương này để khám phá cảnh đẹp và lễ chùa linh thiêng. 

<br/>Du lịch Chùa Hương là một nét đẹp trong đời sống tâm linh của người dân Việt Nam, bởi chùa là nơi linh thiêng để gìn giữ và truyền bá tư tưởng của Đức Phật. Để quên đi những ồn ào của cuộc sống và cầu mong cho gia đình, người thân một năm mới tràn đầy hạnh phúc và sức khỏe. Hãy đồng hành cùng Du Lịch Việt trong touir lễ chùa Hương này để khám phá cảnh đẹp và lễ chùa linh thiêng.',N'Trường đại học Công Nghiệp Hà Nội','08:00','10-29-2019','10-29-2019',N'1 ngày 0 đêm',N'Hà Nội – Chùa Hương – Hà Nội <br/>

08h00: Xe và HDV đón quý khách khởi hành đi Chùa Hương, nghe Hướng dẫn viên giới thiệu về những vùng đất mà xe đoàn đi qua.
<br/>09h30: Đến bến Đục, Quý khách chuyển sang đi thuyền dọc suối Yến Vĩ chừng 3km tới chùa Thiên Trù. Quý khách đi cáp treo thăm động Hương Tích nơi chúa Trịnh Sâm đến vãn cảnh động đã tự tay đề năm chữ Hán lên cửa động “Nam thiên đệ nhất động” là nơi phong cảnh hữu tình thờ đức Phật Quan Thế Âm Bồ Tát. Tiếp tục hành trình thăm quan Chùa Gải Oan, Đễn Cửa Võng. Quý khách nghỉ ăn trưa tại Thiên Trù.
<br/>13h30: Sau khi ăn trưa du khách lên chùa Thiên Trù – Bếp Trời tham quan và dâng lễ.
<br/>15h30: Quay trở lại thuyền về bến lên xe ôtô về Hà nội. kết thúc chương trình Qúy khách lên thuyền thăm quan khu sinh thái Tràng An – Một trong những thắng cảnh đẹp nhất của Ninh Bình, nơi những dải đá vôi, thung lũng và những sông ngòi đan xen tạo nên một không gian huyền ảo, kỳ bí Cùng nghe những người lái đò giới thiệu về những truyền thuyết, những câu chuyện lịch sử về quá trình hình thành của khu du lịch này.
<br/>16h30: Quý khách lên xe trở về Hà Nội kết thúc chương trình !',N'Giá tour bao gồm :<br/>
<br/>Xe ôtô đời mới máy lạnh đưa đón tham quan suốt tuyến. 
<br/>Ăn uống: theo chương trình
<br/>Hướng dẫn viên thuyết minh tiếng Việt nhiệt tình phục vụ suốt tuyến
<br/>Vé vào cổng các điểm tham quan.
<br/>Nước uống phục vụ 1 chai/ngày.
<br/>Bảo hiểm du lịch suốt tuyến, mức bồi thường cao nhất 30.000.000 VND/trường hợp.<br/>
Không bao gồm:<br/>
Hóa đơn giá trị gia tăng<br/>
Vé cáp treo lên Động Hương Tích<br/>
Bia hay nước ngọt trong các bữa ăn.<br/>
Tham quan ngoài chương trình.<br/>
Chi phí cá nhân<br/>
Tiền típ cho Hướng Dẫn Viên và lái xe<br/>
<br/>Vé dành cho trẻ em:<br/>
<br/>Trẻ em dưới 05 tuổi: miễn phí tour. Cha, mẹ hoặc người thân đi kèm tự lo các chi phí ăn, , tham quan (nếu có) cho bé. Hai người lớn chỉ kèm 1 trẻ em dưới 5 tuổi, em thứ 2 trở lên phải mua ½ vé tour.
<br/>Trẻ em từ 05 – đến 09 tuổi : 50% giá tour. Bao gồm các dịch vụ ăn uống, ghế ngồi trên xe. Hai người lớn chỉ được kèm 1 trẻ em từ 5 đến 9 tuổi, em thứ 2 trở lên tính 75% giá tour.
<br/>Trẻ em từ 10 tuổi trở lên : 100% giá tour và tiêu chuẩn như người lớn.','~/Images/HinhAnhTour/TourMienBac/tourMB2.jpg',20,5,590000,390000,'VNĐ',1);
INSERT INTO Tour VALUES(003,1,N'Tour Quảng Ninh: We Go Hạ Long cruise',N'Chương trình We Go Hạ Long 1 ngày được thiết kế dành riêng cho giới trẻ, thích khám phá, thích tắm biển nhưng chỉ có 1 ngày để trải nghiệm. We Go Hạ Long sẽ giúp bạn thực hiện điều đó.',N'Ngõ 86, đường Cầu Diễn, Quận Bắc Từ Liêm, Hà Nội','07:30','09-19-2019','09-19-2019',N'1 ngày 0 đêm',N' HÀ NỘI - HẠ LONG - HÀ NỘI (Ăn trưa)<br/>
7h30 - 8h15: Xe và hướng dẫn viên đón Quý khách tại các khách sạn và văn phòng trong Phố Cổ Hà Nội/ Nhà hát lớn/ Văn phòng công ty khởi hành đi du lịch Hạ Long. Trên đường đi dừng nghỉ tại Hải Dương 20 phút cho Quý khách đi vệ sinh cá nhân.
 
<br/>12h00-12h15: Đến cảng tàu Tuần Châu, Quý khách xuống tàu để bắt đầu hành trình khám phá Vịnh Hạ Long.
We Go Halong sẽ đưa Quý khách đi thăm vịnh theo hành trình 5,5 Tiếng, giống với hành trình của những con tàu ngủ 2 ngày 1 đêm. Tàu sẽ đi qua vô vàn các hòn đảo lớn nhỏ với nhiều hình dáng khác nhau và được những ngư dân nơi đây đặt cho những các tên đặc biệt như: Hòn Gà Chọi, hòn Chó Đá, … Quý khách thưởng thức bữa trưa trên tàu.
<br/>14h00: Đến đảo Bồ Hòn. Quý khách thăm quan Hang Sửng Sốt  - Một trong những hang động đẹp nhất vịnh Hạ Long.
Tiếp theo, Quý khách sẽ chèo Kayak hoặc đi thuyền nan thăm Hang Luồn.
Sau 30 phút chèo Kayak, Quý khách lên tàu để đến với đảo Ti Top. Quý khách có thể tắm biển tại bãi tắm TiTop với bãi cát trắng, hoặc thử treekking leo lên đỉnh núi Ti Top ngắm nhìn toàn cảnh Vịnh Hạ Long.
<br/>16h00: Quý khách quay trở lại tàu, thưởng thức trà chiều và bánh ngọt. Tàu sẽ di chuyển đưa Quý khách về lại cảng Tuần Châu. Quý khách có thể tắm nắng trên boong tàu, nghe nhạc và thư giãn, hòa mình vào thiên nhiên của Vịnh Hạ Long.
<br/>17h45-18h00: Về tới cảng tàu Tuần Châu. Quý khách lên xe trở về Hà Nội qua đường cao tốc Hạ Long – Hải Phòng – Hà Nội.
<br/>20h15-20h45: Về tới Hà Nội, xe đưa Quý khách về lại điểm đón ban đầu. <br/>Kết thúc chương trình khám phá Kỳ Quan thiên nhiên thế giới Vịnh Hạ Long 1 ngày cùng tàu We Go Halong. ',N'GIÁ TOUR BAO GỒM:<br/>
<br/>Xe ô tô máy lạnh đón tiễn Hà Nội – Cảng Tuần Châu – Hà Nội
<br/>Tàu Wego Hạ Long thăm quan vịnh 5,5 tiếng
<br/>Vé thăm quan Vịnh Hạ Long theo hình trình tour
<br/>Vé cảng Tuần Châu
<br/>Kayaking  hoặc đò tay tại Hang Luồn
<br/>Trà chiều + bánh ngọt 
<br/>Hướng dẫn viên tiếng Việt/tiếng Anh phục vụ theo chương trình
<br/>Nước suối 2 chai/khách/ngày.
<br/>Phí cao tốc Hạ Long – Hải Phòng – Hà Nội (1 chiều về)
<br/>GIÁ TOUR KHÔNG BAO GỒM:<br/>
<br/>Thuế VAT
<br/>Chi phí đồ uống trong bữa ăn
<br/>Các chi phí khác không được đề cập đến trong chương trình
<br/>Tip cho HDV và lái xe.
<br/>TRẺ EM:<br/>
<br/>Dưới 5 tuổi: Miễn phí giá tour, 2 người lớn chỉ được kèm 1 trẻ em dưới 5 tuổi. Từ trẻ thứ 2 tính 50%.
<br/>Từ 5 – dưới 9 tuổi (Cao dưới 1m3): 50% giá tour
<br/>Từ 9 tuổi trở lên (Cao từ 1m3 trở lên): Tính như người lớn.
 ','~/Images/HinhAnhTour/TourMienBac/tourMB3.jpg',20,10,1000000,890000,'VNĐ',1);
INSERT INTO Tour VALUES(004,1,N'Du lịch Yên Tử - Hạ Long - Chùa Ba Vàng',N'Quảng Ninh thường được chọn là điểm du xuân của nhiều du khách thập phương mỗi độ xuân về. Trong làn mưa bụi nhẹ, từng dòng người đổ về Yên Tử để được tận hưởng cảm giác được đặt chân đến 1 vùng đất thiêng liêng, để cảm nhận được sự trầm ấm, linh thiêng của vùng đất tổ, để được bày tỏ lòng thành kính của mình... Giúp du khách thập phương có cơ hội hành hương về cõi phật những ngày đầu năm để cầu mong may mắn và giải tỏa tâm hồn.

<br/>Du lịch Yên Tử - Hạ Long - Chùa Ba Vàng 2 ngày giá tốt từ Hà Nội - Du lịch Yên Tử là một ngọn núi cao trong dãy núi Đông Triều, ở độ cao 1068m, thuộc tỉnh Quảng Ninh. Vốn là một thắng cảnh thiên nhiên, trước đây còn có tên gọi là Bạch Vân Sơn do thường có mây trắng bao phủ quanh năm, với cảnh đẹp thần tiên cùng nhiều di tích lịch sử, được mệnh danh là "đất tổ Phật Giáo Việt Nam".Du lịch Chùa Ba Vàng nằm trên núi Ba Vàng, phường Quang Trung, TP. Uông Bí. Đây là ngôi chùa có tòa chính điện lớn nhất Việt Nam.Vào ngày 9/3/2014, chùa Ba Vàng đã chính thức được khánh thành. Chùa Ba Vàng tên chữ là Bảo Quang Tự được xây dựng từ thời nhà Trần (thế kỷ thứ XIII ) nằm tọa lạc trên núi Thành Đẳng thuộc Quần thể của Thiền phái Trúc Lâm Yên Tử - một phái thiền lớn nhất và độc tôn của nước ta do Phật hoàng Trần Nhân Tông đắc pháp ý chỉ thiền sáng lập. ',N'Quận Hoàn Kiếm, Hà Nội','05:00','11-20-2019','11-21-2019',N'2 ngày 1 đêm',N'NGÀY 1 | HÀ NỘI - YÊN TỬ - CHÙA BA VÀNG - HẠ LONG (Ăn trưa, tối)

<br/>05h00: Xe và hướng dẫn của Du Lich Việt Hà Nội đón quý khách tại điểm hẹn khởi hành đi khu danh thắng Yên Tử, quý khách dừng chân ăn sáng tự túc tại Hải Dương.
<br/>09h00: Đến khu danh thắng Yên Tử, quý khách tham quan và lễ tại quần thể chùa Yên Tử:
<br/>Chùa Hoa Yên
<br/>Chùa bảo Sái
<br/>Chùa Một Mái
<br/>Chùa Đồng...
<br/>Cùng cảm nhận, thưởng ngoạn vẻ đẹp núi rừng Yên Tử từ cabin của cáp treo Yên Tử.


<br/>11h00: Quý khách ăn trưa tại nhà hàng. Chiều quý khách đi lễ tại Chùa Ba Vàng, quý khách lễ tại đại Hùng Bảo Điện, lầu chuông, lầu Trống, hành lang la hán, bảo tàng, thư viện, thiền đường, cổng đá, cổng tam quan trung, tam quan nội.


<br/>16h00: Xe đưa quý khách đi Hạ Long. Đến Hạ Long, quý khách nhận phòng khách sạn, nghỉ ngơi, đi dạo.
<br/>18h30: Quý khách ăn tối tại nhà hàng, sau bữa tối dạo chơi chợ đêm Hạ Long. Quý khách nghỉ đêm tại khách sạn.

<br/>NGÀY 2 | HẠ LONG - ĐỀN CỬA ÔNG - CHÙA CÁI BẦU - HÀ NỘI (Ăn sáng, trưa)<br/>

<br/>07h00: Quý khách ăn sáng buffet tại khách sạn, lên xe đoàn khởi hành đi Đền Cửa Ông, ngôi đền thờ Hưng Nhượng Vương - Trần Quốc Tảng, con trai thứ của Hưng Đạo Vương - Trần Quốc Tuấn. Quý khách vào làm lễ cầu may, vãn cảnh ngôi đền.

<br/>09h00: Quý khách đi lễ và tham quan ngôi chùa Cái Bầu. Đoàn tham quan làm lễ dâng hương và vãn cảnh chùa. 
<br/>12h00: Đoàn ăn trưa tại Hạ Long, sau bữa trưa đoàn khởi hành về Hà Nội. Đưa đoàn về điểm đón ban đầu, HDV chia tay đoàn và hẹn gặp lai đoàn trong những chương trình sau.
 
<br/>Hẹn gặp lại quý khách trong chuyến đi lần sau!',N'Giá tour bao gồm:<br/>
<br/>Xe ô tô chất lượng cao đưa đón theo chương trình, lái xe nhiệt tình, kinh nghiệm
<br/>Khách sạn tiêu chuẩn 3 sao, đầy đủ tiện nghi, trung tâm: 02 khách/ phòng
<br/>Khách sạn BMC, Công Đoàn, Eden hoặc tương đương
<br/>Các bữa ăn trong chương trình (3 bữa chính +  bữa phụ buffet)
<br/>Hướng dẫn viên suốt tuyến, nhiệt tình, kinh nghiệm
<br/>Phí tham quan
<br/>Nước uống trên xe: 01 chai/khách
<br/>Bảo hiểm du lịch suốt tuyến
<br/>Giá tour trọn gói không bao gồm:
<br/>Thuế VAT (10%), nếu quý khách lấy thuế cộng thêm 10%
<br/>Các chi phí cá nhân khác (đồ uống trong bữa ăn)
<br/>Giá tour dành cho trẻ em:<br/>
<br/>Trẻ em dưới 5 tuổi miễn phí giá tour, bố mẹ tự lo cho bé
<br/>Trẻ em 5 - 10 tuổi tính 50% giá tour
<br/>Trẻ em 11 tuổi trở lên tính như người lớn','~/Images/HinhAnhTour/TourMienBac/tourMB4.jpg',25,5,1350000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(005,1,N'Du lịch Mộc Châu ',N'HÀ NỘI - BẢN LÁC - MAI CHÂU - THÁC DẢI YẾM - MỘC CHÂU<br/>
Số ngày: 2 ngày 1 đêm<br/>
Vận chuyển: Ô tô<br/>
<br/>Du lịch Mộc Châu 2 ngày 1 đêm. Cao nguyên Mộc Châu  được thiên nhiên ban tặng cho khung cảnh hoang sơ và luôn biến ảo kỳ diệu. Như một sự sắp đặt hoàn hảo, để Mộc Châu chỗ nào cũng có hoa cỏ đẹp đẽ, mơ, mận ,đào, lan, hoa  cải ....khoe sắc. Hòa cùng vẻ đẹp yên bình và hùng vĩ của thiên nhiên là con ngưới với nét văn hóa đặc sắc đã tạo ấn tượng khó phai một bản thơ tình của núi rừng gửi tặng cho du khách gần xa.',N'Hồ Hoàn Kiếm','06:30','12-12-2019','12-13-2019',N'2 ngày 1 đêm',N'NGÀY 1 | HÀ NỘI – MỘC CHÂU (Ăn trưa, tối)

<br/>06h30: Xe và hướng dẫn viên đón Quý khách tại điểm hẹn. Xe dừng chân trên đường tại khu vực Xuân Mai để Quý khách tự do ăn sáng.
<br/>10h30: Dừng chân trên đèo Thung Khe để chụp ảnh và ngắm cảnh rừng núi hùng vỹ của Hòa Bình.
<br/>12h30: Đến Mộc Châu, Quý khách ăn trưa tại nhà hàng, nghỉ ngơi.
<br/>13h30: Hướng dẫn viên đưa Quý khách đi thăm quan các điểm sau: 
<br/>Thác Dải Yếm - Một thác nước tuy nhỏ nhưng mang một vẻ đẹp quyến rũ. Tương truyền, dòng thác này là dải yếm của người con gái cứu chàng trai thoát khỏi dòng nước lũ.
<br/>Trường hợp vào mùa khô, thác ít nước chúng tôi sẽ thay thế điểm thăm quan Thác Dải Yếm bằng thăm khu Tượng đài Tây tiến để thăm, nghe và tìm hiểu về Con đường Tây tiến năm xưa và tình hữu nghị Việt - Lào trong những năm kháng chiến.
<br/>Vườn hoa Happy land - Happy land có diện tích gần 5ha, nằm giữa một thung lũng rộng lớn ở bản Lùn, xã Mường Sang. Đến đây, du khách sẽ được đón chào bởi những thảm hoa được trồng từ nhiều loại hoa khác nhau, trong đó có những loài hoa đặc trưng của vùng Tây Bắc). 
<br/>Rừng thông Bản Áng giống như một Đà Lạt thu nhỏ trên đất cao nguyên Mộc Châu. Tại đây Quý khách có thể thuê xe đạp hoặc ngồi xe ngựa kéo để dạo vòng vòng ngắm cảnh thư giãn xung quanh Hồ Bản Áng. Hoặc đơn giản là leo lên những đồi thông, ngồi nghỉ ngơi và lấy lại cân bằng sau những bộn bề cuộc sống nơi thành thị ồn ào.
<br/>18h00: Quý khách ăn tối tại nhà hàng sau đó về khách sạn nhận phòng nghỉ ngơi. Buổi tối Quý khách tự do khám phá cao nguyên Mộc Châu. Nghỉ đêm Mộc Châu.
<br/>NGÀY 2 | MỘC CHÂU – MAI CHÂU – HÀ NỘI (Ăn sáng trưa)<br/>

<br/>06h30: Sau bữa sáng tại nhà hàng hoặc khách sạn, Quý khách cùng hướng dẫn viên tiếp tục thăm quan Đồi chè Mộc Sương và chụp hình cùng với đồi chè Trái tim, có lẽ đồi chè Mộc Sương không chỉ là đồi chè đẹp nhất của Cao nguyên Mộc Châu mà còn là đồi chè đẹp nhất của Việt Nam bởi những luống chè xanh mởn tròn trịa và uốn lượn xa ngút tầm mắt đưa đến một cảm giác lãng mạn và bình yên. Đây cúng chính là vùng nguyên liệu để sản xuất ra những loại chè ngon và nổi tiếng mà một trong những thương hiệu nổi tiếng chính là Ô Long trà.
<br/>09h30: Quý khách lên xe về Hà Nội. Trên đường tiếp tục dừng chụp hình tại những điểm đẹp mà đoàn chưa kịp chụp hình ngày hôm trước.
<br/>11h30: Ăn trưa tại Mai Châu. Sau bữa trưa, Quý khách có thể khám phá thung lũng Mai Châu bằng xe đạp (hoặc xe điện, chi phí thuê xe đạp hoặc xe điện tự túc). Quý khách thăm những ngôi nhà sàn nhỏ xinh của người Thái để tìm hiểu những nét văn hóa độc đáo của họ, thăm những gian hàng thổ cẩm, cùng học cách dệt thổ cẩm của người Thái và mua những món quà lưu niệm nơi đây. Sau đó Quý khách tự do đạp xe hoặc dạo bộ và mua sắm đồ, chụp hình.
<br/>15h00: Quý khách lên xe về Hà Nội. Trên đường về ghé dừng nghỉ ngơi tại đặc sản sữa Ba Vì mua đồ về làm quà cho bạn bè và người.19h00: Xe đưa quý khách tới Hà Nội. <br/>Kết thúc chương trình. Hẹn gặp lại Quý khách!',N'GIÁ TOUR BAO GỒM: <br/>
<br/>Xe ô tô đời mới đưa đón theo chương trình.
<br/>Nghỉ đêm tại ngủ homestay (nhà sàn tập thể, chăn đệm sạch sẽ) hoặc khách sạn theo các tiêu chuẩn do khách hàng lựa chọn, 02 khách/phòng (lẻ ghép ngủ 3)
<br/>03 bữa ăn chính theo chương trình (3-4 món chính, 02 món rau, cơm, canh), ăn sáng tại nhà sàn
<br/>Hướng dẫn viên phục vụ nhiệt tình, thành thạo, chu đáo xuyên suốt tuyến du lịch
<br/>Vé thắng cảnh các điểm có trong chương trình
<br/>Nước uống phục vụ trên xe, mỗi ngày 01 chai 500ml
<br/>Bảo hiểm du lịch trọn tour mức đền bù tối đa 20.000.000đ/người/vụ
<br/>GIÁ TOUR KHÔNG BAO GỒM:<br/>
<br/>Hóa đơn thuế GTGT
<br/>Bảo hiểm du lịch đối với khách du lịch có quốc tịch nước ngoài
<br/>Đồ uống trong các bữa ăn, trong khách sạn và các chi phí cá nhân khác
<br/>Tiền típ cho lái xe và HDV, thông thường khoảng 50.000đ/khách/tour','~/Images/HinhAnhTour/TourMienBac/tourMB5.jpg',30,5,1590000,1290000,'VNĐ',1);
INSERT INTO Tour VALUES(006,1,N'Du lịch Hang Múa Ninh Bình',N'Du lịch Ninh Bình Quý khách trải nghiệm đạp xe ngắm cánh đồng làng quê bình yên trải dài mênh mông tít tắp. Thăm Tuyệt Tình Cốc, nơi có chùa Am Tiên có hình giống miệng con rồng nên được gọi là hang rồng. Chùa Am Tiên được bao quanh bốn bề là núi, mang vẻ tĩnh mịch. Đứng từ chùa Am Tiên nhìn xuống, bạn sẽ nhìn được bao quát không gian sơn thủy hữu tình. Qúy khách thăm hang Múa và leo lên đỉnh núi Ngọa Long ngắm toàn cảnh hung vĩ của vùng núi nơi đây từ trên đỉnh đến thung lũng. ',N'Khách sạn du lịch, Quận Hoàn Kiếm','08:00','08-15-2019','08-15-2019',N'1 ngày 0 đêm',N'NGÀY 1 | <br/>
<br/>8:00 – 8:30, Xe và HDV đón quý khách tại khách sạn, khởi hành đi Ninh Bình, trên đường đi đoàn dừng chân tự do ăn sáng hoặc đi vệ sinh.
<br/>Quý khách đến bến đò Tràng An, lên thuyền xuôi dòng Sào Khê qua những dãy núi đá vôi, quanh các rừng nguyên sinh và rừng lau. Đoàn sẽ tham quan 9 hang chính với những cái tên rất lạ như: hang Sáng, hang Tối, hang Nấu Rượu… du khách sẽ được cô lái đò đưa xuyên qua các hang động lớn nhỏ, lúc ngắn, lúc dài, tất cả cảnh vật hoang sơ hòa quyện vào nhau xua tan đi cái mệt mỏi, ngột ngạt nơi thành thị.
<br/>Sau đó quý khách nghỉ ngơi ăn trưa tại nhà hàng, thưởng thức những món ăn đặc sản của vùng quê.
 

<br/>Vào buổi chiều, quý khách sẽ đạp xe đi thăm hang Múa. Trên đường đi chúng ta được ngắm nhìn phong cảnh làng quê bình yên với cánh đồng lúa, những chú trâu, dê nhởn nhơ ăn. Đến hang Múa, Quý khách sẽ thăm hang Múa và leo lên đỉnh núi Ngọa Long ngắm toàn cảnh hung vĩ của vùng núi nơi đây từ trên đỉnh đến thung lũng.
Sau đó đoàn sẽ đạp xe đi qua những ngôi làng và ngắm nhìn cuộc sống thường ngày của người dân địa phương để tới Tuyệt Tình Cốc, nơi có động Am Tiên có hình giống miệng con rồng nên được gọi là hang rồng. Động Am Tiên được bao quanh bốn bề là núi, mang vẻ tĩnh mịch. Đứng từ động Am Tiên nhìn xuống, bạn sẽ không khỏi ngỡ ngàng trước vẻ đẹp của thiên nhiên Ninh Bình. Sau đó quý khách đạp xe về bungalow nghỉ ngơi, bơi hoặc thư giãn trước khi lên xe về Hà Nội.
<br/>19:00 Về đến Hà Nội, kết thúc chuyến thăm quan du lịch.
',N'GIÁ TOUR BAO GỒM: <br/>                            
<br/>Xe ô  tô vận chuyển theo chương trình đón trả trong phố cổ 
<br/>Hướng dẫn viên thân thiện, nhiệt tình
<br/>2 chai nước suối/khách /ngày
<br/>Bữa trưa buffet tại nhà hàng
<br/>Vé thắng cảnh & vé đò tại Tràng An, hang Múa, Tuyệt Tình Cốc
<br/>Xe đạp trong chương trình
<br/>Xe đưa khách từ bungalow đi chùa Bái Đính
<br/>GIÁ TOUR KHÔNG BAO GỒM:
<br/>Chi tiêu cá nhân, đồ uống, hoá đơn VAT...
<br/>Tiền tip cho hướng dẫn viên, lái xe
<br/>Đón trả ngoài Phố Cổ Hà Nội','~/Images/HinhAnhTour/TourMienBac/tourMB6.jpg',25,5,1790000,1490000,'VNĐ',1);
INSERT INTO Tour VALUES(007,1,N'Du lịch Chùa Bái Đính - Tràng An',N'Hành trình: HÀ NỘI - BÁI ĐÍNH - TRÀNG AN - HÀ NỘI<br/>
<br/>Lịch trình: 1 ngày
<br/>Khởi hành: Hàng ngày
<br/>Vận chuyển: Ô tô
<br/>Du lịch Ninh Bình. Khu du lịch sinh thái Tràng An nằm phía Đông tỉnh Ninh Bình, có tổng diện tích gần 2000 ha, được chia làm 5 khu chức năng chính: khu bảo tồn đặc biệt (khu cố đô Hoa Lư), khu trung tâm, khu hang động, khu dịch vụ du lịch, khu tâm linh núi chùa Bái Đính. Toàn khu có 47 di tích lịch sử với nhiều hang động ẩn mình trong những núi đá vôi, các thung lũng và hệ thống sông ngầm đan xen tạo nên một không gian huyền ảo và thơ mộng. Với hàng trăm pho tượng lớn nhỏ, Bái Đính (Gia Viễn, Ninh Bình) được coi là một trong những ngôi chùa lớn nhất và có nhiều tượng nhất Việt Nam.',N'Quận Hoàn Kiếm, Hà Nội','08:00','08-24-2019','08-24-2019',N'1 ngày 0 đêm',N'NGÀY 1 | HÀ NỘI - BÁI ĐÍNH - TRÀNG AN
<br/>8h00: Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn và khởi hành đi Chùa Bái Đính, Khu Tràng An (cách Hà Nội 120km về phía nam). 
<br/>10h30: Đoàn đến nơi làm lễ tại Chùa Bái Đính - ngôi chùa lớn nhất Việt Nam, ngôi chùa này đã sớm nổi tiếng với nhiều kỷ lục: Khuôn viên cả khu chùa Bái Đính có diện tích 107ha. Trong đó, Điện thờ Tam Thế và Pháp Chủ rộng hàng ngàn mét vuông; tại ngôi chùa này có tượng Phật Tổ Như Lai bằng đồng lớn nhất Đông Nam Á nặng 100 tấn và ba pho tượng Tam Thế, mỗi pho nặng 50 tấn...
<br/>12h30: Quý khách về nhà hàng nghỉ ngơi ăn trưa, thưởng thức món ăn đặc sản Ninh Bình.
<br/>13h30: Xe đưa quý khách ra bến, lên thuyền đi dọc theo suối thăm khu du lịch Tràng An - nơi những dải đá vôi, thung lũng và những sông ngòi đan xen tạo nên một không gian huyền ảo, kỳ bí. Quý khách ngồi trên thuyền tham quan các hang động với những hình thù nhũ đá rất đặc sắc như: Hang tối, hang sáng, hang nấu rượu, hang sính, hang si, hang ba giọt, hang địa linh…Khung cảnh hùng vĩ, tráng lệ được ví như Hạ Long trên cạn.
<br/>16h00: Quý khách lên xe bắt đầu quay trở về Hà Nội.
<br/>18h30: Quý khách về đến Hà Nội. Hướng dẫn viên chia tay đoàn và hẹn gặp lại đoàn trong những chuyến đi sau.',N'GIÁ TOUR BAO GỒM:<br/>
<br/>Xe đưa đón theo chương trình
<br/>Hướng dẫn viên tiếng anh, tiếng việt
<br/>Ăn trưa BUFFET tại nhà hàng Tràng An Bungalow.
<br/>Vé tham quan trong chương trình
<br/>Thuyền thăm quan KDL Tràng An 
<br/>Xe điện tại chùa Bái Đính khứ hồi
<br/>Xe đạp thăm quan làng quê tại Tràng An
<br/>GIÁ TOUR KHÔNG BAO GỒM:<br/>
<br/>Đồ uống, các chi phí cá nhân
<br/>Thuế VAT (khách hàng có nhu cầu lấy hóa đơn vui lòng trả thêm 10%VAT)','~/Images/HinhAnhTour/TourMienBac/tourMB7.jpg',25,10,950000,800000,'VNĐ',1);
INSERT INTO Tour VALUES(008,1,N'Du lịch Tam Cốc - Tràng An',N'Du lịch Ninh Bình Quý khách trải nghiệm đạp xe ngắm cánh đồng làng quê bình yên trải dài mênh mông tít tắp. Đi đò Tràng An, lên thuyền xuôi dòng Sào Khê qua những dãy núi đá vôi, quanh các rừng nguyên sinh và rừng lau đi qua 9 hang chính với những cái tên rất lạ như hang Sáng, hang Tối, hang Nấu Rượu… du khách sẽ được cô lái đò đưa xuyên qua các hang động lớn nhỏ, lúc ngắn, lúc dài, tất cả cảnh vật hoang sơ hòa quyện vào nhau xua tan đi cái mệt mỏi, ngột ngạt nơi thành thị',N'Tập trung tại khách sạn','08:00','9-11-2019','9-12-2019',N'2 ngày 1 đêm',N'NGÀY 1 | Hoa Lư – Tam Cốc – Đạp xe tại Tam cốc – Nghỉ đêm tại Tràng An bungalow <br/>
8:00 – 8:30, xe và hướng dẫn viên đón quý khách tại khách sạn, sau đó khởi hành đi Ninh Bình – một trong những điểm du lịch nổi tiếng thuộc ven Đồng Bằng Sông Hồng, cách Hà Nội gần 100km về phía nam. Xe đến Ninh Bình, Quý khách bắt đầu chương trình bằng chuyến thăm 2 ngôi đền nổi tiếng, Đền Vua Đinh thờ vua Đinh Tiên Hoàng, người sáng lập ra triều Đinh – triều đại đầu tiên của nước Việt Nam, và Đền Vua Lê thờ vua Lê Đại Hành người sáng lập ra triều Tiền Lê - triều đại nối tiếp.
<br/>Sau khi thăm đền Đinh – Lê, hướng dẫn viên đưa quý khách về nhà hàng buffet, thưởng thức bữa trưa với phong cách truyền thống của người Việt. Đặc biệt, quý khách sẽ được thưởng thức đặc sản Dê núi – 1 nét đặc trưng của vùng núi đá Ninh Bình.
<br/>Sau khi ăn trưa xong, hướng dẫn viên đưa đoàn xuống đò thăm quan Tam Cốc – được xem là  Hạ Long trên cạn, dọc theo con sông Ngô Đồng và khám phá 3 Hang: Hang Cả, Hang Hai và Hang Ba.
<br/>Quý khách quay trở lại bến, tiếp tục chương trình đạp xe khám phá sự thanh bình của làng quê Việt, với những con đường nhựa mới, những cánh đồng lúa trải dài, mênh mông tít tắp. NGÀY 2 | Ngồi thuyền Tràng An – Lớp học làm bánh – Chùa Bái Đính
<br/>Từ 6:30, chào đón một ngày mới bằng ánh bình minh với bài tập Tai chi và bữa sáng tràn đầy năng lượng. Quý khách đến bến đò Tràng An, lên thuyền xuôi dòng Sào Khê qua những dãy núi đá vôi, quanh các rừng nguyên sinh và rừng lau đi qua 9 hang chính với những cái tên rất lạ như hang Sáng, hang Tối, hang Nấu Rượu… du khách sẽ được cô lái đò đưa xuyên qua các hang động lớn nhỏ, lúc ngắn, lúc dài, tất cả cảnh vật hoang sơ hòa quyện vào nhau xua tan đi cái mệt mỏi, ngột ngạt nơi thành thị.
<br/>Sau đó đoàn quay trở về bungalow tham gia vào lớp học làm bánh đầy thú vị, nghỉ ngơi ăn trưa tại nhà hàng, thưởng thức những món ăn đặc sản của vùng quê. Sau khi ăn xong quý khách trả phòng và tự thanh toán các chi phí cá nhân phát sinh tại bungalow.
 
<br/>Vào buổi chiều, quý khách đến khuôn viên chùa Bái Đính, bắt đầu thăm quan hành hương lễ phật tại đây. Bái Đính – là tổ hợp kiến trúc phật giáo lớn nhất tại Việt Nam. Chùa Bái Đính đã xác lập nhiều kỷ lục như: Khu chùa có diện tích rộng nhất Việt Nam (107ha). Điện thờ Tam Thế và Pháp Chủ có diện tích lên tới 1.000 m2. Tượng Phật bằng đồng lớn nhất Đông Nam Á: Tượng Phật Tổ Như Lai nặng 100 tấn, ba pho Tam Thế mỗi pho nặng 50 tấn. Hai quả chuông lớn nhất Đông Nam Á: 36 và 27 tấn. Chùa có nhiều tượng La Hán nhất Việt Nam với 500 vị bằng đá cao khoảng 2 mét. Kỷ lục về số cây bồ đề nhiều nhất Việt Nam với 100 cây bồ đề được chiết từ cây bồ đề Ấn Độ. Sau khi tham quan xong quý khách lên xe về Hà Nội.
<br/>19:00 Về đến Hà Nội, kết thúc chuyến thăm quan du lịch.',N'GIÁ TOUR BAO GỒM:                                 
<br/>Xe ô tô vận chuyển theo chương trình đón trả trong phố cổ 
<br/>Hướng dẫn viên thân thiện, nhiệt tình
<br/>2 chai nước suối/khách /ngày trên xe và trong phòng ngủ
<br/>Bữa ăn được đề cập trong chương trình (2 bữa trưa, 1 bữa tối, 1 bữa sáng)
<br/>Vé thắng cảnh được đề cập trong chương trình
<br/>Tự do sử dụng xe đạp tại bungalow để đạp xe khám phá
<br/>Phòng Bungalow nghỉ đêm tiêu chuẩn (2 – 3 khách/1 phòng)
<br/>Nước chào mừng khách, lớp học làm bánh tại bungalow
<br/>Ngồi thuyền tại Tam Cốc và Tràng An
<br/>GIÁ TOUR KHÔNG BAO GỒM:<br/>
<br/>Chi tiêu cá nhân, đồ uống, hoá đơn VAT...
<br/>Tiền tip cho hướng dẫn viên, lái xe
<br/>Đón trả ngoài Phố Cổ Hà Nội
<br/>Phụ phí phòng đơn: 400.000 VND (18 USD)','~/Images/HinhAnhTour/TourMienBac/tourMB8.jpg',15,5,3500000,3000000,'VNĐ',1);
INSERT INTO Tour VALUES(009,1,N'Tour du lịch Sapa - Cát Cát - Fansipan ',N'Hành trình: HÀ NỘI - CÁT CÁT - HÀM RỒNG - FANSIPAN - HÀ NỘI<br/>
Lịch trình: 3 ngày 2 đêm
<br/>Khởi hành: Theo yêu cầu
<br/>Vận chuyển: Ô tô
<br/>Tour du lịch Sapa. Sapa là điểm du lịch lý tưởng dành cho du khách ưa thích du lịch núi và khám phá về đời sống và phong tục tập quán của người dân tộc bản địa. Đến với Sapa, chắc chắn mỗi người đều có những kỷ niệm khó quên, những giây phút nghỉ ngơi thực sự, hòa mình vào không gian trong trẻo của núi rừng',N'Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn','06:30','12-01-2019','12-03-2019',N'3 ngày 2 đêm',N'NGÀY 1 | HÀ NỘI - SAPA - HÀM RỒNG (Ăn trưa, tối) 
<br/>06h30: Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn khởi hành đi Lào Cai, xe chạy theo đường cao tốc Nội Bài – Lào Cai dài 245 km với chưa đầy 5h đồng hồ. Quý khách có cơ hội ngắm phong cảnh tuyệt đẹp trên cung đường này. 
<br/>11h30: Xe đưa du khách đến Sapa: Quý khách ăn trưa tại sapa sau đó nhận phòng nghỉ ngơi. 
 
<br/>14h00: Hướng dẫn viên đón khách thăm quan khu du lịch Hàm Rồng với khung cảnh hoang sơ, kỳ vĩ; thăm vườn lan Đông Dương với đủ loại, muôn sắc màu; đầu Rồng Thạch Lâm kì vĩ, vượt qua Cổng trời 1, Cổng trời 2, du khách sẽ được đặt chân đến nơi cao nhất của Hàm Rồng đó là sân Mây - nơi giao thoa của đất trời, ngắm toàn cảnh Sapa từ trên cao,…
<br/>17h00: Quý khách về Sapa nghỉ ngơi, ăn tối. Quý khách tự do khám phá Sapa về đêm. Nghỉ ngơi tại khách sạn. NGÀY 2 | SAPA - CÁT CÁT- FANXINPANG      (Ăn sáng, trưa, tối) 
<br/>8h00: Sau khi ăn sáng, thưởng thức vẻ đẹp của Sapa, xe đón quý khách  đi thăm quan Bản Cát Cát. Đoàn đi bộ bắt đầu hành trình khám phá bản làng Cát Cát - Sin Chải của người H’Mông - do người Pháp phát hiện và chọn nơi đây làm khu nghỉ dưỡng cho các quan chức từ đầu thế kỷ XX. Đến với bản Cát Cát, du khách sẽ được thăm bản làng Cát Cát, trạm thủy điện Cát Cát, thác nước Cát Cát, tìm hiểu văn hóa, phong tục độc đáo của người dân nơi đây với nghề truyền thống như dệt vải, chạm trổ bạc, rèn nông cụ, tục kéo vợ...
<br/>11h00: Quay lại thị trấn Sapa ăn trưa, sau đó về lại khách sạn nghỉ ngơi.
 
<br/>Chiều: Xe và hướng dẫn đưa Quý khách tới Ga cáp treo Fansipan để bắt đầu cuộc hành trình chinh phục Fansipan bằng hệ thống cáp treo 3 dây hiện đại nhất thế giới với cabin có sức chứa tới 30 du khách. Sau đó tiếp tục chinh phục 600 bậc đá lên đỉnh Fansipan trên độ cao 3.143m - nóc nhà của Đông Dương.
<br/>Lưu ý: Hiện tại Quý khách cũng có thể có những phương án khác để lên đỉnh Fansipan vừa được trải nghiệm cảm giác mới lạ, vừa không phải mất sức đi bộ nhiều đó chính là: 
<br/>Tàu điện Mường Hoa đưa Quý khách từ Sapa đến thẳng Ga cáp treo Fansipan (phí tự túc)
<br/>Tàu hỏa leo núi đưa Quý khách từ Ga trên của cáp treo Fansipan lên đỉnh Fansipan (phí tự túc)
<br/>18h00: Ăn tối. Buổi tối tự do vui chơi. Quý khách có thể đi tắm lá thuốc Dao đỏ để thư giãn sau một ngày thăm quan để thư giãn và hồi phục sức khỏe (phí tự túc). Nghỉ đêm tại Sapa.  

<br/>NGÀY 3 | SAPA – HÀ NỘI        (Ăn sáng, trưa) <br/>
Sáng: Quý khách ăn sáng tại khách sạn và tự do thăm quan mua sắm tại Sapa.
<br/>12h00: Quý khách trả phòng khách sạn và ăn trưa.
<br/>13h00:  Quý khách lên xe khởi hành về Hà Nội.
<br/>19h00: Xe đưa quý khách về tới Hà Nội .Kết thúc chương trình tour, HDV chia tay và hẹn gặp lại quý khách trong những chương trình tour tiếp theo!',N'GIÁ TOUR BAO GỒM:
<br/>Khách sạn 3 sao 2/ phòng. Trường hợp lẻ nam/nữ ngủ phòng đơn, sẽ tính phụ thu phòng đơn
<br/>Ăn chính: 5 bữa x 100.000vnđ. Ăn sáng trong giá phòng
<br/>Xe ô tô du lịch đời mới, máy lạnh đưa đón theo chương trình
<br/>Hướng dẫn viên chuyên nghiệp , nhiệt tình ,phục vụ khách chu đáo
<br/>Vé thăm quan tất cả các điểm có trong chương trình.
<br/>Cáp treo Fanxipang
<br/>Bảo hiểm du lịch mức: 30.000.000VND/người/vụ.    
<br/>GIÁ TOUR KHÔNG BAO GỒM:<br/>
Phụ thu phòng đơn: 800.000vnđ
<br/>Đồ uống gọi thêm trong các bữa ăn. 
<br/>Chi phí cá nhân (giặt là, quà tặng…). 
<br/>Thuế VAT 10%','~/Images/HinhAnhTour/TourMienBac/tourMB9.jpg',10,3,3450000,2990000,'VNĐ',1);
INSERT INTO Tour VALUES(010,1,N'Du lịch Sapa - Bản Cát Cát 2 ngày giá tốt từ Hà Nội',N'Hành trình: HÀ NỘI -  SAPA - CÁT CÁT - HÀM RỒNG - HÀ NỘI<br/>
Lịch trình: 2 ngày 1 đêm<br/>
Khởi hành: Hàng ngày<br/>
Vận chuyển: Xe du lịch đời mới<br/>
Du lịch Sapa. Sapa là điểm du lịch lý tưởng dành cho du khách ưa thích du lịch núi và khám phá về đời sống và phong tục tập quán của người dân tộc bản địa. Đến với tour du lịch Sapa, chắc chắn mỗi người đều có những kỷ niệm khó quên, những giây phút nghỉ ngơi thực sự, hòa mình vào không gian trong trẻo của núi rừng.
Du Lịch SaPa: là một tour du lịch hấp dẫn không thể bỏ qua với mỗi du khách trong và ngoài nước, với nhiều cảnh quan đẹp, cùng với khí hậu mát mẻ quanh năm. Đã tạo nên một SaPa huyền ảo, nhẹ nhàng trong sương sớm với những nét rất riêng biệt mà không đâu có được. Công ty truyền thông Du Lịch Việt luôn tự hào là nhà tổ chức các tour du lịch SaPa cũng như các tour du lịch Miền Bắc khác. Với kinh nghiệm tổ chức tour từ nhiều năm nay, cùng với đội ngũ nhân viên chuyên nghiệp, nhiệt tình chúng tôi xin cam kết sẽ mang lại cho du khách những giây phút thư giãn, thoải mái nhất trong hành trình tour du lịch SaPa 3 ngày 2 đêm từ Hà Nội này.
',N'Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn','6:30','12-04-2019','12-05-2019',N'2 ngày 1 đêm',N'NGÀY 1 | HÀ NỘI – SAPA – HÀM RỒNG      (Ăn trưa, tối) 

06h30- 07h00: Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn. Xe khởi hành đi Lào Cai theo đường cao tốc. Trên đường quý khách sẽ được chiêm ngưỡng cảnh núi đồng quê bát ngát, đồi cọ trập trùng, núi rừng xanh mướt. Phóng tầm mắt ngắm nhìn quang cảnh sông núi và những thửa ruộng bậc thang lưng chừng đồi.
11h30: Đến Sapa quý khách nghỉ ngơi ít phút và ăn trưa. Sau bữa trưa đoàn nhận phòng nghỉ ngơi.
14h30: HDV đưa Quý khách thăm quan khu du lịch Hàm Rồng với khung cảnh hoang sơ, kỳ vĩ; thăm vườn lan Đông Dương với đủ loại, muôn sắc màu; đầu Rồng Thạch Lâm kì vĩ, vượt qua Cổng trời 1, Cổng trời 2, du khách sẽ được đặt chân đến nơi cao nhất của Hàm Rồng đó là sân Mây - nơi giao thoa của đất trời, ngắm toàn cảnh Sapa từ trên cao,…
17h30: Quý khách quay trở lại khách sạn, nghỉ ngơi, ăn tối.
Tối: Quý khách tự do thăm quan thị trấn như Nhà Thờ đá, thưởng thức hương vị đậm đà của các món nướng đậm chất Sapa, ngắm thị trấn Sapa bên hồ về đêm. <br/>  

NGÀY 2 | SAPA – CÁT CÁT – HÀ NỘI   (Ăn sáng, trưa) 

07h00: Quý khách Dùng bữa sáng tại khách sạn. Xe đưa quý khách tới khu du lịch cộng đồng Cát Cát.
8h00: Quý khách đi bộ quanh Bản Cát Cát của người H’mông, một trong những điểm thắng cảnh đẹp và được lòng du khách trong ngoài nước nhất ở đây. Khung cảnh tuyệt đẹp, ruộng nương bậc thang, núi non hùng vĩ, Bản Cát Cát có cả núi non và thác ghềnh. Nổi bật nhất là Thác Cát Cát. Thăm Thác thuỷ điện được người Pháp xây dựng năm 1925. Khu du lịch Cát Cát nằm cách trung tâm Thị trấn Sapa khoảng lưu niệm thổ cẩm. Quý khách thăm quan, chụp ảnh lưu niệm.
 


12h00: Quý khách trả phòng khách sạn. Sau đó ăn trưa tại nhà hàng
Sau bữa trưa , quý khách tự do thăm quan thị trấn Sapa mua sắm đồ lưu niệm
13h00:  Quý khách lên xe khởi hành về Hà Nội.
 

19h00 : Xe đưa quý khách về tới Hà Nội .Kết thúc chương trình tour, HDV chia tay và hẹn gặp lại quý khách trong những chương trình tour tiếp theo. Xin chân thành cảm ơn ! ',N'GIÁ TOUR BAO GỒM:<br/>Xe ô tô giường nằm máy lạnh vận chuyển Hà Nội - Sapa - Hà Nội
Khách sạn tiêu chuẩn 2 sao, 3 sao hoặc 4 sao, ngủ 02 khách/phòng (trường hợp lẻ ghép ngủ 3)
03 bữa chính mức ăn 100.000đ/suất, 01 bữa sáng set menu hoặc buffet tại khách sạn (tùy ngày)
Lưu ý: Dịch vụ 4 sao ăn chính 120.000đ/suất
Hướng dẫn viên nhiệt tình, kinh nghiệm phục vụ theo chương trình
Vé vào cổng khu du lịch Hàm Rồng và Cát Cát<br/>GIÁ TOUR KHÔNG BAO GỒM:<br/>Hóa đơn thuế GTGT
Đồ uống trong các bữa ăn, trong khách sạn và các chi phí cá nhân khác
-Xe ôm hoặc taxi đưa đi đón về bản Cát Cát nếu khách không đi bộ được
Phụ thu ngủ riêng 01 người/phòng/01 đêm:
- Khách sạn 2 sao: 250.000đ
- Khách sạn 3 sao: 300.000đ
- Khách sạn 4 sa0: 450.000đ
Bảo hiểm tai nạn du lịch (do tính chất tour là tour hàng ngày)
Tiền típ cho lái và hướng dẫn viên<br/> GIÁ TRẺ EM:<br/>Trẻ em từ 1-4 tuổi miễn phí (bố mẹ tự lo mọi chi phí cho trẻ, không chiếm chỗ trên xe)
Trẻ em từ 5-9 tuổi tính 75% giá tour (ăn suất riêng, ngủ chung với bố mẹ)
Từ 10 tuổi trở lên tính như người lớn','~/Images/HinhAnhTour/TourMienBac/tourMB10.jpg',25,5,130000,1000000,'VNĐ',1);

--MIỀN TRUNG
INSERT INTO Tour VALUES(011,2,N'Tour du lịch Miền Trung - Đà Nẵng - Hội An',N'Hành trình: Đà Nẵng - Hội An - Vinpearl Nam Hội An - Bán đảo Sơn Trà - Mỹ Khê - KDL Bà Nà - Đà Nẵng - Ngũ Hành Sơn 
<br/><b>Số ngày:</b> 4 ngày 3 đêm
<br/><b>Khởi hành:</b> 31/8/2019
<br/><b>Vận chuyển:</b> Vé máy bay khứ hồi và xe du lịch đời mới
<br/>Tour du lịch Đà Nẵng 4 ngày 3 đêm đưa du khách đến với một thành phố thuộc vùng Nam Trung Bộ, Việt Nam. Đây là trung tâm kinh tế, văn hoá, giáo dục, khoa học và công nghệ lớn của khu vực miền Trung - Tây Nguyên. Đà Nẵng hiện là một trong 13 đô thị loại 1 đồng thời là một trong 5 thành phố trực thuộc Trung ương ở Việt Nam. Nguồn gốc từ "Đà Nẵng" là biến dạng của từ Chăm cổ "DAKNAN", nghĩa là vùng nước rộng lớn hay "sông lớn", "cửa sông cái". Năm 1835, với chỉ dụ của vua Minh Mạng, Cửa Hàn (tên gọi Đà Nẵng khi đó) trở thành thương cảng lớn nhất Miền Trung.

<br/>Du lịch Đà Nẵng - Hội An 4 ngày 3 từ Hà Nội đêm đưa du khách đến với một thành phố thuộc vùng Nam Trung Bộ, Việt Nam. Đây là trung tâm kinh tế, văn hoá, giáo dục, khoa học và công nghệ lớn của khu vực miền Trung - Tây Nguyên. Đà Nẵng hiện là một trong 13 đô thị loại 1 đồng thời là một trong 5 thành phố trực thuộc Trung ương ở Việt Nam. Nguồn gốc từ "Đà Nẵng" là biến dạng của từ Chăm cổ "DAKNAN", nghĩa là vùng nước rộng lớn hay "sông lớn", "cửa sông cái". Năm 1835, với chỉ dụ của vua Minh Mạng, Cửa Hàn (tên gọi Đà Nẵng khi đó) trở thành thương cảng lớn nhất Miền Trung. 
<br/>Du lịch Bà Nà cái tên đã không còn trở nên xa lạ với hầu hết mọi người. Với những yêu yêu thích du lịch thì đây là một điểm tới cực kỳ hấp dẫn bởi cái vẻ huyền ảo, mênh mang và tĩnh lặng của nó.Bạn sẽ cảm giác như lạc vào cõi tiên bồng lai cảnh trước sự mờ ảo huyền bí của đất trời.
<br/>Bãi biển Mỹ Khê nằm trong dải các bãi biển được tạp chí Forbes bình chọn là bãi biển đẹp nhất hành tinh. Bãi tắm có chiều dài khoảng chừng 900m, là một trong số các bãi tắm nhộn nhịp nhất của Đà Nẵng. Với  vị trí thuận lợi ở gần trung tâm thành phố, không gian rộng, phong cảnh đẹp với đầy đủ dịch vụ có chất lượng: khách sạn, nhà hàng, giữ xe, tắm nước ngọt, cho thuê dù, phao bơi.
<br/>Bán đảo Sơn Trà thuộc địa phận quận Sơn Trà, thành phố Du Lịch Đà Nẵng , cách trung tâm thành phố 13km. Bán đảo Sơn Trà có các bãi biển đẹp gần như còn nguyên sơ, nước trong xanh, cát trắng mịn, sạch và rừng nguyên sinh với hệ động thực vật phong phú.
<br/>Du lịch  Hội An Nổi bật trong cung đường du lịch miền Trung, phố cổ Hội An như một bức tranh mộc mạc, giản dị và nên thơ. Dù là ngày hay đêm, du lịch Hội An vẫn mang trong mình những vẻ đẹp lôi cuốn khác nhau.
<br/>Ngoài những giá trị văn hoá qua kiến trúc đa dạng, Hội An còn lưu giữ một nền tảng văn hoá phi vật thể khá đồ sộ. Cuộc sống thường nhật của cư dân với những phong tục tập quán, sinh hoạt tín ngưỡng, nghệ thuật dân gian, lễ hội văn hoá cùng với cảnh quan thiên nhiên thơ mộng, các món ăn đặc sản… làm cho Hội An ngày càng hấp dẫn du khách thập phương.'
,N'Xe và hướng dẫn viên (HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành đi sân bay Nội Bài.','09:00','11-12-2019','11-14-2019',N'4 ngày 3 đêm',
N'NGÀY 1 | HÀ NỘI – ĐÀ NẴNG - HỘI AN (Ăn trưa, tối)<br/>
<br/>Sáng: Xe và hướng dẫn viên (HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành đi sân bay Nội Bài. HDV giúp quý khách làm thủ tục đáp chuyến bay VJ517 lúc 10h45 đi Đà Nẵng . 
<br/>Đến Đà Nẵng HDV đưa quý khách đi ăn trưa tại nhà hàng. Sau đó khởi hành về phố cổ Hội An, nhận phòng khách sạn nghỉ ngơi.
<br/>Chiều: Quý khách bách bộ tham quan và mua sắm Phố Cổ với: Chùa Cầu Nhật Bản, Bảo tàng văn hóa Sa Huỳnh, Nhà Cổ hàng trăm năm tuổi, Hội Quán Phước Kiến & Xưởng thủ công mỹ nghệ.
<br/>18h00: Quý khách ăn tối tại nhà hàng, thưởng thức Đặc sản Hội An (Cao Lầu - Bánh Bao - Bánh Vạc - Hoành Thánh). Tự do khám phá phố cổ về đêm, thương thức không gian đặc sắc rất riêng của Hội An mỗi thứ bảy hàng tuần. Nghỉ đêm tại Hội An.
<br/>NGÀY 2 | VINPEARL NAM HỘI AN- BÁN ĐẢO SƠN TRÀ – MỸ KHÊ  (Ăn sáng, trưa, tối)<br/>
<br/>Sáng: Quý khách dùng điểm tâm tại khách sạn. 
<br/>9h00: Xe đưa đoàn đi tham quan Khu vui chơi giải trí mới “ đỉnh nhất ” miền Trung dịp hè Vinpearl Land Nam Hội An (chi phí tự túc): lần đầu tiên tại Việt Nam quý khách có thể tham quan chiêm ngưỡng động vật quý hiếm 2 bên bờ sông từ trên thuyền, trải nghiệm “Cú rơi thế kỷ” từ độ cao 80m, khám phá Đảo dân gian với các làng nghề truyền thống, tìm hiểu nông nghiệp công nghệ cao, tự do 
trải nghiệm các khu vui chơi, màn trình diễn nhạc nước….
<br/>Đây là điểm tham quan không thể bỏ lỡ trong mùa hè. Quý khách về Hội An trả phòng khách sạn, ăn trưa.
<br/>Xe đưa quý khách dọc theo đường biển Bán đảo Sơn Trà để chiêm ngưỡng một trong những bãi biển đẹp hàng đầu hành tinh, viếng Linh Ứng Tự - nơi có tượng Phật Bà 67m cao nhất Việt Nam
<br/>Về đến Đà Nẵng, Quý khách nhận phòng khách sạn nghỉ ngơi.
<br/>Chiều: Tự do tắm biển Mỹ Khê (Được tạp chí Forbes bình chọn là 1 trong những bãi biển quyến rũ nhất Hành Tinh).  
<br/>18h00: Quý khách dùng cơm tối tại nhà hàng. Buổi tối quý khách tự do thăm quan, khám phá thành phố biển xinh đẹp. Chiêm ngưỡng cầu quay sông Hàn, cầu Rồng phun lửa. Nghỉ đêm tại Đà Nẵng.
<br/>NGÀY 3 | ĐÀ NẴNG - KHU DU LỊCH BÀ NÀ  (Ăn sáng, tối )<br/>
<br/>Sáng : Quý khách dùng điểm tâm tại khách sạn, tự do tắm biển
<br/>Đoàn khởi hành thăm quan khu du lịch Bà Nà - Núi Chúa,  nơi mà quý khách khám phá những khoảnh khắc giao mùa bất ngờ Xuân - Hạ - Thu - Đông trong 1 ngày. Ngồi cáp treo dài nhất thế giới (gần 6.000m), tham quan Đồi Vọng Nguyệt, chùa Linh Ứng, Thích Ca Phật Đài, Vườn Hoa Hầm Rượu. Tiếp tục ngồi cáp treo đến đỉnh Nghinh Phong, biệt thự Lệ Nim, Lầu Vọng Nguyệt, và chinh phục Đỉnh núi Chúa ở độ cao 1.487m so với mực nước biển để thưởng thức quang cảnh núi rừng Bà Nà và toàn cảnh Đà Nẵng và Quảng Nam trên cao. Tiếp tục tham gia các trò chơi phiêu lưu mới lạ, ngộ nghĩnh, hấp dẫn, hiện đại như Vòng quay tình yêu, Phi công Skiver, Đường đua lửa, Xe điện đụng Ngôi nhà ma… (Chi phí tự túc)
<br/>12h00: Đoàn tự túc ăn trưa tại Bà Nà  Chiều: Đoàn khởi hành trở lại Đà Nẵng 
<br/>18h00: Ăn tối tại nhà hàng, ngắm cảnh thành phố bên sông lung linh dưới ánh đèn. Sau bữa tối, quý khách tự do khám phá thành phố Đà Nẵng về đêm.Nghỉ đêm tại Đà Nẵng.
<br/>NGÀY 4 | ĐÀ NẴNG - NGŨ HÀNH SƠN – HÀ NỘI (Ăn sáng, trưa)<br/>
<br/>Sáng : Quý khách dùng điểm tâm tại khách sạn, tự do tắm biển
<br/>11h30: Quý khách trả phòng khách sạn và qua nhà hàng dùng cơm trưa.
<br/>Chiều: Xe đưa Quý khách đến với “ Nam Thiêng Danh Thắng” Ngũ Hành sơn, đoàn dừng chân tham quan làng đá mỹ lệ với những siêu sản phẩm được chính người dân nơi đây tạo ra bằng phương pháp thủ công. Xe tiếp tục đưa quý khách đi đến chợ Hàn mua sắm đặc sản Đà Nẵng  
<br/>17h00: Xe và HDV đưa đoàn ra Sân bay làm thủ tục bay về Hà Nội chuyến bay VJ508 lúc 20h30 về Nội Bài 
<br/>Về đến sân bay Nội Bài xe đón quý khách trở lại điểm đón ban đầu. Chia tay quý khách và hẹn gặp lại trong những chuyến đi sau.',
N'GIÁ BAO GỒM <br/>
<br/>Vé máy bay Vietjet khứ hồi Hà Nội -  Đà Nẵng (hành lý xách tay 7kg+ 20kg hành lý ký gửi)
<br/>Khách sạn 3* Golden star, Luxury,  Hoàng Sa… hoặc tương đương (2-3 khách/phòng, trường hợp lẻ nam, nữ nghỉ phòng đơn, tính phụ thu phòng đơn)
<br/>Bữa ăn theo lịch trình: Ăn sang tại khách sạn và 06 bữa x 120.000VNĐ/bữa chính.
<br/>Đón tiên sân bay HN - Nội Bài - HN
<br/>Vé thắng cảnh thăm quan theo chương trình ( mỗi điểm 01 lần).
<br/>Bảo hiểm du lịch 30.000.000vnd/trường hợp.
<br/>HDV tiếng Việt nhiệt tình, kinh nghiệm. 
<br/>Quà tặng: Mũ Du Lịch Việt
<br/>GIÁ KHÔNG BAO GỒM <br/>
<br/>Phụ thu phòng đơn: 950.000vnđ
<br/>Thuế VAT 10%
<br/>Vé cáp treo Bà Nà 750.000 vnd/vé. Vé vào Vinpearl Nam Hội An
<br/>Chi phí bãi biển ngoài chương trình, phí giặt là.','~/Images/HinhAnhTour/TourMienTrung/tourMT1.jpg',15,7,5490000,4950000,'VNĐ',1);
INSERT INTO Tour VALUES(012,2,N'Du lịch Miền Trung - Đà Nẵng - Sơn Trà - Bà Nà - Hội An dịp Hè ',N'Hành trình: Đà Nẵng - Hội An - Vinpearl Nam Hội An - Bán đảo Sơn Trà - Mỹ Khê - KDL Bà Nà - Đà Nẵng - Ngũ Hành Sơn 
<br/><b>Số ngày:</b> 4 ngày 3 đêm
<br/><b>Khởi hành:</b> 31/8/2019
<br/><b>Vận chuyển:</b> Vé máy bay khứ hồi và xe du lịch đời mới
<br/>Tour du lịch Đà Nẵng 4 ngày 3 đêm đưa du khách đến với một thành phố thuộc vùng Nam Trung Bộ, Việt Nam. Đây là trung tâm kinh tế, văn hoá, giáo dục, khoa học và công nghệ lớn của khu vực miền Trung - Tây Nguyên. Đà Nẵng hiện là một trong 13 đô thị loại 1 đồng thời là một trong 5 thành phố trực thuộc Trung ương ở Việt Nam. Nguồn gốc từ "Đà Nẵng" là biến dạng của từ Chăm cổ "DAKNAN", nghĩa là vùng nước rộng lớn hay "sông lớn", "cửa sông cái". Năm 1835, với chỉ dụ của vua Minh Mạng, Cửa Hàn (tên gọi Đà Nẵng khi đó) trở thành thương cảng lớn nhất Miền Trung.

<br/>Du lịch Đà Nẵng - Hội An 4 ngày 3 từ Hà Nội đêm đưa du khách đến với một thành phố thuộc vùng Nam Trung Bộ, Việt Nam. Đây là trung tâm kinh tế, văn hoá, giáo dục, khoa học và công nghệ lớn của khu vực miền Trung - Tây Nguyên. Đà Nẵng hiện là một trong 13 đô thị loại 1 đồng thời là một trong 5 thành phố trực thuộc Trung ương ở Việt Nam. Nguồn gốc từ "Đà Nẵng" là biến dạng của từ Chăm cổ "DAKNAN", nghĩa là vùng nước rộng lớn hay "sông lớn", "cửa sông cái". Năm 1835, với chỉ dụ của vua Minh Mạng, Cửa Hàn (tên gọi Đà Nẵng khi đó) trở thành thương cảng lớn nhất Miền Trung. 
<br/>Du lịch Bà Nà cái tên đã không còn trở nên xa lạ với hầu hết mọi người. Với những yêu yêu thích du lịch thì đây là một điểm tới cực kỳ hấp dẫn bởi cái vẻ huyền ảo, mênh mang và tĩnh lặng của nó.Bạn sẽ cảm giác như lạc vào cõi tiên bồng lai cảnh trước sự mờ ảo huyền bí của đất trời.
<br/>Bãi biển Mỹ Khê nằm trong dải các bãi biển được tạp chí Forbes bình chọn là bãi biển đẹp nhất hành tinh. Bãi tắm có chiều dài khoảng chừng 900m, là một trong số các bãi tắm nhộn nhịp nhất của Đà Nẵng. Với  vị trí thuận lợi ở gần trung tâm thành phố, không gian rộng, phong cảnh đẹp với đầy đủ dịch vụ có chất lượng: khách sạn, nhà hàng, giữ xe, tắm nước ngọt, cho thuê dù, phao bơi.
<br/>Bán đảo Sơn Trà thuộc địa phận quận Sơn Trà, thành phố Du Lịch Đà Nẵng , cách trung tâm thành phố 13km. Bán đảo Sơn Trà có các bãi biển đẹp gần như còn nguyên sơ, nước trong xanh, cát trắng mịn, sạch và rừng nguyên sinh với hệ động thực vật phong phú.
<br/>Du lịch  Hội An Nổi bật trong cung đường du lịch miền Trung, phố cổ Hội An như một bức tranh mộc mạc, giản dị và nên thơ. Dù là ngày hay đêm, du lịch Hội An vẫn mang trong mình những vẻ đẹp lôi cuốn khác nhau.
<br/>Ngoài những giá trị văn hoá qua kiến trúc đa dạng, Hội An còn lưu giữ một nền tảng văn hoá phi vật thể khá đồ sộ. Cuộc sống thường nhật của cư dân với những phong tục tập quán, sinh hoạt tín ngưỡng, nghệ thuật dân gian, lễ hội văn hoá cùng với cảnh quan thiên nhiên thơ mộng, các món ăn đặc sản… làm cho Hội An ngày càng hấp dẫn du khách thập phương.'
,N'Xe và hướng dẫn viên (HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành đi sân bay Nội Bài.',
'09:00','09-28-2019','10-01-2019',N'4 ngày 3 đêm',N'<b>NGÀY 1 | HÀ NỘI – ĐÀ NẴNG - HỘI AN (Ăn trưa, tối)</b><br>
<br>Sáng: Xe và hướng dẫn viên (HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành đi sân bay Nội Bài. HDV giúp quý khách làm thủ tục đáp chuyến bay VJ517 lúc 10h45 đi Đà Nẵng . 
<br>Đến Đà Nẵng HDV đưa quý khách đi ăn trưa tại nhà hàng. Sau đó khởi hành về phố cổ Hội An, nhận phòng khách sạn nghỉ ngơi.
<br>Chiều: Quý khách bách bộ tham quan và mua sắm Phố Cổ với: Chùa Cầu Nhật Bản, Bảo tàng văn hóa Sa Huỳnh, Nhà Cổ hàng trăm năm tuổi, Hội Quán Phước Kiến & Xưởng thủ công mỹ nghệ.
<br>18h00: Quý khách ăn tối tại nhà hàng, thưởng thức Đặc sản Hội An (Cao Lầu - Bánh Bao - Bánh Vạc - Hoành Thánh). Tự do khám phá phố cổ về đêm, thương thức không gian đặc sắc rất riêng của Hội An mỗi thứ bảy hàng tuần. Nghỉ đêm tại Hội An.
<br/><b>NGÀY 2 | VINPEARL NAM HỘI AN- BÁN ĐẢO SƠN TRÀ – MỸ KHÊ  (Ăn sáng, trưa, tối)</b>
<br/>Sáng: Quý khách dùng điểm tâm tại khách sạn. 
<br/>9h00: Xe đưa đoàn đi tham quan Khu vui chơi giải trí mới “ đỉnh nhất ” miền Trung dịp hè Vinpearl Land Nam Hội An (chi phí tự túc): lần đầu tiên tại Việt Nam quý khách có thể tham quan chiêm ngưỡng động vật quý hiếm 2 bên bờ sông từ trên thuyền, trải nghiệm “Cú rơi thế kỷ” từ độ cao 80m, khám phá Đảo dân gian với các làng nghề truyền thống, tìm hiểu nông nghiệp công nghệ cao, tự do 
trải nghiệm các khu vui chơi, màn trình diễn nhạc nước….
<br/>
Đây là điểm tham quan không thể bỏ lỡ trong mùa hè. Quý khách về Hội An trả phòng khách sạn, ăn trưa.
<br/>Xe đưa quý khách dọc theo đường biển Bán đảo Sơn Trà để chiêm ngưỡng một trong những bãi biển đẹp hàng đầu hành tinh, viếng Linh Ứng Tự - nơi có tượng Phật Bà 67m cao nhất Việt Nam
<br/>Về đến Đà Nẵng, Quý khách nhận phòng khách sạn nghỉ ngơi.
<br/>Chiều: Tự do tắm biển Mỹ Khê (Được tạp chí Forbes bình chọn là 1 trong những bãi biển quyến rũ nhất Hành Tinh).  
<br/>18h00: Quý khách dùng cơm tối tại nhà hàng. Buổi tối quý khách tự do thăm quan, khám phá thành phố biển xinh đẹp. Chiêm ngưỡng cầu quay sông Hàn, cầu Rồng phun lửa. Nghỉ đêm tại Đà Nẵng.
<br/><b>NGÀY 3 | ĐÀ NẴNG - KHU DU LỊCH BÀ NÀ  (Ăn sáng, tối )</b>
<br/>Sáng : Quý khách dùng điểm tâm tại khách sạn, tự do tắm biển
<br/>Đoàn khởi hành thăm quan khu du lịch Bà Nà - Núi Chúa,  nơi mà quý khách khám phá những khoảnh khắc giao mùa bất ngờ Xuân - Hạ - Thu - Đông trong 1 ngày. Ngồi cáp treo dài nhất thế giới (gần 6.000m), tham quan Đồi Vọng Nguyệt, chùa Linh Ứng, Thích Ca Phật Đài, Vườn Hoa Hầm Rượu. Tiếp tục ngồi cáp treo đến đỉnh Nghinh Phong, biệt thự Lệ Nim, Lầu Vọng Nguyệt, và chinh phục Đỉnh núi Chúa ở độ cao 1.487m so với mực nước biển để thưởng thức quang cảnh núi rừng Bà Nà và toàn cảnh Đà Nẵng và Quảng Nam trên cao. Tiếp tục tham gia các trò chơi phiêu lưu mới lạ, ngộ nghĩnh, hấp dẫn, hiện đại như Vòng quay tình yêu, Phi công Skiver, Đường đua lửa, Xe điện đụng Ngôi nhà ma… (Chi phí tự túc)
<br/>12h00: Đoàn tự túc ăn trưa tại Bà Nà  Chiều: Đoàn khởi hành trở lại Đà Nẵng 
<br/>18h00: Ăn tối tại nhà hàng, ngắm cảnh thành phố bên sông lung linh dưới ánh đèn. Sau bữa tối, quý khách tự do khám phá thành phố Đà Nẵng về đêm.Nghỉ đêm tại Đà Nẵng.
<br/><b>NGÀY 4 | ĐÀ NẴNG - NGŨ HÀNH SƠN – HÀ NỘI (Ăn sáng, trưa)</b>
<br>Sáng : Quý khách dùng điểm tâm tại khách sạn, tự do tắm biển
<br>11h30: Quý khách trả phòng khách sạn và qua nhà hàng dùng cơm trưa.
<br>Chiều: Xe đưa Quý khách đến với “ Nam Thiêng Danh Thắng” Ngũ Hành sơn, đoàn dừng chân tham quan làng đá mỹ lệ với những siêu sản phẩm được chính người dân nơi đây tạo ra bằng phương pháp thủ công. Xe tiếp tục đưa quý khách đi đến chợ Hàn mua sắm đặc sản Đà Nẵng  
<br>17h00: Xe và HDV đưa đoàn ra Sân bay làm thủ tục bay về Hà Nội chuyến bay VJ508 lúc 20h30 về Nội Bài 
<br>Về đến sân bay Nội Bài xe đón quý khách trở lại điểm đón ban đầu. Chia tay quý khách và hẹn gặp lại trong những chuyến đi sau.',
N'<b>GIÁ BAO GỒM </b><br>
<br>Vé máy bay Vietjet khứ hồi Hà Nội -  Đà Nẵng (hành lý xách tay 7kg+ 20kg hành lý ký gửi)
<br>Khách sạn 3* Golden star, Luxury,  Hoàng Sa… hoặc tương đương (2-3 khách/phòng, trường hợp lẻ nam, nữ nghỉ phòng đơn, tính phụ thu phòng đơn)
<br>Bữa ăn theo lịch trình: Ăn sang tại khách sạn và 06 bữa x 120.000VNĐ/bữa chính.
<br>Đón tiên sân bay HN - Nội Bài - HN
<br>Vé thắng cảnh thăm quan theo chương trình ( mỗi điểm 01 lần).
<br>Bảo hiểm du lịch 30.000.000vnd/trường hợp.
<br>HDV tiếng Việt nhiệt tình, kinh nghiệm. 
Quà tặng: Mũ Du Lịch Việt<br>
<br><b>GIÁ KHÔNG BAO GỒM </b><br>
<br>Phụ thu phòng đơn: 950.000vnđ
<br>Thuế VAT 10%
<br>Vé cáp treo Bà Nà 750.000 vnd/vé. Vé vào Vinpearl Nam Hội An
<br>Chi phí bãi biển ngoài chương trình, phí giặt là.','~/Images/HinhAnhTour/TourMienTrung/tourMT2.jpg',30,70,4990000,4490000,'VNĐ',1);
INSERT INTO Tour VALUES(013,2,N'Du lịch Nha Trang - Đà Lạt dịp lễ 2/9 ',N'<b>Hành trình: HÀ NỘI - NHA TRANG - ĐÀ LẠT - HÀ NỘI</b><br/>
<b>Số ngày:</b> 5 ngày 4 đêm<br/>
<b>Khởi hành:</b> 31/8/2019<br/>
<b>Vận chuyển:<b> Vé máy bay khứ hồi và xe du lịch đời mới<br/>
Du lịch Nha Trang - Đà Lạt. Nha Trang - Đà Lạt không ngoa khi nói về hai thiên đường nghỉ dưỡng của du lịch Việt Nam. Nha Trang – Thiên đường du lịch biển với khí hậu ôn hòa. Mùa đông ở Nha Trang ít lạnh, mùa hè thường kéo dài nhưng nắng nóng không quá gay gắt. Thêm vào đó, thành phố biển Nha Trang lại nằm trong vùng ít chịu ảnh hưởng của gió bão. Chính vì thế mà du lịch Nha Trang quanh năm luôn sẵn sàng chào đón du khách ghé thăm. Đà Lạt mộng mơ với một ngày có bốn mùa khiến bao du khách trầm trồ khi tận hưởng không khí nơi đây, khách đến Đà Lạt mà chẳng muốn về.',N'Xe và Hướng dẫn viên ( HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài','08:00','08-31-2019','09-04-2019',N'5 ngày 4 đêm',N'<b>NGÀY 1 | HÀ NỘI - NHA TRANG      (Ăn trưa)</b><br/>
<br/><b>Sáng:</b> Xe và Hướng dẫn viên ( HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài, HDV làm thủ tục giúp quý khách đáp chuyến bay VJ781 lúc 9h45 đến Nha Trang.
 
<br/>11h35 Đến sân bay Cam Ranh HDV và xe ô tô đưa quý khách tới ăn trưa tại nhà hàng, sau đó về khách sạn nhận phòng nghỉ ngơi.
<br/><b><Chiều:</b> Quý khách có thể tự do chọn một trong hai lựa chọn sau: 
<br/>Lựa chọn 1: Quý khách khởi hành tham quan Vinpearl (chi phí tự túc).
<br/>- Trò chơi ngoài trời: đu quay cảm giác mạnh, đu quay dây văng, đu quay thú nhún, đu quay con voi, tàu lượn siêu tốc, đu quay vòng xoay, xe đạp bay, tàu hải tặc, thành phố vui nhộn, thú nhún, xiếc thú (3 xuất/ngày).
<br/>- Trò chơi trong nhà: phim bốn chiều, xe đụng, vườn cổ tích, thiên đường trẻ em, siêu thị game, phòng karaoke…
<br/>- Khu thuỷ cung Vinpearland với diện tích trên 3,400m2, là đại dương thu nhỏ với hơn 300 loài cá đẹp, quý hiếm và lạ mắt.
<br/>- Khu công viên nước với các trò chơi cảm giác mạnh: khu trò chơi mạo hiểm, khu trò chơi dành cho trẻ em, hồ tạo sóng, dòng sông lười, khu trò chơi gia đình mạo hiểm… 
<br/><b>Lựa chọn 2:</b> Galina Lake view- KDL Tàu Ngầm
<br/>Xe và hướng dẫn viên đưa quý khách di tham quan Galina Lak View - với phong cảnh xanh mát, núi rừng hoang sơ, gần gũi thiên nhiên, quý khách có thể tham gia teambuiding, picnic câu cá, thưởng thức tiệc nướng ngoài trời, hay bơi thuyền thiên nga thưởng lãm phong cảnh hoặc với hành trình chinh phục đỉnh núi và tìm "Mật khu Đá Hang"...tại Hồ Kênh Hạ. Đoàn tiếp tục khởi hành tới KDL Tàu Ngầm - cha đẻ của dự án này cũng là cha đẻ của dự án Đường hầm Đất sét Đà Lạt. Tái hiện 1 Nha Trang xưa qua những nét vẽ đặc sắc độc đáo được ghi trên Đá và Điểm độc đáo bên trong chiếc tàu ngầm đó chính là một bar rượu. Sau đó xe đưa quý khách về lại thành phố Nha Trang  
<br/>Tối Quý khách TỰ TÚC ĂN TỐI.Tự do dạo phố biển. Nghỉ đêm tại Nha Trang.<br/>
<br/><b>NGÀY 2 | DU NGOẠI VỊNH NHA TRANG (Ăn sáng,trưa,tối)</b><br>
<br/>Sáng:  Quý khách dùng điềm tâm sáng  
<br/>08h30 – 9h00: Xe và HDV  Đón khách tại khách sạn
<br/>09h15: Tàu khởi hành chuyến du ngoạn VỊNH NHA TRANG  – một trong 29 vịnh biển nhất Thế Giới được   công nhận vào tháng 7/2003.
<br/>9h30: Đến Hòn Miễu. Tham quan Thủy cung Trí Nguyên – một công trình kiến trúc độc đáo được thiết kế tựa hình chiếc tàu buồm cổ bám đầy rong rêu với rất nhiều loài sinh vật biển quý hiếm ( Tự túc) 
<br/>10h45 – 11h30: Đến Hòn Một (Đảo San Hô) - Quý khách tự do tắm biển hoặc tham gia:                        
<br/>Bơi, lặn ngắm san hô bằng kính lặn trên tàu hoặc xem san hô bằng Tàu đáy kính. ( chi phí tự túc)                  
<br/>Quý khách tham gia Chơi các trò chơi cảm giác mạnh trên biển như: bay dù, môtô nước, lặn biển bằng bình hơi hoặc đi bộ dưới nước có thợ lặn kèm theo để khám phá vẻ đẹp đầy màu sắc hoăc chụp cho mình những tấm hình lung linh, huyền ảo dưới đáy đại dương . (chi phí tự túc)     

<br/>12h00 : Ghé về Làng Chài trên biển  Quý khách sẽ được tham quan các loại hải sản biển tươi sống được những người ngư dân nuôi trồng trong hệ thống lồng bè như: Tôm hùm, cá bớp (cá giò), cua, ghẹ, mực lá, cá bò hòm... và ăn cơm trưa tập thể  trên tàu với các món ăn dân giã do các tay Đàn, tay Trống phục vụ văn nghệ trổ tài nấu nướng như: Tôm xào chua ngọt, cá chiên sốt cà, Cãi xào tỏi hoặc mì xào lagim) , Ba chỉ rang cháy canh (hoặc thịt kho trứng),  canh bí xanh nấu tôm, Cơm trắng, trái cây.         
<br/>Sau đó tàu di chuyển đến Vũng Ngháng gần vịnh Hòn Tằm nơi đây mặt nước phẵng lặng cho tàu neo đậu để Quý khách tham gia chương trình văn nghệ giải trí “ Cây nhà lá vườn”.Quán rượu nổi!,dự tiệc trái cây để thưởng thức hương vị của nhiều loại trái cây theo mùa hiện có ở Nha Trang. Một  ly rượu, một lát thơm ngay dưới nước, bạn có thể nâng ly và tâm tình với bạn bè.        
 <br/>15h00 – 16h15: Bãi tranh (bao ghế bố Bãi Tranh) 
<br/>Nhận ghế lều nghỉ ngơi, thư giãn và tắm biển
<br/>16h30: Tàu đưa Quý khách cập cảng, về khách sạn nghỉ ngơi. Không bao gồm: Thức uống và các dịch vụ khác tại mỗi đảo: Vé đáy kính. Vé Hồ Cá. Trò chơi thể thao trên nước:( Nhiều loại giá)
<br/>Tối : Quý khách dùng cơm bên người thân trong ánh hoàng hôn nơi phố biển. Tối quý khách tự do dạo phố, ngắm cảnh Nha Trang về đêm hoặc thưởng thức một ly cà phê phố biển hay các món ăn đặc sản biển. Nghỉ đêm tại Nha Trang.
<br/><b>NGÀY 3 | NHA TRANG – ĐÀ LẠT (Ăn sáng, trưa, tối)</b><br/>
<br/>Sáng: Quý khách dùng điểm tâm sáng tại khách sạn, trả phòng và khởi hành đi Đà Lạt. 
<br/>Trưa: Dùng cơm trưa. Nhận phòng khách sạn nghỉ ngơi. 
<br/>Chiều: Tham quan Thiền Viện Trúc Lâm, đi cáp treo qua đồi Rôbin (chi phí tự túc), ngắm cảnh rừng thông, hồ Tuyền Lâm, núi Phượng Hoàng từ trên cao. Đoàn đến tham quan Đường hầm đất sét tái hiện về lịch sử thành phố Đà Lạt từ thủa ban sơ cho tới một Đà Lạt năng động và hiện đại như ngày nay, đạt 2 kỷ lục Việt Nam: ngôi nhà đất đỏ Bazan không nung đầu tiên có phong cách độc đáo nhất và ngôi nhà đất đỏ bazan không nung có mái đắp nổi hình bản đồ Việt Nam đầu tiên và có diện tích lớn nhất. Quý khách nhận phòng nghỉ ngơi.
<br/>Tối: Dùng cơm tối. Quý khách tự túc dạo thành phố Đà Lạt về đêm, ngắm cảnh Hồ Xuân Hương, thưởng thức hương vị cà phê phố núi (chi phí tự túc). Nghỉ đêm khách sạn tại Đà Lạt.
<br/><b>NGÀY 4 | ĐÀ LẠT THÀNH PHỐ MỘNG MƠ (Ăn sáng, trưa, tối)</b><br/>
<br/>Sáng: Quý khách dùng điểm tâm sáng.
<br/>Tham quan nhà thờ Domaine de Marie (còn gọi là Nhà thờ Mai Anh) - sự kết hợp hài hòa giữa các kiểu kiến trúc phương Tây với kiến trúc dân gian của dân tộc thiểu số vùng Tây Nguyên.
<br/>Tham quan Thung lũng Tình Yêu là một trong những thắng cảnh thơ mộng nhất tại Đà Lạt, thung lũng tình yêu chìm sâu bên sườn đồi với những rừng thông quanh năm xanh biếc.
<br/>Trưa: Quý khách thưởng thức bữa trưa tại nhà hàng
<br/>Chiều: Tham quan Vườn Hoa Thành Phố Đà Lạt (  Đây là nơi qui tụ được những loài hoa đẹp và sang trọng nhất trên thế giới).
<br/>Tối: Ăn tối tại nhà hàng. Tự do ngắm cảnh thành phố Đà Lạt về đêm.
<br/>Nghỉ đêm tại khách sạn.
<br/><b>NGÀY 5 | ĐÀ LẠT - HÀ NỘI ( Ăn sáng)</b><br>
<br/>Sáng: quý khách dùng điểm tâm sáng tại khách sạn, trả phòng
<br/>Sau đó xe và HDV Du Lịch Việt đưa quý khách tới sân bay Liên Khương, trở về Hà Nội.<br/> Kết thúc chương trình.Thân ái chào tam biệt.',
N'<b>GIÁ TOUR BAO GỒM </b><br/>
<br/>Vé máy bay Vietjet khứ hồi Hà Nội – Nha Trang – Hà Nội ( hành lý xách tay 7kg)
<br/>Khách sạn 3* tiêu chuẩn 2-3 khách/phòng, trường hợp lẻ nam – nữ nghỉ phòng đơn, sẽ tính phụ thu phòng đơn ( khách sạn Ruby, Venue… hoặc tương đương)
<br/>Bữa ăn theo lịch trình: 05 bữa x 120.000VNĐ/bữa chính. Ăn sáng trong giá phòng. 
<br/>Xe du lịch đời mới, điều hòa, tiện nghi phục vụ suốt tuyến
<br/>Đón tiên sân bay HN – Nội Bài – HN
<br/>Vé thắng cảnh thăm quan theo chương trình ( mỗi điểm 01 lần).
<br/>Bảo hiểm du lịch 30.000.000vnd/trường hợp.
<br/>HDV tiếng Việt nhiệt tình, kinh nghiệm.
<br/>Nước uống trên xe 01 chai/khách/ngày.
<br/>Quà tặng: Mũ Du Lịch Việt
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM</b><br/> 
<br/>Đồ uống gọi thêm trong các bữa ăn. 
<br/>Thuế VAT 10%
<br/>Vé Vinpearland: 800.000vnd
<br/>Chi phí bãi biển ngoài chương trình, phí giặt là.','~/Images/HinhAnhTour/TourMienTrung/tourMT3.jpg',20,10,7790000,7000000,'VNĐ',1);
INSERT INTO Tour VALUES(014,2,N'Tour du lịch Miền Trung - Đà Nẵng - Hội An dịp lễ 2/9 ',N'<b>Hành trình:</b> Đà Nẵng - Hội An - Vinpearl Nam Hội An - Bán đảo Sơn Trà - Mỹ Khê - KDL Bà Nà - Đà Nẵng - Ngũ Hành Sơn <br/>
<br/><b>Số ngày:</b> 4 ngày 3 đêm
<br/><b>Khởi hành:</b> 31/8/2019
<br/><b>Vận chuyển:</b> Vé máy bay khứ hồi và xe du lịch đời mới
<br/>Tour du lịch Đà Nẵng 4 ngày 3 đêm đưa du khách đến với một thành phố thuộc vùng Nam Trung Bộ, Việt Nam. Đây là trung tâm kinh tế, văn hoá, giáo dục, khoa học và công nghệ lớn của khu vực miền Trung - Tây Nguyên. Đà Nẵng hiện là một trong 13 đô thị loại 1 đồng thời là một trong 5 thành phố trực thuộc Trung ương ở Việt Nam. Nguồn gốc từ "Đà Nẵng" là biến dạng của từ Chăm cổ "DAKNAN", nghĩa là vùng nước rộng lớn hay "sông lớn", "cửa sông cái". Năm 1835, với chỉ dụ của vua Minh Mạng, Cửa Hàn (tên gọi Đà Nẵng khi đó) trở thành thương cảng lớn nhất Miền Trung.
<br/>Du lịch Đà Nẵng - Hội An 4 ngày 3 từ Hà Nội đêm đưa du khách đến với một thành phố thuộc vùng Nam Trung Bộ, Việt Nam. Đây là trung tâm kinh tế, văn hoá, giáo dục, khoa học và công nghệ lớn của khu vực miền Trung - Tây Nguyên. Đà Nẵng hiện là một trong 13 đô thị loại 1 đồng thời là một trong 5 thành phố trực thuộc Trung ương ở Việt Nam. Nguồn gốc từ "Đà Nẵng" là biến dạng của từ Chăm cổ "DAKNAN", nghĩa là vùng nước rộng lớn hay "sông lớn", "cửa sông cái". Năm 1835, với chỉ dụ của vua Minh Mạng, Cửa Hàn (tên gọi Đà Nẵng khi đó) trở thành thương cảng lớn nhất Miền Trung. ',
N'e và hướng dẫn viên (HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành đi sân bay Nội Bài.','09:30','08-31-2019','09-03-2019',N'4 ngày 3 đêm',
N'<b>NGÀY 1 | HÀ NỘI – ĐÀ NẴNG - HỘI AN (Ăn trưa, tối)</b><br/>
<br/><b>Sáng:</b> Xe và hướng dẫn viên (HDV) Du Lịch Việt đón quý khách tại điểm hẹn khởi hành đi sân bay Nội Bài. HDV giúp quý khách làm thủ tục đáp chuyến bay VJ517 lúc 10h45 đi Đà Nẵng . 
<br/>Đến Đà Nẵng HDV đưa quý khách đi ăn trưa tại nhà hàng. Sau đó khởi hành về phố cổ Hội An, nhận phòng khách sạn nghỉ ngơi.
<br/><b>Chiều:</b> Quý khách bách bộ tham quan và mua sắm Phố Cổ với: Chùa Cầu Nhật Bản, Bảo tàng văn hóa Sa Huỳnh, Nhà Cổ hàng trăm năm tuổi, Hội Quán Phước Kiến & Xưởng thủ công mỹ nghệ.
<br/>18h00: Quý khách ăn tối tại nhà hàng, thưởng thức Đặc sản Hội An (Cao Lầu - Bánh Bao - Bánh Vạc - Hoành Thánh). Tự do khám phá phố cổ về đêm, thương thức không gian đặc sắc rất riêng của Hội An mỗi thứ bảy hàng tuần. Nghỉ đêm tại Hội An.
<br><br><b>NGÀY 2 | VINPEARL NAM HỘI AN- BÁN ĐẢO SƠN TRÀ – MỸ KHÊ  (Ăn sáng, trưa, tối)</b><br>

<br/><b>Sáng:</b> Quý khách dùng điểm tâm tại khách sạn. 
<br/>9h00: Xe đưa đoàn đi tham quan Khu vui chơi giải trí mới “ đỉnh nhất ” miền Trung dịp hè Vinpearl Land Nam Hội An (chi phí tự túc): lần đầu tiên tại Việt Nam quý khách có thể tham quan chiêm ngưỡng động vật quý hiếm 2 bên bờ sông từ trên thuyền, trải nghiệm “Cú rơi thế kỷ” từ độ cao 80m, khám phá Đảo dân gian với các làng nghề truyền thống, tìm hiểu nông nghiệp công nghệ cao, tự do 
trải nghiệm các khu vui chơi, màn trình diễn nhạc nước….
<br/>Đây là điểm tham quan không thể bỏ lỡ trong mùa hè. Quý khách về Hội An trả phòng khách sạn, ăn trưa.
<br/>Xe đưa quý khách dọc theo đường biển Bán đảo Sơn Trà để chiêm ngưỡng một trong những bãi biển đẹp hàng đầu hành tinh, viếng Linh Ứng Tự - nơi có tượng Phật Bà 67m cao nhất Việt Nam
<br/>Về đến Đà Nẵng, Quý khách nhận phòng khách sạn nghỉ ngơi.
<br/>Chiều: Tự do tắm biển Mỹ Khê (Được tạp chí Forbes bình chọn là 1 trong những bãi biển quyến rũ nhất Hành Tinh).  
<br/>18h00: Quý khách dùng cơm tối tại nhà hàng. Buổi tối quý khách tự do thăm quan, khám phá thành phố biển xinh đẹp. Chiêm ngưỡng cầu quay sông Hàn, cầu Rồng phun lửa. Nghỉ đêm tại Đà Nẵng.
<br/><br/><b>NGÀY 3 | ĐÀ NẴNG - KHU DU LỊCH BÀ NÀ  (Ăn sáng, tối )</b>
<br/>Sáng : Quý khách dùng điểm tâm tại khách sạn, tự do tắm biển
<br/>Đoàn khởi hành thăm quan khu du lịch Bà Nà - Núi Chúa,  nơi mà quý khách khám phá những khoảnh khắc giao mùa bất ngờ Xuân - Hạ - Thu - Đông trong 1 ngày. Ngồi cáp treo dài nhất thế giới (gần 6.000m), tham quan Đồi Vọng Nguyệt, chùa Linh Ứng, Thích Ca Phật Đài, Vườn Hoa Hầm Rượu. Tiếp tục ngồi cáp treo đến đỉnh Nghinh Phong, biệt thự Lệ Nim, Lầu Vọng Nguyệt, và chinh phục Đỉnh núi Chúa ở độ cao 1.487m so với mực nước biển để thưởng thức quang cảnh núi rừng Bà Nà và toàn cảnh Đà Nẵng và Quảng Nam trên cao. Tiếp tục tham gia các trò chơi phiêu lưu mới lạ, ngộ nghĩnh, hấp dẫn, hiện đại như Vòng quay tình yêu, Phi công Skiver, Đường đua lửa, Xe điện đụng Ngôi nhà ma… (Chi phí tự túc)
<br/>12h00: Đoàn tự túc ăn trưa tại Bà Nà  Chiều: Đoàn khởi hành trở lại Đà Nẵng 
<br/>18h00: Ăn tối tại nhà hàng, ngắm cảnh thành phố bên sông lung linh dưới ánh đèn. Sau bữa tối, quý khách tự do khám phá thành phố Đà Nẵng về đêm.Nghỉ đêm tại Đà Nẵng.
khám phá thành phố Đà Nẵng về đêm.Nghỉ đêm tại Đà Nẵng.

<br/><br/><b>NGÀY 4 | ĐÀ NẴNG - NGŨ HÀNH SƠN – HÀ NỘI (Ăn sáng, trưa)</b>
<br/><b>Sáng :</b> Quý khách dùng điểm tâm tại khách sạn, tự do tắm biển
<br/>11h30: Quý khách trả phòng khách sạn và qua nhà hàng dùng cơm trưa.
<br/><b>Chiều:</b> Xe đưa Quý khách đến với “ Nam Thiêng Danh Thắng” Ngũ Hành sơn, đoàn dừng chân tham quan làng đá mỹ lệ với những siêu sản phẩm được chính người dân nơi đây tạo ra bằng phương pháp thủ công. Xe tiếp tục đưa quý khách đi đến chợ Hàn mua sắm đặc sản Đà Nẵng  
<br/>17h00: Xe và HDV đưa đoàn ra Sân bay làm thủ tục bay về Hà Nội chuyến bay VJ508 lúc 20h30 về Nội Bài 
<br/>Về đến sân bay Nội Bài xe đón quý khách trở lại điểm đón ban đầu. Chia tay quý khách và hẹn gặp lại trong những chuyến đi sau.
',N'Dịch vụ bao gồm và không bao gồm
<br/><br/><b>GIÁ BAO GỒM </b><br/>
<br/>Vé máy bay Vietjet khứ hồi Hà Nội -  Đà Nẵng (hành lý xách tay 7kg+ 20kg hành lý ký gửi)
<br/>Khách sạn 3* Golden star, Luxury,  Hoàng Sa… hoặc tương đương (2-3 khách/phòng, trường hợp lẻ nam, nữ nghỉ phòng đơn, tính phụ thu phòng đơn)
<br/>Bữa ăn theo lịch trình: Ăn sang tại khách sạn và 06 bữa x 120.000VNĐ/bữa chính.
<br/>Đón tiên sân bay HN - Nội Bài - HN
<br/>Vé thắng cảnh thăm quan theo chương trình ( mỗi điểm 01 lần).
<br/>Bảo hiểm du lịch 30.000.000vnd/trường hợp.
<br/>HDV tiếng Việt nhiệt tình, kinh nghiệm. 
<br/>Quà tặng: Mũ Du Lịch Việt
<br/><br/><b>GIÁ KHÔNG BAO GỒM </b><br/>
<br/>Phụ thu phòng đơn: 950.000vnđ
<br/>Thuế VAT 10%
<br/>Vé cáp treo Bà Nà 750.000 vnd/vé. Vé vào Vinpearl Nam Hội An
<br/>Chi phí bãi biển ngoài chương trình, phí giặt là.
 ','~/Images/HinhAnhTour/TourMienTrung/tourMT4.jpg',25,10,5490000,4990000,'VNĐ',1);
 /*
INSERT INTO Tour VALUES(015,2,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourMienTrung/tourMT5.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(016,2,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourMienTrung/tourMT6.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(017,2,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourMienTrung/tourMT7.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(018,2,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourMienTrung/tourMT8.jpg',25,10,130000,1000000,'VNĐ',1);
*/
--MIỂN NAM
INSERT INTO Tour VALUES(019,3,N'Du lịch Phú Quốc dịp lễ Quốc khánh 2/9 từ Hà Nội',N'<b>Hành trình:</b> Hà Nội - Vinperland - Nam Đảo - Đông Đảo - Hà Nội<br>
<b>Số ngày:</b> 4 ngày 3 đêm
<br/><b>Khởi hành:</b> 31/8/2019
<br/><b>Vận chuyển:</b> Vé máy bay khứ hồi và xe du lịch đời mới
<br/>Du lịch Phú Quốc khởi hành từ Hà Nội - Mùa hè này, bạn đã có dự định gì cho bản thân, hay gia đình chưa? Bạn đang tìm một nơi có biển xanh, cát trắng, khí hậu hiền hòa mà vẫn chưa quyết định nên đi du lịch ở đâu? Hãy để chúng tôi đưa ra một vài gợi ý nhỏ cho bạn. Bạn nghĩ sao nếu hè 2019 này, bạn cùng bạn bè hay người thân đến Bãi Sao- một bờ biển tuyệt đẹp thuộc đảo Phú Quốc với làn nước trong xanh, chất lượng cát và màu sắc của nó tuyệt vời, mặt nước an toàn đối với tất cả mọi lứa tuổi và không quá phát triển nên vẫn giữ vẻ hoang sơ vốn có của nó.
<br/><b>BÃI SAO - PHÚ QUỐC CHÀO HÈ<b><br>
<br>Mùa hè này, bạn đã có dự định gì cho bản thân, hay gia đình chưa? Bạn đang tìm một nơi có biển xanh, cát trắng, khí hậu hiền hòa mà vẫn chưa quyết định nên đi du lịch ở đâu? Hãy để chúng tôi đưa ra một vài gợi ý nhỏ cho bạn. Bạn nghĩ sao nếu hè 2017 này, bạn cùng bạn bè hay người thân đến du lịch Bãi Sao Phú Quốc - một bờ biển tuyệt đẹp thuộc đảo Phú Quốc với làn nước trong xanh, chất lượng cát và màu sắc của nó tuyệt vời, mặt nước an toàn đối với tất cả mọi lứa tuổi và không quá phát triển nên vẫn giữ vẻ hoang sơ vốn có của nó. 
<br>Bãi Sao là một trong những bãi biển đẹp nhất không chỉ được xếp hạng cao ở Việt Nam mà còn trong khu vực. Bãi Sao nằm ở phía đông nam của đảo Phú Quốc thuộc thị trấn An Thới, với bờ biển có cát trắng trải dài 7km. Cát ở đây rất trắng và sáng khiến người ta liên tưởng đến bờ biển Caribbean. Cát ở gần nhà hàng Paradiso là nơi trắng nhất và sạch nhất. Xa xa về phía nam, cát ngày một thô hơn và có màu vàng nhạt. và ở phía này cũng tập trung nhiều rác thải hơn. Màu của biển cũng là điểm nhấn vô cùng tuyệt diệu của Bãi Sao. Biển có màu ngọc lam, các vùng nước xung quanh bãi biển khá êm, ít sóng, làn nước ấm áp. Càng ra xa thì màu nước càng đâm hơn. Biển ở đây không có đá ngầm, mặt cát thoai thoải, không bị dốc lớn.
',N'Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài','06:00','08-31-2019','09-03-2019',N'4 ngày 3 đêm',
N'<b>NGÀY 1 | ĐẾN PHÚ QUỐC – KHÁM PHÁ ĐÔNG ĐẢO (ăn trưa, tối)</b><br/>
<br/><b>Sáng:</b> Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài, HDV giúp quý khách làm thủ tục đáp chuyến bay VJ451 (07:05 - 09:10) đến Phú Quốc. xe đưa quý khách đi thăm Cơ Sở Rượu Sim: loại rượu được lên men từ Sim rừng Phú Quốc, rất độc đáo và thơm ngon, sau đó ăn trưa tại nhà hàng và về khách sạn nhận phòng và nghỉ ngơi.
<br/><b>Chiều:</b> Xe đưa quý khách đi tham quan những điểm sau:
<br/>Vườn tiêu Phú Quốc – nông sản nổi tiếng của Phú Quốc.
<br/><b>Nhà thùng nước mắm:</b> tìm hiểu quy trình chế biến nước mắm Phú Quốc hảo hạng.
<br/>Suối Tranh: một bức tranh sơn thủy của xứ đảo (tháng 5 đến tháng 10)
<br/>Làng chài Hàm Ninh (thưởng thức hải sản tươi sống tại đây – chi phí tự túc).
<br/>18h00: Quý khách ăn tối tại nhà hàng Hàm Ninh sau đó về lại khách sạn tự do đi dạo chợ đêm…
<br/>Nghỉ đêm tại khách sạn.
<br/><br/><b>NGÀY 2 | ĐI NAM ĐẢO – CÂU CÁ VÀ BƠI NGẮM SAN HÔ (ăn trưa và tối)</b><br>
<br/><b>Sáng:</b> quý khach dùng điểm tâm sáng tại khách sạn – khởi hành đi Nam đảo tham quan:
<br/>Cơ sở nuôi cấy ngọc trai – các trang sức bằng Ngọc trai chính hiệu được nuôi cấy tại Phú Quốc.
<br/>Vào KDL Bãi Sao – Lên tàu tham gia chương trình câu cá – bơi ngăm san hô (tàu được trang bị đầy đủ áo phao,mồi câu, ống câu, kiếng bơi…) quý khách trải nghiệm câu các loài cá biển: cá hồng, chàm, mú…khám phá  đại dương với chương trình bơi ngắm san hô.
<br/>12h00: Ăn trưa trên tàu, vào bãi sao tự do tắm biển, nghỉ ngơi…chiều về thăm:
<br/>Tham quan di tích lịch sử nhà tù Phú Quốc. 
<br/>Thắng cảnh Dinh Cậu: nơi tôn thờ tín ngưỡng của người dân trên đảo mỗi khi ra khơi đánh bắt.
<br/>Quay về khách sạn nghỉ ngơi 
<br/>18h00: Ăn tối tại nhà hàng – Tự do nghỉ đêm tại Phú  Quốc.
<br/><br/><b>NGÀY 3 | VINPEARL LAND – SAFARI - CÁP TREO ĐẢO HÒN THƠM (bữa trưa tự túc, có ăn tối)</b><br>
<br/><b>Sáng:</b> Quý khách ăn sáng tại khách sạn – Có thể tự do thăm quan trải nghiệm thú vị tại các điểm sau:
<br/><b>Lựa chọn 1:</b>  khu vui chơi Vinpearlland Phú Quốc: với khu vơi chơi trong nhà và ngoài trời đầy cảm giác mạnh như: tháp rơi tự do, đu quay lộn đầu, đĩa quay, xe điện đụng…Khám phá thủy cung với nhiều sinh vật quý hiếm cùng các show diễn hấp dẫn như: Nàng tiên cá, cho cá mập ăn, tắm công viên nước với đường trượt siêu lòng chảo, đường trượt lốc xoáy, phim 5D, biểu diễn nhạc nước…
<br/><b>Lựa chọn 2:</b> khám phá Safari đầu tiên tại Việt Nam: đặc sắc với 30 phút ở vườn thú mở tham quan bằng xe chuyên dụng quý khách trải nghiệm đặc biệt khi đi rất gần các loài động vật hoang dã, các loài thú quý hiếm trên thế giới có mặt tại đây: Hổ bengal, Tê giác trắng, Tinh Tinh, Hồng Hạc…hay trải nghiệm cho động vật ăn, chụp ảnh…
<br/><b>Lựa chọn 3:</b> Tắm Bùn Khoáng Phú Quốc: quý khách thư giãn với dịch vụ như – ngâm bùn khoáng nóng, ôn tuyền thủy liệu pháp, thư giãn tại hồ bơi…
<br/><b>Lựa chọn 4:</b> Trải ngiệm Cáp Treo Hòn Thơm: cáp treo ba dây vượt biển dài nhất thế giới gần 8000 mét – ngắm toàn cảnh quần đảo An Thới, xe điện đưa quý khách tới bãi biển Hòn Thơm quý khách tự do vui chơi giải trí với nhiều trò chơi cảm giác mạnh, câu cá, tắm biển, ăn uống và giải trí giữa không gian biển xanh bao la…
<br/><b>Buổi trưa:</b> Quý khách ăn tự túc – Tiếp tục vui chơi và tham quan
<br/>Trở về khách sạn – Ăn tối và nghỉ đêm.
<br/><b>Note:</b> Vinpearlland và safari, cáp treo có xe bus đưa đón miễn phí từ TT Dương Đông.
<br/>Chi phí vé, di chuyển và dịch vụ các khu vui chơi tự túc.
<br/><br/><b>NGÀYNGÀY 4 | TẠM BIỆT PHÚ QUỐC (Ăn sáng, ăn trưa)</b><br>
<br/><b>Sáng:</b> Ăn sáng tại khách sạn. Quý khách tự do tắm biển hoặc mua sắm tại chợ Dương Đông.
<br/><b>Trưa:</b> Đoàn làm thủ tục trả phòng. Ăn trưa tại nhà hàng
<br/><b>Chiều:</b> Sau đó xe đưa quý khách ra sân bay, hướng dẫn viên giúp quý khách làm thủ tục đáp chuyến bay về Hà Nội.
<br/><b>Chia tay, hẹn gặp lại quý khách trong những chuyến đi sau.</b>',
N'<b>GIÁ BAO GỒM </b><br/>
<br/>Khách sạn 3* tiêu chuẩn 2-3 khách/phòng, trường hợp lẻ nam – nữ nghỉ phòng đơn, sẽ tính phụ thu phòng đơn ( Khách sạn Lam Hà, Praha… hoặc tương đương)
<br/>Bữa ăn theo lịch trình: 05 bữa x 120.000VNĐ/bữa chính
<br/>Ăn sáng trong giá phòng. 
<br/>Vé máy bay khứ hồi HN – PQ – HN ( 7kg hành lý xách tay + 20kg hành lý ký gửi)
<br/>Xe du lịch đời mới, điều hòa, tiện nghi+ đón tiễn sân bay nội bài
<br/>Vé thắng cảnh thăm quan theo chương trình ( mỗi điểm 01 lần). 
<br/>Chi phí câu cá : tàu, dụng cụ câu, kính bơi.
<br/>HDV tiếng Việt nhiệt tình, kinh nghiệm. 
<br/>Bảo hiểm du lịch 30.000.000vnd/trường hợp.
<br/>Nước uống trên xe 01 chai/khách/ngày.

<br/><br/><b>KHÔNG BAO GỒM</b><br/>
<br/>Đồ uống gọi thêm trong các bữa ăn. 
<br/>Vé Vinpearland và Safari
<br/>Chi phí bãi biển ngoài chương trình, phí giặt là.
<br/>Thuế VAT 10%','~/Images/HinhAnhTour/TourMienNam/tourMN1.jpg',15,5,7390000,6990000,'VNĐ',1);
INSERT INTO Tour VALUES(021,3,N'Du lịch Phú Quốc 4 ngày khám phá biển hè giá tốt khởi hành từ Hà Nội',N'Du lịch Phú Quốc khởi hành từ Hà Nội - Mùa hè này, bạn đã có dự định gì cho bản thân, hay gia đình chưa? Bạn đang tìm một nơi có biển xanh, cát trắng, khí hậu hiền hòa mà vẫn chưa quyết định nên đi du lịch ở đâu? Hãy để chúng tôi đưa ra một vài gợi ý nhỏ cho bạn. Bạn nghĩ sao nếu hè 2019 này, bạn cùng bạn bè hay người thân đến Bãi Sao- một bờ biển tuyệt đẹp thuộc đảo Phú Quốc với làn nước trong xanh, chất lượng cát và màu sắc của nó tuyệt vời, mặt nước an toàn đối với tất cả mọi lứa tuổi và không quá phát triển nên vẫn giữ vẻ hoang sơ vốn có của nó.
<br/><b>BÃI SAO - PHÚ QUỐC CHÀO HÈ</b>
<br/>Mùa hè này, bạn đã có dự định gì cho bản thân, hay gia đình chưa? Bạn đang tìm một nơi có biển xanh, cát trắng, khí hậu hiền hòa mà vẫn chưa quyết định nên đi du lịch ở đâu? Hãy để chúng tôi đưa ra một vài gợi ý nhỏ cho bạn. Bạn nghĩ sao nếu hè 2017 này, bạn cùng bạn bè hay người thân đến du lịch Bãi Sao Phú Quốc - một bờ biển tuyệt đẹp thuộc đảo Phú Quốc với làn nước trong xanh, chất lượng cát và màu sắc của nó tuyệt vời, mặt nước an toàn đối với tất cả mọi lứa tuổi và không quá phát triển nên vẫn giữ vẻ hoang sơ vốn có của nó. 
<br/>Bãi Sao là một trong những bãi biển đẹp nhất không chỉ được xếp hạng cao ở Việt Nam mà còn trong khu vực. Bãi Sao nằm ở phía đông nam của đảo Phú Quốc thuộc thị trấn An Thới, với bờ biển có cát trắng trải dài 7km. Cát ở đây rất trắng và sáng khiến người ta liên tưởng đến bờ biển Caribbean. Cát ở gần nhà hàng Paradiso là nơi trắng nhất và sạch nhất. Xa xa về phía nam, cát ngày một thô hơn và có màu vàng nhạt. và ở phía này cũng tập trung nhiều rác thải hơn. Màu của biển cũng là điểm nhấn vô cùng tuyệt diệu của Bãi Sao. Biển có màu ngọc lam, các vùng nước xung quanh bãi biển khá êm, ít sóng, làn nước ấm áp. Càng ra xa thì màu nước càng đâm hơn. Biển ở đây không có đá ngầm, mặt cát thoai thoải, không bị dốc lớn.',
N'Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài','06:05','09-21-2019','09-24-2019',N'4 ngày 3 đêm',
N'<b>NGÀY 1 | ĐẾN PHÚ QUỐC – KHÁM PHÁ ĐÔNG ĐẢO (ăn trưa, tối)</b><br>
<br/><b>Sáng:</b> Xe và hướng dẫn viên Du Lịch Việt đón quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài, HDV giúp quý khách làm thủ tục đáp chuyến bay VJ451 (07:05 - 09:10) đến Phú Quốc. xe đưa quý khách đi thăm Cơ Sở Rượu Sim: loại rượu được lên men từ Sim rừng Phú Quốc, rất độc đáo và thơm ngon, sau đó ăn trưa tại nhà hàng và về khách sạn nhận phòng và nghỉ ngơi.
<br/><b>Chiều:</b> Xe đưa quý khách đi tham quan những điểm sau:
<br/>Vườn tiêu Phú Quốc – nông sản nổi tiếng của Phú Quốc.
<br/>Nhà thùng nước mắm: tìm hiểu quy trình chế biến nước mắm Phú Quốc hảo hạng.
<br/>Suối Tranh: một bức tranh sơn thủy của xứ đảo (tháng 5 đến tháng 10)
<br/>Làng chài Hàm Ninh (thưởng thức hải sản tươi sống tại đây – chi phí tự túc).
<br/>18h00: Quý khách ăn tối tại nhà hàng Hàm Ninh sau đó về lại khách sạn tự do đi dạo chợ đêm…
<br/>Nghỉ đêm tại khách sạn.
<br/><br/><b>NGÀY 2 | ĐI NAM ĐẢO – CÂU CÁ VÀ BƠI NGẮM SAN HÔ (ăn trưa và tối)</b><br/>
<br/><b>Sáng:</b> quý khach dùng điểm tâm sáng tại khách sạn – khởi hành đi Nam đảo tham quan:
<br/>Cơ sở nuôi cấy ngọc trai – các trang sức bằng Ngọc trai chính hiệu được nuôi cấy tại Phú Quốc.
<br/>Vào KDL Bãi Sao – Lên tàu tham gia chương trình câu cá – bơi ngăm san hô (tàu được trang bị đầy đủ áo phao,mồi câu, ống câu, kiếng bơi…) quý khách trải nghiệm câu các loài cá biển: cá hồng, chàm, mú…khám phá  đại dương với chương trình bơi ngắm san hô.
<br/>12h00: Ăn trưa trên tàu, vào bãi sao tự do tắm biển, nghỉ ngơi…chiều về thăm:
<br/>Tham quan di tích lịch sử nhà tù Phú Quốc. 
<br/><b>Thắng cảnh Dinh Cậu:</b> nơi tôn thờ tín ngưỡng của người dân trên đảo mỗi khi ra khơi đánh bắt.
<br/>Quay về khách sạn nghỉ ngơi 
<br/>18h00: Ăn tối tại nhà hàng – Tự do nghỉ đêm tại Phú  Quốc.
<br/><br/><b>NGÀY 3 | VINPEARL LAND – SAFARI - CÁP TREO ĐẢO HÒN THƠM (bữa trưa tự túc, có ăn tối)</b><br/>

<br/><b>Sáng:<br/> Quý khách ăn sáng tại khách sạn – Có thể tự do thăm quan trải nghiệm thú vị tại các điểm sau:
<br/><b>Lựa chọn 1: </b> khu vui chơi Vinpearlland Phú Quốc: với khu vơi chơi trong nhà và ngoài trời đầy cảm giác mạnh như: tháp rơi tự do, đu quay lộn đầu, đĩa quay, xe điện đụng…Khám phá thủy cung với nhiều sinh vật quý hiếm cùng các show diễn hấp dẫn như: Nàng tiên cá, cho cá mập ăn, tắm công viên nước với đường trượt siêu lòng chảo, đường trượt lốc xoáy, phim 5D, biểu diễn nhạc nước…
<br/><b>Lựa chọn 2:</b> khám phá Safari đầu tiên tại Việt Nam: đặc sắc với 30 phút ở vườn thú mở tham quan bằng xe chuyên dụng quý khách trải nghiệm đặc biệt khi đi rất gần các loài động vật hoang dã, các loài thú quý hiếm trên thế giới có mặt tại đây: Hổ bengal, Tê giác trắng, Tinh Tinh, Hồng Hạc…hay trải nghiệm cho động vật ăn, chụp ảnh…
<br/><b>Lựa chọn 3:</b> Tắm Bùn Khoáng Phú Quốc: quý khách thư giãn với dịch vụ như – ngâm bùn khoáng nóng, ôn tuyền thủy liệu pháp, thư giãn tại hồ bơi…
<br/><b>Lựa chọn 4:</b> Trải ngiệm Cáp Treo Hòn Thơm: cáp treo ba dây vượt biển dài nhất thế giới gần 8000 mét – ngắm toàn cảnh quần đảo An Thới, xe điện đưa quý khách tới bãi biển Hòn Thơm quý khách tự do vui chơi giải trí với nhiều trò chơi cảm giác mạnh, câu cá, tắm biển, ăn uống và giải trí giữa không gian biển xanh bao la…
<br/><b>Buổi trưa:</b> Quý khách ăn tự túc – Tiếp tục vui chơi và tham quan
<br/>Trở về khách sạn – Ăn tối và nghỉ đêm.
<br/><b>Note:</b> Vinpearlland và safari, cáp treo có xe bus đưa đón miễn phí từ TT Dương Đông.
 <br/>Chi phí vé, di chuyển và dịch vụ các khu vui chơi tự túc.
 <br/><br/><b>NGÀY 4 | TẠM BIỆT PHÚ QUỐC (Ăn sáng, ăn trưa)</b><br/>
<br/><b>Sáng:</b> Ăn sáng tại khách sạn. Quý khách tự do tắm biển hoặc mua sắm tại chợ Dương Đông.
<br/><b>Trưa:</b> Đoàn làm thủ tục trả phòng. Ăn trưa tại nhà hàng
<br/><b>Chiều:</b> Sau đó xe đưa quý khách ra sân bay, hướng dẫn viên giúp quý khách làm thủ tục đáp chuyến bay về Hà Nội. 
<br/><b>Chia tay, hẹn gặp lại quý khách trong những chuyến đi sau.</b>',N'Ghi chu','~/Images/HinhAnhTour/TourMienNam/tourMN2.jpg',20,10,6290000,5990000,'VNĐ',1);
INSERT INTO Tour VALUES(022,3,N'Du Lịch khám phá Miền Tây sông nước dịp hè 4 Ngày từ Hà Nội 2019',N'Du Lịch Miền Tây - Xuôi về Miền Tây, Du Khách có dịp trải nghiệm thú vị khi hòa mình vào cuộc sống miệt vườn, thưởng thức những món ăn đặc sản đậm đà hương vị của vùng đồng bằng cây ngọt trái lành. Đến Cần Thơ, vùng đất mệnh danh là “Tây Đô”, lên thuyền du ngoại chợ nổi Cái Răng, trực tiếp trải nghiệm nét văn hóa độc đáo trên sông nước. 
<br/><b>Nhuộm màu khung trời miền Tây khi mùa hè tới</b>
 <br/>Không phồn vinh và hoa lệ như TPHCM, không lãng mạn như Đà Lạt, nhưng ở miền Tây vẫn hấp dẫn mọi du khách bởi khung cảnh sông nước, sắc màu của những miệt vườn hoang sơ và con người ở nơi đây vô cùng dễ mến, đôn hậu.',
 N'Xe và Hướng Dẫn Viên Công Ty Du Lịch Việt đón Quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài ','06:15','10-04-2019','10-07-2019',N'4 ngày 3 đêm',
 N'<br/><b>NGÀY 1 | HÀ NỘI– CẦN THƠ- BẠC LIÊU (Ăn trưa, chiều)</b><br/><br/>
<br/>Xe và Hướng Dẫn Viên Công Ty Du Lịch Việt đón Quý khách tại điểm hẹn khởi hành ra sân bay Nội Bài đáp chuyến bay VJ463 đi Cần Thơ. Đến sân bay, xe và Hướng dẫn viên đón đoàn đi khởi hành đi Sóc Trăng viếng chùa Dơi, chùa Đất Sét.
<br/>Nghỉ ngơi và ăn trưa tại nhà hàng.
<br/>Lên xe khởi hành đi Bạc Liêu. Đoàn đi tham quan:
<br/>Nhà công tử Bạc Liêu – nghe kể về cuộc sống vàng son một thời của cậu Ba Huy - người được mệnh danh là “Công tử Bạc Liêu”.
<br/>Khu lưu niệm cố nhạc sỹ Cao Văn Lầu, tác giả bài Dạ cổ Hoài Lang, người có công lớn trong công cuộc khai sáng nền dân ca tài tử cải lương Nam bộ, viếng Phật bà Nam Hải, chùa Xiêm Cán.
<br/>Ăn tối tại nhà hàng
<br/>Nghỉ đêm tại Bạc Liêu.
<br/><br/><b>NGÀY 2 | BẠC LIÊU – CÀ MAU - RỪNG U MINH (Ăn sáng, trưa, chiều)</b><br/>
<br/>Qúy khách dùng điểm tâm sáng tại khách sạn . Sau đó khởi hành đi Cà Mau, tiếp tục đến thị trấn U Minh, vào rừng tràm bắt ong (theo mùa), và thưởng thức các món ăn làm từ ong. Tại đây quý khách có cơ hội mua những chai mật ong rừng nguyên chất quý giá về làm quà. (có thể bỏ điểm tham quan này tùy thuộc vào thời tiết, khí hậu,…tại thời điểm đi tour).
<br/>Đoàn ăn trưa và thưởng thức những món ăn dân giã tại rừng tràm.
<br/>Quay về thành phố Cà Mau, tham quan : sân chim Cà Mau - nơi đây rất nhiều loài chim cò quần tụ, sinh sống như cò trắng, vạc, le le, vịt nước và rất nhiều loài chim quý hiếm khác cũng chọn nơi này làm nơi cư ngụ sinh sôi.
<br/>Về khách sạn nhận phòng nghỉ ngơi. Ăn tối tại nhà hàng.
<br/>Nghỉ đêm tại Cà Mau
<br/><br/><b>NGÀY 3 | CÀ MAU – ĐẤT MŨI- CẦN THƠ (Ăn sáng, trưa, chiều)</b><br/>
<br/>Dùng bữa sáng.
<br/>Khởi hành về Năm Căn – thị trấn Cực Nam giàu có nguồn tài nguyên thủy hải sản.
<br/>Xe đưa Quý Khách ra bến tàu đi canô tham quan Đất Mũi (Mũi Cà Mau):
<br/>Trên đường Quý khách ngắm nhìn Tượng đài Anh hùng - Liệt sỹ Phan Ngọc Hiển, người có công lãnh đạo khởi nghĩa Hòn Khoai (Cà Mau).
<br/>Tham quan mốc tọa độ quốc gia. 
<br/>Panô biểu tượng mũi Cà Mau. 
<br/>Lên Vọng Lâm Đài cao trên 20m để ngắm nhìn tòan cảnh Mũi Cà Mau.
<br/>Tham quan mô hình thu nhỏ Làng Rừng kháng chiến.
<br/>Quý Khách dùng cơm trưa.
<br/>Đoàn khởi hành về Cần Thơ, dùng cơm chiều. 
<br/>Tối: Quý khach tự do đi dạo bến Ninh Kiều - được mệnh danh là đệ nhất danh thắng xứ Tây Đô, du thuyền sông Hậu, nghe đờn ca tài tử cải lương (chi phí tự túc). Hoặc tự do dạo chợ đêm Tây Đô, trung tâm thương mại Cái Khế - nơi có những hoạt động vui chơi, náo nhiệt nhất Tây Đô về đêm. Nghỉ đêm khách sạn tại Cần Thơ.
<br/><br/><b>NGÀY 4 | CẦN THƠ – TP.HCM- HÀ NỘI (Ăn sáng)</b><br/>
<br/>Đoàn xuống đò đi chợ nổi Cái Răng lúc 05h00, một trong những chợ nổi lớn nhất Đồng bằng Sông Cửu Long, tìm hiểu nét văn hóa mua bán trên sông rất đặc trưng của người Nam Bộ.
<br/>Tiếp tục tham quan:
<br/>Vườn trái cây Nam Bộ với những trái cây theo mùa (chôm chôm, nhãn, xoài, bòn bon….).
<br/>Tham quan Nhà cổ Nam Bộ.
<br/>Thưởng thức trái cây miệt vườn Nam Bộ theo mùa và nghe đờn ca tài tử.
<br/>​Đoàn trả phòng khách sạn, ăn trưa tại nhà hàng.
<br/>Đoàn viếng thăm Thiền Viện Trúc Lâm Phương Nam được xem là một trong những công trình nghệ thuật độc đáo của đất Tây Đô - ngôi chùa rộng nhất khu vực Đồng bằng sông Cửu Long, được xây dựng trên diện tích gần 4 ha, với kết cấu lợp ngói, khung cột gỗ lim, chánh điện rộng cùng nhà tổ, nhiều tượng Phật được làm bằng gỗ Du Sam.
<br/>Sau đó, xe đưa Đoàn khởi hành ra sân bay Cần Thơ làm thủ tục đáp chuyến bay VJ464 về Hà Nội lúc 18h00.
<br/>Về đến Hà Nội, xe đưa Quýkhách về điểm đón ban đầu. Chia tay quý khách và hẹn gặp lại trong những chuyến du lịch tiếp theo.',
N'<br/><br/><b>GIÁ BAO GỒM:</b><br/>
-     Xe tham quan (xe 16 chỗ, 29 chỗ, 35 chỗ, 45 chỗ) tùy theo số lượng khách thực tế trên chuyến đi.
<br/>-    Khách sạn 3 sao đầy đủ tiện nghi 2/khách người lớn/ phòng. Nếu lẻ người thứ 3, đóng phụ phí phòng đơn hoặc ngủ ghép phòng 3 khách.
<br/>-    Ăn uống theo chương trình: 
<br/>    + Ăn phụ: 4 bữa sáng.
<br/>    + Ăn chính: 7 bữa chính tiêu chuẩn 120.000 đồng/bữa
<br/>-    Vé tham quan theo chương trình. 
<br/>-    Hướng dẫn viên tiếng Việt vui vẻ nhiệt tình suốt chuyến đi.
<br/>-    Bảo hiểm với mức bồi thường tối đa 30.000.000 đồng/trường hợp.
<br/>-    Quà tặng: nón du lịch Việt, nước, khăn lạnh.
<br/><br/><b>KHÔNG BAO GỒM:</b><br/>
<br/>-    Tham quan ngoài chương trình.
<br/>-    Chi phí cá nhân: bia hay nước ngọt trong các bữa ăn, điện thoại, giặt ủi…
<br/>-    Chi phí bãi biển: dù, võng, tắm nước ngọt…
<br/>-    Chi phí cáp treo, chi phí các trò chơi,…
<br/>-    Thuế VAT 10%','~/Images/HinhAnhTour/TourMienNam/tourMN3.jpg',25,10,5990000,5499000,'VNĐ',1);
INSERT INTO Tour VALUES(023,3,N'Du lịch 6 tỉnh Miền Tây - khám phá miệt vườn sông nước 4 ngày từ Hà Nội',
N'Xuôi về Miền Tây, Du Khách có dịp trải nghiệm thú vị khi hòa mình vào cuộc sống miệt vườn, thưởng thức những món ăn đặc sản đậm đà hương vị của vùng đồng bằng cây ngọt trái lành. Đến Cần Thơ, vùng đất mệnh danh là “Tây Đô”, lên thuyền du ngoại chợ nổi Cái Răng, trực tiếp trải nghiệm nét văn hóa độc đáo trên sông nước. 
<br/>Xuôi về Miền Tây, Du Khách có dịp trải nghiệm thú vị khi hòa mình vào cuộc sống miệt vườn, thưởng thức những món ăn đặc sản đậm đà hương vị của vùng đồng bằng cây ngọt trái lành. Đến Cần Thơ, vùng đất  mệnh danh là “Tây Đô”, lên thuyền du ngoại chợ nổi Cái Răng, trực tiếp trải nghiệm nét văn hóa độc đáo trên sông nước.
',N'Xe và Hướng Dẫn Viên Công Ty Du Lịch Việt đón Quý khách tại điểm hẹn Khởi hành đi Mỹ Tho','07:00','10-10-2019','10-13-2019',N'4 ngày 3 đêm',
N'<br/><b>NGÀY 1 | TP. HCM – TIỀN GIANG – MỸ THO – THỚI SƠN – CẦN THƠ</b><br/>
<br/>Xe và Hướng Dẫn Viên Công Ty Du Lịch Việt đón Quý khách tại điểm hẹn Khởi hành đi Mỹ Tho.
<br/>Quý khách dùng điểm tâm sáng tại Trung Lương. Tiếp tục lộ trình ghé tham quan chùa Vĩnh Tràng với lối kiến trúc kết hợp Châu Âu và Châu Á.
<br/>Đến bến đò 30/04, Quý khách xuống thuyền thưởng ngoạn cảnh sông nước miền Tây Nam Bộ với 4 cù lao: Long, Lân, Quy, Phụng, thưởng thức hương vị ngọt ngào của trái dừa xiêm.
<br/>Thuyền đưa đoàn đi tham quan cù lao Thới Sơn, đi bộ trên đường làng, tham quan trại nuôi ong mật, uống trà mật ong, thưởng thức các loại mứt đặc sản. Tham quan vườn cây ăn trái, thưởng thức các loại trái cây tại vườn, nghe nhạc tài tử Nam Bộ. Đi xuồng chèo trong rạch dừa nước thiên nhiên.
<br/>Thuyền lớn đưa khách sang Bến Tre tham quan lò kẹo dừa nổi tiếng Bến Tre.
<br/>Tham quan Cồn Phụng (Di tích Ông Đạo Dừa).
<br/>Dùng cơm trưa. Thuyền đưa du khách trở lại Bến Tàu 30/4, khởi hành đi Cần Thơ.
<br/>Dùng cơm chiều.
<br/>Nghỉ đêm khách sạn tại Cần Thơ.
<br/><br/><b>NGÀY 2 | CHỢ NỔI CÁI RĂNG – SÓC TRĂNG – BẠC LIÊU – CÀ MAU</b><br/>
<br/>​Du khách đến bến Ninh Kiều: Thuyền đưa du khách tham quan chợ nổi Cái Răng với cảnh nhộn nhịp buôn bán trên sông, một nét văn hóa rất đặc sắc ở vùng đồng bằng sông nước Cửu Long.
<br/>Về lại khách sạn, dùng bữa sáng. Khởi hành về Sóc Trăng.
<br/>Quý Khách viếng Chùa Mã Tộc (Chùa Dơi) – nơi tập trung hàng ngàn con dơi tự nhiên,
<br/>Chùa Đất Sét (Bửu Sơn Tự) với  hàng trăm tượng lớn nhỏ đều được nặn từ đất sét, độc đáo hơn nơi đây còn có 8 cây nến nặng tổng cộng 1,4 tấn sáp.
<br/>Tham quan Bảo tàng Khmer Sóc Trăng -  công trình có kiến trúc theo phong cách chùa của người Khmer, được xây dựng 1938, trong bảo tàng trưng bày nhiều hiện vật quý, phản ánh đời sống văn hóa vật chất và tinh thần của đồng bào Khmer qua nhiều thế hệ như: trang phục, kiến trúc nhà ở, chùa, nhạc cụ...
<br/>Viếng chùa Kh’leang một trong những ngôi chùa Khmer cổ nhất ở Sóc Trăng được xây dựng vào giữa thế kỷ 16, gắn liền với truyền thuyết địa danh Sóc Trăng.
<br/>Dùng cơm trưa.    
<br/>Đoàn khởi hành đến Cà Mau, trên đường Đoàn đến viếng thăm Nhà thờ Tắc Sậy (Nhà thờ Cha Trương Bửu Diệp).
<br/>Dùng cơm chiều. Nghỉ đêm khách sạn tại Cà Mau.
<br/><br/><b>NGÀY 3 | CÀ MAU – NĂM CĂN – ĐẤT MŨI – BẠC LIÊU </b><br/>
<br/>Dùng bữa sáng.
<br/>Khởi hành về Năm Căn – thị trấn Cực Nam giàu có nguồn tài nguyên thủy hải sản.
<br/>Xe đưa Quý Khách ra bến tàu đi canô tham quan Đất Mũi (Mũi Cà Mau)
<br/>Trên đường Quý khách ngắm nhìn Tượng đài Anh hùng - Liệt sỹ Phan Ngọc Hiển, người có công lãnh đạo khởi nghĩa Hòn Khoai (Cà Mau).
<br/>Tham quan mốc tọa độ quốc gia. 
<br/>Panô biểu tượng mũi Cà Mau. 
<br/>Lên Vọng Lâm Đài cao trên 20m để ngắm nhìn tòan cảnh Mũi Cà Mau. 
<br/>Tham quan mô hình thu nhỏ Làng Rừng kháng chiến. 
<br/>Quý Khách dùng cơm trưa.
<br/>Khởi hành về Bạc Liêu, tham quan Nhà công tử Bạc Liêu gắn liền với giai thoại các chàng công tử Bạc Liêu nổi tiếng vùng Lục tỉnh Nam Kỳ xa xưa.
<br/>Tham quan Khu lưu niệm nhạc sĩ Cao Văn Lầu nơi an nghỉ cuối cùng của tác giả bài Dạ Cổ Hoài Lang nổi tiếng Nam Bộ. Tại đây du khách được nghe giới thiệu về thân thế, sự nghiệp của ông, quá trình phát triển nghệ thuật từ bản Dạ Cổ.
<br/>Dùng cơm chiều.
<br/>Nghỉ đêm khách sạn tại Bạc Liêu.
<br/><br/><b>NGÀY 4 | BẠC LIÊU – CẦN THƠ – TP.HCM </b><br/>
<br/>Dùng bữa sáng. Đoàn khởi hành đến Cần Thơ
<br/>Viếng thăm Thiền Viện Trúc Lâm Phương Nam được xem là một trong những công trình nghệ thuật độc đáo của đất Tây Đô - ngôi chùa rộng nhất khu vực Đồng bằng sông Cửu Long, được xây dựng trên diện tích gần 4 h.a, với kết cấu lợp ngói, khung cột gỗ lim, chánh điện rộng cùng nhà tổ, nhiều tượng Phật được làm bằng gỗ Du Sam.
<br/>​Dùng cơm trưa tại nhà hàng Về đến TP.HCM, đưa Quý khách về điểm đón ban đầu. 
<br/>Chia tay quý khách và hẹn gặp lại trong những chuyến du lịch tiếp theo!.',
N'<br/><br/><b>GIÁ BAO GỒM:</b><br/>
<br/>-    Khách sạn 3 sao tại Cần Thơ: Ninh Kiều, Tây Đô, Hậu Giang, Cửu Long, Holiday, ...(hoặc tương đương)
<br/>-    Khách sạn 3 sao tại Bạc Liêu: khách sạn Bạc Liêu, Khách sạn Công Tử Bạc Liêu, ...(hoặc tương đương)
<br/>-    Khách sạn 3 sao tại Cà Mau: Best CM, Quốc Tế, Ánh Nguyệt, Nam Kiều...(hoặc tương đương)
<br/>-    đầy đủ tiện nghi 2/khách người lớn/ phòng. 
<br/>-    Nếu lẻ người thứ 3, đóng phụ phí phòng đơn hoặc ngủ ghép phòng 3 khách.
<br/>-    Ăn uống theo chương trình: 
<br/>    + Ăn phụ: 4 bữa sáng.
<br/>    + Ăn chính: 6 bữa chính tiêu chuẩn 90.000 đồng/bữa, 1 bữa ăn đặc sản 120.000đ/ bữa.
<br/>-    Xe tham quan (xe 16 chỗ, 29 chỗ, 35 chỗ, 45 chỗ) tùy theo số lượng khách thực tế trên chuyến đi.
<br/>-    Vé tham quan theo chương trình. 
<br/>-    Hướng dẫn viên tiếng Việt vui vẻ nhiệt tình suốt chuyến đi.
<br/>-    Bảo hiểm với mức bồi thường tối đa 30.000.000 đồng/trường hợp.
<br/>-    Quà tặng: nón du lịch Việt, nước, khăn lạnh.
<br/>-    
<br/><br/><b>KHÔNG BAO GỒM:<?b><br/><br/>
<br/>-    Tham quan ngoài chương trình.
<br/>-    Chi phí cá nhân: bia hay nước ngọt trong các bữa ăn, điện thoại, giặt ủi…
<br/>-    Chi phí bãi biển: dù, võng, tắm nước ngọt…
<br/>-    Chi phí cáp treo, chi phí các trò chơi,…
<br/>-    Thuế VAT 10% ','~/Images/HinhAnhTour/TourMienNam/tourMN4.jpg',20,10,2799000,2499000,'VNĐ',1);
INSERT INTO Tour VALUES(024,3,N'Du Lịch Côn Đảo ',N'Du Lịch Côn Đảo - Côn Đảo được xem là hòn đảo du lịch với những bãi tắm hoang sơ tuyệt đẹp, làn nước trong xanh mát lạnh, bãi cát dài phẳng mịn. Không khí trên đảo thật trong lành, được ví như thiên đường nghỉ dưỡng. Đừng chần chừ, hãy cùng Du Lịch Việt khám phá và trải nghiệm địa danh nổi tiếng này. 
<br/>Côn Đảo được xem là hòn đảo du lịch với những bãi tắm hoang sơ tuyệt đẹp, làn nước trong xanh mát lạnh, bãi cát dài phẳng mịn. Không khí trên đảo thật trong lành, được ví như thiên đường nghỉ dưỡng. Đừng chần chừ, hãy cùng Du Lịch Việt khám phá và trải nghiệm địa danh nổi tiếng này.',
N'Xe ô tô và hdv của Du lịch Việt đón quý khách tại 21 Văn Miếu','08:00','09-15-2019','09-11-2019',N'3 ngày 3 đêm',
N'<br/><b>NGÀY 1 | Hà Nội - TP. Hồ Chí Minh - Côn Đảo (ăn trưa, tối)</b><br/>
<br/><b>Sáng:</b> Xe ô tô và hdv của Du lịch Việt đón quý khách tại 21 Văn Miếu.  Quý khách khởi hành ra sân bày Nội Bài làm thủ tục bay đi Tp. Hồ Chí Minh tại sân bay Nội Bài. Đến sân bay Tân Sơn Nhất , Hướng dẫn viên đón quý khách và làm thủ tục bay đi Côn Đảo. Xe đón quý khách tại sân bay Côn Sơn  về khách sạn, trên đường về sẽ đi qua các địa danh:
<br/><b>Cỏ ống :</b> Địa danh này mang tên một loại cỏ hình ống, chiều cao từ nửa thước trở lên.
<br/><b>Mũi Lò Vôi :</b> Nơi người Pháp xây nên nhằm sản xuất vôi bằng san hô và kết hợp một số phụ gia tạo   thành chất kết dính thay cho xi măng.
<br/><b>Hàng Keo :</b> Là nghĩa địa đầu tiên tại Côn Đảo, nơi thực dân Pháp chôn cất tù nhân tử nạn trước khi có nghĩa trang Hàng Dương.
<br/>Đến khách sạn ăn trưa, nhận phòng,nghỉ ngơi 
<br/><b>Chiều:</b> Xe đưa Quý khách tham quan:
<br/><b>Vân Sơn Tự (chùa Núi Một):</b> Ngôi chùa duy nhất đã được xây dựng lại mới và khánh thành vào đầu tháng 12/2011. Với địa thế đẹp nhất Côn đảo, được bao quanh bởi núi, mặt trước hướng biển nhìn từ trên cao, Vân Sơn Tự đã thực sự thu hút hàng ngàn khách du lịch, tham quan lễ chùa.
<br/><b>Cảng Bến Đầm :</b> Cảng lớn nhất tại Côn Đảo, là địa điểm hoạt động trung chuyển hàng hóa, hành khách, giao dịch, buôn bán thủy sản và cung ứng các dịch vụ hậu cần nghề biển.
<br/><b>Mũi Cá Mập :</b> Mỏm núi vươn dài ra biển có hình tượng giống hàm cá mập.
<br/><b>Đỉnh Tình Yêu:</b>  Là chóp núi có hình tượng của đôi trai gái đang tâm tình mà thiên nhiên đã ban tặng cho Côn Đảo.
<br/><b>Bãi Nhát:</b>  Một bãi tắm bị tác động của thuỷ triều, khi nước xuống sẽ lộ thiên một bãi tắm với cát trắng mịn, nước trong xanh.
<br/><b>Tối:</b> Ăn tối tại nhà hàng địa phương.
<br/><br/><b>NGÀY 2 | Côn Đảo – Khám phá thiên nhiên (ăn sáng,trưa,tối)</b><br/><br/>
<br/><b>Sáng: </b>Dùng điểm tâm sáng , sau đó xe và thuyết minh viên Bảo Tàng đưa đoàn tham quan 
<br/><b>Bảo Tàng :</b> Nơi lưu giữ các tư liệu và hình ảnh của Côn Đảo từ thời Pháp thuộc đến những năm 2000.
<br/><b>Phú Hải :</b> Trại giam đầu tiên được xây dựng tại Côn Đảo, nơi có truyền thuyết về hầm Xay Lúa.
<br/><b>Cầu tàu 914:</b> Nơi đầu tiên được xây dựng trên đất Côn Đảo, với con số ước tính số tù nhân bị thiệtmạng là 914 người.
<br/><b>Nghĩa trang Hàng Dương : </b>Nơi yên nghỉ của hàng vạn chiến sĩ Cách mạng và những người yêu  nước Việt Nam qua nhiều thế hệ bị tù đày khổ sai và đặc biệt là mộ cô Võ Thị Sáu  rất linh thiêng.
<br/>Tham quan Đền Thờ Côn Đảo, là công trình phức hợp được thiết kế theo kiểu dáng kiến trúc của ngôi đền truyền thống Nam bộ, là nơi tri ân, tưởng nhớ công lao của các bậc tiền nhân đã hy sinh cho độc lập, tự do của dân tộc tại Côn Đảo.
<br/><b>Chuồng Cọp Pháp - Mỹ:</b> Hệ thống biệt giam đặc biệt tại Côn Đảo.
<br/><b>Chuồng Bò: </b> Nơi tra tấn man rợ của nhà cầm quyền.
<br/><b>Miếu bà Phi Yến :</b> Nơi thờ phượng bà Lê Thị Râm, thứ phi của chúa Nguyễn ánh.

<br/><b>Chiều:</b>Xe và HDV  đưa đoàn tắm biển tại bãi Đầm Trầu, cách trung tâm thị trấn Côn Đảo khoảng 13km. 
<br/><b>Đầm Trầu: </b>Một bãi tắm gần như còn hoang sơ chưa bị bàn tay con nguời khai phá , tuyệt đẹp với cát vàng mịn màng, làn nước trong xanh màu ngọc bích. Từ lộ chính, quý khách đi bộ theo đường mòn khoảng 1,5km để đến bãi tắm, trên đường đi quý khách hãy dừng chân tại Miếu Cậu  để thắp nén nhang nơi thờ hoàng tử Cải, con trai của chúa Nguyễn Ánh và bà Hoàng Phi Yến.
<br/><b>17h00:</b> Quay về khách sạn, nghỉ ngơi, dùng cơm chiều. Tối: Tự do dạo biển về đêm.
<br/><br/><b>NGÀY 3 | Côn Đảo – Tp Hồ Chí Minh - Hà Nội (ăn sáng)</b><br/><br/>
<br/><b>7h30:</b> Quý khách -  dùng buffet tại khách sạn. Tự do đi chợ Côn Đảo  mua quà lưu niệm. 
<br/><b>11h30:</b> Ăn trưa, Làm thủ tục trả phòng, xe đưa đoàn ra sân bay làm thủ tục đáp chuyến bay về lại Hà Nội. Kết  thúc chương trình',
N'<br/><b>Giá tour bao gồm:</b><br/><br/>
<br/>Vé máy bay khứ hồi Hà Nội –  Sài Gòn– Côn Đảo.
<br/>Xe  đời mới phục vụ suốt hành trình .
<br/>Khách sạn tiêu chuẩn 3 sao, 2 khách /phòng, trường hợp lẻ nam/nữ sẽ tách ngủ riêng phòng và tính phụ phí phòng đơn.Ăn sáng buffet tại khách sạn. Ăn  bữa chính tiêu chuẩn 100.000/bữa chính /người
<br/>Hướng dẫn viên tiếng Việt nhiệt tình .
<br/>Nước suối trên đường (1 chai/ ngày).
<br/>Bảo hiểm du lịch theo qui định bảo hiểm Việt Nam với mức tối đa là 30.000.000đ/trường hợp
<br/>Giá tour không bao gồm:
<br/>Hóa đơn giá trị gia tăng.
<br/>Tham quan ngoài chương trình, giặt là và các chi phí cá nhân khác ,… Bia hay nước ngọt trong các bữa ăn
<br/><b>Giá tour trẻ em: </b><br/><br/>
<br/>Trẻ em dưới 2 tuổi miễn phí giá tour.
<br/>Trẻ em từ 02 – đến 05 tuổi: Giá vé máy bay theo qui định của hàng không ( bằng giá vé người lớn) , miễn phí tour. Cha, mẹ hoặc người thân đi kèm tự lo các chi phí ăn, ngủ, tham quan (nếu có) cho bé. Hai người lớn chỉ kèm 1 trẻ em dưới 5 tuổi, em thứ 2 trở lên phải mua ½ tiền  land tour.
<br/>Trẻ em từ 05 – đến 10 tuổi ( trẻ phải có chiều cao dưới 1,3m)  : Giá vé máy bay theo qui định của hàng không( bằng giá vé người lớn)  , 50% giá tour. Bao gồm các dịch vụ ăn uống, ghế ngồi trên xe và ngủ chung với gia đình, không có giường. Hai người lớn chỉ được kèm 1 trẻ em từ 5 đến 10 tuổi, em thứ 2 trở lên sẽ bị tính 75% giá tour người lớn.
<br/>Trẻ em từ 10 tuổi trở lên ( trẻ có chiều cao trên 1,3m)  : 100% giá tour và tiêu chuẩn như người lớn.
<br/>Quy định hoàn, hủy tour (tính theo ngày khởi hành)
<br/>Trong trường hợp không thể tham dự được tour, quý khách vui lòng thông báo cho công ty và chịu phí huỷ như sau:
<br/>Huỷ trước 30- 45 ngày: 10%  tổng giá thành tour, Huỷ trước 20 – 30 ngày : 20% tổng giá thành tour
<br/>Huỷ trước 15 ngày: 40% tổng giá thành tour
<br/>Huỷ trước 07 ngày: 60% tổng giá thành tour, Huỷ trước 05- 06 ngày: 80% tổng giá thành tour
<br/>Hủy dưới 4 ngày: 100% tổng giá thành tour. ( thời gian hủy tính cả ngày nghỉ lễ, thứ 7 và chủ nhật)
<br/>rường hợp hủy tour do sự cố khách quan như thiên tai, dịch bệnh hoặc do tàu thủy, xe lửa, máy bay hoãn/hủy chuyến, Du Lịch Việt sẽ không chịu trách nhiệm bồi thường thêm bất kỳ chi phí nào khác ngoài việc hoàn trả chi phí những dịch vụ chưa sử dụng đến, sau khi đã trừ đi phần bị surcharge tiền của các dịch vụ đó ( Nếu có).
  <br/> Việc huỷ bỏ chuyến đi:
<br/>Các trường hợp hủy tour quý khách phải thông báo trực tiếp tại Văn phòng, hoặc qua fax, mail và phải có xác nhận lại của công ty.
<br/>Việc huỷ bỏ bằng điện thoại, hoặc chưa có xác nhận lại của cty sẽ không được chấp nhận
<br/>Lưu ý:
<br/>Quý khách vui lòng liên hệ trực tiếp với các nhân viên kinh doanh của chúng tôi qua điện thoại hoặc đến trực tiếp Văn phòng Công ty Du Lịch Việt tại 21 Văn Miếu, Đống Đa, Hà Nội để được tư vấn thêm về các CMND, Hộ chiếu,  các điều kiện Hoàn hủy tour và Lưu ý. Hân hạnh được đón tiếp Quý khách!','~/Images/HinhAnhTour/TourMienNam/tourMN5.jpg',10,5,10499000,10000000,'VNĐ',1);
/*
INSERT INTO Tour VALUES(025,3,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourMienNam/tourMN6.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(026,3,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourMienNam/tourMN7.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(027,3,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourMienNam/tourMN8.jpg',25,10,130000,1000000,'VNĐ',1);
*/
--CHÂU Á
INSERT INTO Tour VALUES(028,4,N'Tour du lịch Nhật Bản dịp lễ 2/9 khởi hành từ Hà Nội',
N'<br/><b>Hành trình:</b> Tokyo - Yamanshi - Mt. Fuji - Nagoya - Kyoto
<br/><b>Số ngày:</b> 5 ngày 4 đêm
<br/><b>Khởi hành:</b> 28/08/2019
<br/><b>Vận chuyển:</b> Vé máy bay khứ hồi và xe du lịch
<br/>Du lịch Nhật Bảnvào mùa thu, du khách chiêm ngưỡng xứ sở Phù Tang với vẻ đẹp của "thiên đường trong mơ", thiên nhiên nhẹ nhàng khoát lên mình những cảnh sắc kì vĩ và thơ mộng như cổ tích, lá phong vàng rơi rơi trong gió, những tia nắng mặt trời lúc hoàng hôn le lói phản chiếu nét cổ kính của các ngôi chùa Nhật. Bên cạnh đó là những lễ hội truyền thống mang đậm màu sắc văn hóa Nhật diễn ra trên khắp đất nước mặt trời mọc. 
',N'Quý khách tập trung tại điểm đón trung tâm thành phố','01:30','08-30-2019','09-04-2019',N'5 ngày 4 đêm',
N'<br/><b>NGÀY 1 | HÀ NỘI -  TOKYO( NARITA)    -/-/-</b><br/><br/>
<br/>21h00: Quý khách tập trung tại điểm đón trung tâm thành phố. Xe và HDV của Du lịch Việt đưa đoàn ra sân bay Nội Bài, làm thủ tục check in, đáp chuyến bay đi Nhật Bản trên chuyến bay VJ. 932 00:50- 08:00. Quý khách xuống sân bay Narita-  thành phố Tokyo (Nhật Bản). 
<br/><br/><b>NGÀY 2 | TOKYO - ĐÔ THỊ SẦM UẤT BẬC NHẤT NHẬT BẢN    Máy bay/Trưa/Tối</b><br/><br/>
<br/><b>Sáng:</b> Sau khi làm thủ tục nhập cảnh, Xe và HDV đưa quý khách bắt đầu chuyến thăm quan:  
<br/>Đoàn di chuyển tới tham quan Chùa Asakusa Sensoji – được xây dựng từ năm 628, thờ phụng Phật Bà Quan Âm. Chùa được biết đến như là ngôi chùa Phật giáo cổ nhất và được viếng thăm nhiều nhất ở thủ đô Tokyo vì sự linh thiêng và mang đến nhiều may mắn cho những nguyện vọng về sức khỏe, tình yêu, học tập, sự nghiệp.
<br/>Thăm quan chụp hình bên ngoài Tháp Tokyo Sky Tree - Tokyo Sky Tree là tháp truyền hình cao nhất thế giới nằm ở Sumida-ku, Tokyo với chiều cao 634m. Có thiết kế đài quan sát Tokyo Sky Tree Tembo Deck cao 350m so với mặt đất và Tokyo Sky Tree Tembo Kairo ở độ cao 450m.
<br/>Chụp hình bên ngoài cung điện Hoàng gia Nhật Bản 
<br/>Sau đó đoàn thỏa sức mua sắm các mặt hàng đồ điện tử, đồ gia dụng, mỹ phẩm Made in Japan tại trung tâm mua sắm Ginza sầm uất với hàng ngàn mặt hàng mỹ phẩm thời trang.
<br/>Nghỉ đêm tại khách sạn Tokyo Bay Apa Makuhari Hotel (4 sao) hoặc tương đương.
<br/><br/><b>NGÀY 3 | YAMANASHI - MT. FUJI    Ăn Sáng/Trưa/Tối</b><br/><br/>
<br/>Sáng: Sau bữa sáng, trả phòng khách sạn. Di chuyển đến Yamanashi. 
<br/>Tham quan Núi Phú Sĩ - Xe sẽ đưa quý khách lên núi đến trạm thứ 5 (Cao 2.300m) nếu thời tiết cho phép, trong trường hợp thời tiết xấu sẽ tham quan và chụp hình dưới chân núi hoặc trung tâm thông tin núi. Phú Sĩ - Một trong những biểu tượng nổi tiếng nhất Nhật Bản, Phú Sĩ là ngọn núi cao nhất và là một trong “Ba núi Thánh” của quốc gia.
<br/>Ăn trưa tại nhà hàng địa phương, đoàn tiếp tục tham quan: 
<br/>Trải nghiệm nét văn hóa ẩm thực đặc sắc nhất của Nhật Bản- Trà đạo 
<br/>Quý khách sẽ được trải nghiệm tàu cao tốc Shinkanshen, có thể chạy với vận tốc lên đến 320km/giờ, niềm tự hào của người dân Nhật Bản (Hamatasu Station=> Toyohashi Station about 10 phút) Di chuyển về Toyohashi. 
<br/>Nghỉ đêm tại khách sạn Losir Toyohashi 4 sao hoặc tương đương.
<br/><br/><b>NGÀY 4 | NAGOYA- KYOTO    Ăn Sáng/Trưa/Tối</b><br/><br/>
<br/>Sáng: Quý khách ăn sáng tại khách sạn  
<br/>Đoàn tới thăm Chùa Kim Các Tự Kinkaku-ji, nơi được biết tới như là một trong những biểu tượng du lịch nổi tiếng của Kyoto, với hai tầng gác được dát lá vàng óng ánh tinh xảo, nổi bật giữa khuôn viên thanh tịnh thay đổi theo bốn mùa.
<br/>Đoàn di chuyển về thành phố Osaka. 
<br/>Thăm quan chụp ảnh lưu niệm bên ngoài Lâu đài Osaka đồ sộ, uy nghi – nằm trong khu thành cổ nổi tiếng bậc nhất Nhật Bản với những chi tiết mạ vàng và màu ngói xanh ngọc. 
<br/>Đoàn tự do khám phá nét văn hóa ẩm thực sống động đặc trưng của vùng Kansai và tự do mua sắm tại khu phố mua sắm đi bộ Shinsaibashi - sôi động bậc nhất Osaka.
<br/>Nghỉ đêm tại khách sạn Kansai Airport Washington Hotel Plaza (3 sao) hoặc tương đương. 
<br/><br/><b>NGÀY 5 | KYOTO- HA NOI     Ăn Sáng/ _ /_</b><br/><br/>
<br/>Đoàn ăn sáng, làm thủ tục trả phòng khách sạn 
<br/>Di chuyển ra sân bay Kansai Airport, làm thủ tục đáp chuyến bay. trở về Việt Nam trên chuyến bay VJ 939 09:25-13:06 
<br/>Quý khách di chuyển trờ lại điểm hẹn ban đầu. Chia tay và hẹn gặp lại đoàn trong những chuyến đi tiếp theo. 
',N'<b>GIÁ TOUR BAO GỒM: </b>
<br/><br/>Khách sạn tiêu chuẩn 3-4 sao địa phương (2 người/ phòng), bố trí phòng 3 khi cần thiết. 
<br/>Các bữa ăn uống theo chương trình.
<br/>Vé máy bay khứ hồi của hãng hang không VJ 
<br/>Giá đã bao gồm 7kg hành lý xách tay và 20 hành lý kí gửi.
<br/>Xe đưa đón sân bay.
<br/>Xe đưa đón thăm quan theo chương trình.
<br/>Vé thắng cảnh, phí thăm quan các điểm trong chương trình
<br/>Trưởng đoàn du lịch từ Việt Nam, hướng dẫn viên Tiếng Việt nhiệt tình suốt tuyến.
<br/>Lệ phí visa nhập cảnh Nhật Bản
<br/>Bảo hiểm Du Lịch (210.000.000VNĐ/ trường hợp). Không áp dụng cho khách từ 75 tuổi trở lên.
<br/>Quà tặng: mũ, vỏ hộ chiếu Du Lịch Việt.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b><br/><br/>
<br/>Hộ chiếu còn hiệu lực 6 tháng tính đến ngày về ( yêu cầu  có chữ kí trong hộ chiếu).
<br/>Phí hành lý quá cước và các chi phí cá nhân khác.
<br/>Visa tái nhập Việt Nam cho người quốc tịch nước ngoài 
<br/>Tiền bồi dưỡng cho lái xe và hướng dẫn địa phương 7USD/ngày/khách.
<br/>Chi phí cá nhân, đồ uống
<br/>Các chi phí phát sinh ngoài mục bao gồm.','~/Images/HinhAnhTour/TourChauA/tourCA1.jpg',40,5,25990000,240000000,'VNĐ',1);
INSERT INTO Tour VALUES(029,4,N'Du lịch Nhật Bản mùa Thu 2019 - Tokyo - Yamanashi - Fuji - Nagoya - Kyoto từ Hà Nội',
N'Du lịch Nhật Bản vào mùa thu, du khách chiêm ngưỡng xứ sở Phù Tang với vẻ đẹp của "thiên đường trong mơ", thiên nhiên nhẹ nhàng khoát lên mình những cảnh sắc kì vĩ và thơ mộng như cổ tích, lá phong vàng rơi rơi trong gió, những tia nắng mặt trời lúc hoàng hôn le lói phản chiếu nét cổ kính của các ngôi chùa Nhật. Bên cạnh đó là những lễ hội truyền thống mang đậm màu sắc văn hóa Nhật diễn ra trên khắp đất nước mặt trời mọc. 
',N'uý khách tập trung tại điểm đón trung tâm thành phố','06:20','09-18-2019','09-22-2019',N'5 ngày 5 đêm',
N'<br/><b>NGÀY 1 | HÀ NỘI -  TOKYO( NARITA)    -/-/-</b><br/><br/>
<br/>21h00: Quý khách tập trung tại điểm đón trung tâm thành phố. Xe và HDV của Du lịch Việt đưa đoàn ra sân bay Nội Bài, làm thủ tục check in, đáp chuyến bay đi Nhật Bản trên chuyến bay VJ. 932 00:50- 08:00. Quý khách xuống sân bay Narita-  thành phố Tokyo (Nhật Bản). 
<br/><br/><b>NGÀY 2 | TOKYO - ĐÔ THỊ SẦM UẤT BẬC NHẤT NHẬT BẢN    Máy bay/Trưa/Tối</b><br/><br/>
<br/><b>Sáng:</b> Sau khi làm thủ tục nhập cảnh, Xe và HDV đưa quý khách bắt đầu chuyến thăm quan:  
<br/>Đoàn di chuyển tới tham quan Chùa Asakusa Sensoji – được xây dựng từ năm 628, thờ phụng Phật Bà Quan Âm. Chùa được biết đến như là ngôi chùa Phật giáo cổ nhất và được viếng thăm nhiều nhất ở thủ đô Tokyo vì sự linh thiêng và mang đến nhiều may mắn cho những nguyện vọng về sức khỏe, tình yêu, học tập, sự nghiệp.
<br/>Thăm quan chụp hình bên ngoài Tháp Tokyo Sky Tree - Tokyo Sky Tree là tháp truyền hình cao nhất thế giới nằm ở Sumida-ku, Tokyo với chiều cao 634m. Có thiết kế đài quan sát Tokyo Sky Tree Tembo Deck cao 350m so với mặt đất và Tokyo Sky Tree Tembo Kairo ở độ cao 450m.
<br/>Chụp hình bên ngoài cung điện Hoàng gia Nhật Bản 
<br/>Sau đó đoàn thỏa sức mua sắm các mặt hàng đồ điện tử, đồ gia dụng, mỹ phẩm Made in Japan tại trung tâm mua sắm Ginza sầm uất với hàng ngàn mặt hàng mỹ phẩm thời trang.
<br/>Nghỉ đêm tại khách sạn Tokyo Bay Apa Makuhari Hotel (4 sao) hoặc tương đương.
<br/><br/><b>NGÀY 3 | YAMANASHI - MT. FUJI    Ăn Sáng/Trưa/Tối</b><br/><br/>
<br/>Sáng: Sau bữa sáng, trả phòng khách sạn. Di chuyển đến Yamanashi. 
<br/>Tham quan Núi Phú Sĩ - Xe sẽ đưa quý khách lên núi đến trạm thứ 5 (Cao 2.300m) nếu thời tiết cho phép, trong trường hợp thời tiết xấu sẽ tham quan và chụp hình dưới chân núi hoặc trung tâm thông tin núi. Phú Sĩ - Một trong những biểu tượng nổi tiếng nhất Nhật Bản, Phú Sĩ là ngọn núi cao nhất và là một trong “Ba núi Thánh” của quốc gia.
<br/>Ăn trưa tại nhà hàng địa phương, đoàn tiếp tục tham quan: 
<br/>Trải nghiệm nét văn hóa ẩm thực đặc sắc nhất của Nhật Bản- Trà đạo 
<br/>Quý khách sẽ được trải nghiệm tàu cao tốc Shinkanshen, có thể chạy với vận tốc lên đến 320km/giờ, niềm tự hào của người dân Nhật Bản (Hamatasu Station=> Toyohashi Station about 10 phút) Di chuyển về Toyohashi. 
<br/>Nghỉ đêm tại khách sạn Losir Toyohashi 4 sao hoặc tương đương.
<br/><br/><b>NGÀY 4 | NAGOYA- KYOTO    Ăn Sáng/Trưa/Tối</b><br/><br/>
<br/>Sáng: Quý khách ăn sáng tại khách sạn  
<br/>Đoàn tới thăm Chùa Kim Các Tự Kinkaku-ji, nơi được biết tới như là một trong những biểu tượng du lịch nổi tiếng của Kyoto, với hai tầng gác được dát lá vàng óng ánh tinh xảo, nổi bật giữa khuôn viên thanh tịnh thay đổi theo bốn mùa.
<br/>Đoàn di chuyển về thành phố Osaka. 
<br/>Thăm quan chụp ảnh lưu niệm bên ngoài Lâu đài Osaka đồ sộ, uy nghi – nằm trong khu thành cổ nổi tiếng bậc nhất Nhật Bản với những chi tiết mạ vàng và màu ngói xanh ngọc. 
<br/>Đoàn tự do khám phá nét văn hóa ẩm thực sống động đặc trưng của vùng Kansai và tự do mua sắm tại khu phố mua sắm đi bộ Shinsaibashi - sôi động bậc nhất Osaka.
<br/>Nghỉ đêm tại khách sạn Kansai Airport Washington Hotel Plaza (3 sao) hoặc tương đương. 
<br/><br/><b>NGÀY 5 | KYOTO- HA NOI     Ăn Sáng/ _ /_</b><br/><br/>
<br/>Đoàn ăn sáng, làm thủ tục trả phòng khách sạn 
<br/>Di chuyển ra sân bay Kansai Airport, làm thủ tục đáp chuyến bay. trở về Việt Nam trên chuyến bay VJ 939 09:25-13:06 
<br/>Quý khách di chuyển trờ lại điểm hẹn ban đầu. Chia tay và hẹn gặp lại đoàn trong những chuyến đi tiếp theo. 
',N'<b>GIÁ TOUR BAO GỒM: </b>
<br/><br/>Khách sạn tiêu chuẩn 3-4 sao địa phương (2 người/ phòng), bố trí phòng 3 khi cần thiết. 
<br/>Các bữa ăn uống theo chương trình.
<br/>Vé máy bay khứ hồi của hãng hang không VJ 
<br/>Giá đã bao gồm 7kg hành lý xách tay và 20 hành lý kí gửi.
<br/>Xe đưa đón sân bay.
<br/>Xe đưa đón thăm quan theo chương trình.
<br/>Vé thắng cảnh, phí thăm quan các điểm trong chương trình
<br/>Trưởng đoàn du lịch từ Việt Nam, hướng dẫn viên Tiếng Việt nhiệt tình suốt tuyến.
<br/>Lệ phí visa nhập cảnh Nhật Bản
<br/>Bảo hiểm Du Lịch (210.000.000VNĐ/ trường hợp). Không áp dụng cho khách từ 75 tuổi trở lên.
<br/>Quà tặng: mũ, vỏ hộ chiếu Du Lịch Việt.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b><br/><br/>
<br/>Hộ chiếu còn hiệu lực 6 tháng tính đến ngày về ( yêu cầu  có chữ kí trong hộ chiếu).
<br/>Phí hành lý quá cước và các chi phí cá nhân khác.
<br/>Visa tái nhập Việt Nam cho người quốc tịch nước ngoài 
<br/>Tiền bồi dưỡng cho lái xe và hướng dẫn địa phương 7USD/ngày/khách.
<br/>Chi phí cá nhân, đồ uống
<br/>Các chi phí phát sinh ngoài mục bao gồm.','~/Images/HinhAnhTour/TourChauA/tourCA1.jpg',35,15,35990000,340000000,'VNĐ',1);
INSERT INTO Tour VALUES(030,4,N'Tour du lịch Hàn Quốc',
N'<b>Hành trình: SEOUL - EVERLAND - ĐẢO NAMI</b>
<br/><b>Số ngày:</b> 5 ngày 4 đêm
<br/><b>Khởi hành:</b> 31/8/2019
<br/><b>Vận chuyển:</b> Hãng hàng không Vietjet Air 
<br/>Du lịch Hàn Quốc dịp lễ 2/9. Mùa Thu Hàn Quốc khoác lên mình vẻ đẹp lộng lẫy và quyến rũ, thời tiết dễ chịu. Khung cảnh mùa Thu Hàn Quốc như bức tranh vẽ tràn ngập sắc vàng của những tán lá hạnh nhân, thi thoảng được điểm xuyến bởi màu đỏ rực của lá phong. Tản bộ dưới hàng cây rẻ quạt vàng rực rỡ, ngắm đồng cỏ màu bạc lóa mắt hay diện Hanbok "sống ảo" cùng bạn bè khi tới Hàn Quốc vào thu là những trải nghiệm thú vị chờ bạn khám phá.
',N'Quý khách tập trung tại điểm hẹn','22:00','08-31-2019','09-04-2019',N'5 ngày 4 đêm',
N'<br/><b>NGÀY 1 | HÀ NỘI - SEOUL  </b><br/><br/>
<br/>22h00: Quý khách tập trung tại điểm hẹn, xe đưa ra sân bay Nội Bài làm thủ tục đáp chuyến bay VJ962 (23:15 – 5:25 ) khởi hành đi Seoul – thủ đô Hàn Quốc. Quý khách nghỉ đêm trên máy bay.
<br/><br/><b>NGÀY 2 | SEOUL   ( Ăn sáng/trưa/tối )</b><br/><br/>
<br/>Đến sân bay Incheon, xe và HDV địa phương đón Đoàn về nhà hàng ăn sáng với món mỳ Udong Hàn Quốc. Sau đó bắt đầu hành trình tham quan thành phố Seoul: 
<br/>Cung điện Hoàng gia Gyeongbok: cung điện ánh sáng và hạnh phúc của vương triều Chosun (1392 – 1910), một công trình nghệ thuật nổi tiếng có phong cách và kiến trúc độc đáo với hơn 7225 gian. Quý khách tham quan Điện Cần Chính, Lầu Khánh Hội, Quảng Hòa Môn, Điện Khang Ninh…và trải nghiệm các hoạt cảnh cung đình xứ Hàn xưa.
<br/>Nhà Xanh – Phủ Tổng Thống: nơi ở và làm việc chính thức của Tổng Thống Hàn Quốc.
<br/>Bảo tàng dân gian quốc gia: nơi lưu giữ hơn 4.000 hiện vật lịch sử và tái hiện hầu hết các đặc điểm văn hóa, tín ngưỡng trong đời sống hàng ngày của người dân Hàn Quốc. 
<br/>Tham gia lớp học làm kim chi và trải nghiệm mặc Hanbok – trang phục truyền thống của người Hàn Quốc.
<br/>Tháp Namsan - biểu tượng của thủ đô Seoul, hay còn gọi là Tháp Tình Yêu, địa điểm du lịch lý tưởng của giới trẻ, đặc biệt là các cặp tình nhân đến đây để ghi lại dấu ấn cùng những ước nguyện, thề nguyền tình yêu vĩnh cửu bằng các ổ khóa sắc màu (tự túc chi phí nếu quý khách có nhu cầu lên tháp)
<br/>Ăn tối tại nhà hàng và nghỉ đêm tại khách sạn.
<br/><br/><b>NGÀY 3 | SEOUL – CÔNG VIÊN EVERLAND     (Ăn sáng/trưa/tối)</b><br/><br/>
<br/>Sáng: Sau bữa sáng, đoàn khởi hành đi Công viên Everland – công viên vui chơi đầu tiên và lớn nhất Hàn Quốc và là 1 trong 10 công viên giải trí thu hút nhất thế giới. Quý khách thỏa sức khám phá 5 khu vui chơi: Chợ toàn cầu, khu phiêu lưu mạo hiểm kiểu Mỹ, vùng đất huyền thoại, khu phiêu lưu mạo hiểm kiểu Châu Âu, vườn bách thú. Mỗi khu vui chơi sẽ tạo cho Quý khách những ấn tượng khác nhau. Đặc biệt, quý khách dạo chơi, chụp ảnh trong vườn hoa rực rỡ sắc màu, xem lễ diễu hành, chơi trò chơi cảm giác mạnh…
<br/>Chiều: Quay về Seoul, đoàn tham quan và mua sắm tại cửa hàng sâm, cửa hàng mỹ phẩm.
<br/>Ăn tối tại nhà hàng, sau đó Quý khách thưởng thức show diễn Nanta show, show biểu diễn không lời với những tiết tấu cuồng nhiệt để kịch hóa bộ gõ truyền thống của Hàn Quốc trong một chương trình sân khấu hài đầy ấn tượng. Đặc biệt, bữa tiệc âm nhạc được những vị đầu bếp trổ tài "nấu nướng" bằng bất cứ thứ gì phát ra âm thanh, từ xoong, nồi, chảo, đĩa, dao, thớt, chai nước, thậm chí đến cả chổi cũng trở thành đạo cụ của bộ gõ. Được kết hợp giữa nhịp điệu truyền thống độc đáo của Hàn Quốc với phong cách biểu diễn phương Tây, Nanta biến sân khấu trở thành một nhà bếp khổng lồ khiến khán giả hết sức thích thú. Ăn tối tại nhà hàng. Nghỉ đêm tại khách sạn
<br/><br/><b>NGÀY 4 | SEOUL – ĐẢO NAMI   (Ăn: Sáng, Trưa, Chiều)</b><br/><br/>
<br/><b>Sáng:</b>  Ăn sáng tại khách sạn, 
<br/>Sau đó đoàn khởi hành đi Đảo Nami – hòn đảo xinh đẹp và nổi tiếng  với những hàng cây chuyển màu theo mùa, nơi quay bộ phim truyền hình nổi tiếng “Bản tình ca mùa đông”. Quý khách tự do vui chơi, khám phá hòn đảo xinh đẹp trên những chiếc xe đạp đôi dưới hàng cây ngân hạnh xanh mướt vào mùa hè, vàng rực rỡ vào mùa thu, tận hưởng khí hậu mát mẻ trong lành.
<br/><b>Chiều:</b> Quay về Seoul, quý khách mua sắm tại cửa hàng tinh dầu thông đỏ, cửa hàng miễn thuế. Sau đó tham quan quảng trường Gwanghwamun - quảng trường lớn nhất, đẹp nhất của thủ đô Seoul và dạo chơi, chụp ảnh tại suối Cheonggye – dòng suối nhân tạo nằm ngay giữa trung tâm thủ đô, là điểm đến tập trung, thu hút của giới trẻ Hàn Quốc.
<br/>Ăn tối tại nhà hàng. Nghỉ đêm tại khách sạn.
<br/><br/><b>NGÀY 5 | SEOUL – HÀ NỘI        (Ăn sáng)</b><br/><br/>
<br/>Sau khi ăn sáng, quý khách làm thủ tục trả phòng khách sạn. 
<br/>Sau đó, đoàn khởi hành ra sân bay Incheon đáp chuyến bay VJ961 (11:05 – 13:35).Đến sân bay Nội Bài,xe đón trở về trung tâm thành phố.Chia tay và hẹn gặp lại Quý khách!',
N'<br/><b>GIÁ TOUR BAO GỒM:</b><br/>
<br/>Vé máy bay khứ hồi theo chương trình tour. (Bao gồm 7kg hành lý xách tay và 20kg hành lý kí gửi)
<br/>Visa nhập cảnh Hàn Quốc
<br/>Thuế hàng không gồm: thuế phi trường 2 nước, phí an ninh, phụ thu phí xăng dầu, bảo hiểm hàng không…
<br/>Khách sạn tiêu chuẩn 3* như chương trình (02 Người lớn/1 Phòng đôi). Bố trí phòng ba khi cần thiết. Phương tiện vận chuyển theo chương trình.
<br/>Các bữa ăn theo chương trình
<br/>Hướng dẫn viên nhiệt tình,kinh nghiệm theo chương trình.
<br/>Vé thăm quan vào cửa các theo chương trình. 
<br/>Bảo hiểm Du Lịch (210.000.000VNĐ/ trường hợp). Không áp dụng cho khách từ 85 tuổi trở lên.
<br/>Nước uống theo hành trình, 01 chai nước/ khách/ ngày
<br/>Quà tặng của Du Lịch Việt.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:<br/><br/>
<br/>Chi phí làm hộ chiếu (còn hạn sử dụng trên 6 thángtính tới ngày về).
<br/>Phụ thu tiền land tour đối với khách quốc tịch nước ngoài (bắt buộc): 60usd/khách.
<br/>Visa tái nhập Việt Nam cho người quốc tịch nước ngoài là 35usd/khách/lần (Trừ quốc tịch Mỹ là 190usd/khách/năm). Riêng những nước được miễn visa Việt Nam như: Anh, Pháp, Đức, Tây Ban Nha, Italia, Nhật Bản, Hàn Quốc, Nauy, Phần Lan, Đan Mạch, Thụy Điển, Nga,… để được miễn visa thì các lần nhập cảnh vào Việt Nam phải cách nhau từ 30 ngày trở lên, nếu dưới 30 ngày thì phải làm công văn tái nhập là 115usd/khách/lần.
<br/>Tiền phục vụ, khuân vác, điện thoại, giặt ủi…
<br/>Hành lý quá cước qui định và các chi phí cá nhân phát sinh ngoài chương trình.
<br/>Tiền bồi dưỡng cho hướng dẫn và tài xế địaphương 6usd/người/ngày * 5 ngày = 30 usd','~/Images/HinhAnhTour/TourChauA/tourCA3.jpg',55,10,12490000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(031,4,N'Du lịch Châu Á - Dubai - Abu Dhabi 2019 ',
N'Số ngày: 6 ngày 5 đêm
<br/>Vận chuyển: Hãng hàng không Emirates 5*
<br/>Du lịch Dubai- Abu Dhabai. Dubai kì diệu, ấn tượng bởi kiến trúc vĩ đại, những tòa nhà cao nhất thế giới, trung tâm thương mại sầm uất, khách sạn 7 sao xa hoa và lộng lẫy, hay những trò chơi tốc độ cưỡi Land cruiser trên sa mạc. Bên cạnh đó, những di tích văn hóa Ả Rập vẫn lắng đọng trong các khu chợ Vàng, chợ Gia vị, hay khu phố cổ Bastakiya, pháo đài và viện bảo tàng Dubai. Tất cả mọi hiện vật sẽ làm cho chúng ta mãi khi một lần đặt chân tới đất nước xa hoa và lộng lẫy này. 
<br/>•    Chương trình thăm quan du lịch các tiểu vương quốc trung lập giàu có nhất thế giới
<br/>•    Bay Hàng không Emirates 5*
<br/>•    Tour xe tốc độ cao trên sa mạc và cùng thưởng thức hút shisa
<br/>•    Chương trình múa bụng Belly dance đặc sắc.
<br/>•    Thăm quan tầng 124 trong tòa tháp lớn nhất thế giới Buji Khalifa ngăm toàn cảnh thành phố Dubai từ trên cao
<br/>•    Xem chương trình nhạc nước vô cùng ấn tượng bên tòa tháp lớn nhất thế giới Burj Khalifa.
<br/>•    Tặng café băng.',
N'Xe và HDV đón khách tại điểm hẹn đi sân bay Nội Bài','21:30','09-30-2019','10-05-2019',N'6 ngày 5 đêm',
N'<br/><br/><b>NGÀY 1 | NỘI BÀI - DUBAI (-/-/-)</b><br/><br/>
<br/><b>21h30:</b> Xe và HDV đón khách tại điểm hẹn đi sân bay Nội Bài khởi hành đi Dubai.
<br/>Quý khách nghỉ đêm trên máy bay.
<br/><br/><b>NGÀY 2 | CHÀO MỪNG ĐẾN DUBAI - THỦ ĐÔ ABU DHABI  (Ăn ba bữa)  </b><br/><br/>    
<br/><b>05h30: </b>HDV đón đoàn tại sân bay quốc tế Dubai với nước trái cây và chà là. Xe đưa đoàn đi ăn sáng.
<br/><b>08h30:</b> Đoàn khởi hành đi Abu Dhabi - thủ đô của Tiểu Vương Quốc Ả Rập Thống Nhất – cách Dubai 150km, ghé thăm các điểm tham quan nổi tiếng  
<br/>Tham quan đảo Yas Island – hòn đảo xinh đẹp và hiện đại với Công viên giải trí Ferrari World (đoàn tham quan và chụp hình bên ngoài ), công viên được mô phỏng theo hình dạng của hãng xe đua nổi tiếng Ferrari 
<br/>Tham quan và mua sắm đồ hiệu tại trung tâm thương mại Yas Mall ( nếu thời gian cho phép)
<br/>Tham quan làng di sản Heritage Village 
<br/>Mua sắm tại Chợ Chà Là (Dates Market)

<br/><b>13h00: </b>Đòan trưa tại khách sạn
<br/><b>14h00:</b> Đoàn nhận phòng khách sạn
<br/><b>15h00:</b> Quý khách tham quan  
<br/>Đại Thánh Đường Hồi Giáo Seikh Zayed - một không gian màu trắng lấp lánh của hồ phản chiếu và những chiếc cột được dát với không gian đủ cho 30.000 người cầu nguyện – được lấy cảm hứng từ nhà thờ Hồi giáo Pakistan Badshahi và nhà thờ Hồi giáo Hassan II ở Ma Rốc. 
<br/>Thăm quan và chụp ảnh bên ngoài một trong những khách sạn xa hoa nhất thế giới Emirates Palace.Thưởng thức cà phê và bánh ngọt phủ vàng tại đây (chi phí tự túc) và tận hưởng cảm giác vương giả. 
<br/><b>18h00:</b> Ăn tối tại nhà hàng.
<br/>20h00: Đoàn về khách sạn nghỉ ngơi. Tự do khám khá Abu Dhabi về đêm.
<br/><br/><b>NGÀY 3 | ABU DHABI - DUBAI - SA MẠC SAFARI (Ăn ba bữa)</b><br/><br/>
<br/>07h00: Ăn sáng tại khách sạn. Đoàn trả phòng 
<br/>09h00: Trở về Dubai 
<br/>10h30: Tham quam và chụp ảnh tại khu phố Marina Walk  
<br/>Tham quan trung tâm thương mại truyền thống Hamadan Galery, nơi trưng bày và bán các sản phẩm thủ công mỹ nghệ tinh xảo và độc đáo đặc trưng cho nền văn hoá Ả Rập.
<br/>13h00: Ăn trưa tại nhà hàng
<br/>14h00: Đoàn về khách sạn, nhận phòng và nghỉ ngơi
<br/>15h30: Xe chuyên dụng Land Cruiser đón đoàn tại khách sạn, bắt đầu khám phá sa mạc đặc sắc nhất Dubai :  
<br/>Tận hưởng cảm giác mạnh đua xe Land Cruiser chinh phục cồn cát
<br/>Ghi lại cảnh hoàng hôn sa mạc rực rỡ khó quên 
<br/>Trải nghiệm những thú vui của người bản địa: cưỡi lạc đà, hút shisha, vé henna, khoác lên mình bộ trang phục truyền thống…
<br/>Đắm mình trong âm nhạc và vũ điệu Ả Rập với các vũ công nhiệt tình, điêu luyện và thưởng thức múa bụng Belly Dance trong đêm sa mạc huyền bí
<br/>Thưởng thức đồ ăn buffet Ả Rập phục vụ theo kiểu thổ dân cùng trà, nước ngọt (miễn phí) và đồ uống có cồn (không bao gồm)
<br/>20h30: Đoàn trở về khách sạn. Ngủ đêm tại Dubai. Tự do khám phá Dubai về đêm.
<br/><br/><b>NGÀY 4 | CITY TOUR DUBAI - EMIRATES MALL - SKI DUBAI (Ăn ba bữa)</b><br/><br/>
<br/>07h00: Ăn sáng tại khách sạn.
<br/>09h00: Đoàn tham quan thành phố Dubai với những kiến trúc cổ  
<br/>Bảo tàng Dubai 
<br/>Khu phố cổ Bastakyah
<br/>Qua kênh Dubau bằng thuyền gỗ truyền thống 
<br/>Thăm chợ gia vị (Spice Souk) và chợ vàng (Gold Souk)

<br/>13h00: Đoàn ăn trưa tại nhà hàng địa phương. 
<br/>16h00: Tham quan một trong những trung tâm thương mại lớn nhất của UAE – Mall of the Emirates và chụp ảnh bên ngoài Công viên tuyết trong nhà lớn nhất thế giới Ski Dubai, tham gia các trò chơi trong công viên tuyết (không bao gồm vé) và thoả sức mua sắm với hàng ngàn thương hiệu nổi tiếng thế giới
<br/>18h00: Ăn tối tại nhà hàng. 
<br/>19h30: Đoàn trở về khách sạn nghỉ ngơi. Tự do khám khá Dubai về đêm.
<br/><br/><b>NGÀY 5 | CITY TOUR DUBAI – DUBAI MALL - BURJ KHALIFA (Ăn ba bữa)</b><br/><br/>
<br/>07h00: Ăn sáng tại khách sạn.
<br/>09h00: Đoàn tham quan thành phố Dubai với những kiến trúc hiện đại, biểu tượng của Dubai giàu có: 
<br/>Chụp ảnh bên ngoài khách sạn 7* hình cánh buồm Burj Al Arab bên bãi biển Jumeriah với nắng vàng và cát trắng.
<br/>Thăm quan đảo cọ Palm Jumerial, ngắm nhìn toàn cảnh từ tàu điện trên cao monorail.
<br/>Chụp ảnh bên ngoài khách sạn Atlantic xinh đẹp như cổ tích.

<br/>13h00: Đoàn ăn trưa tại nhà hàng địa phương, sau đó về trả phòng khách sạn.
<br/>14h00: Thăm quan và xem biểu diễn thời trang tại Trung Tâm Đồ Da 
<br/>15h00: Thăm quan trung tâm thương mại lớn nhất Dubai - Dubai Mall với những kỷ lục thế giới: tham quan thuỷ cung lớn nhất thế giới với hệ thuỷ sinh vật phong phú (không bao gồm vé), ngắm nhìn thành phố từ đài quan sát tại tầng 124 của toà tháp cao nhất thế giới Burj Khalifa(không bao gồm vé).
<br/>18h00: Đoàn chiêm ngưỡng màn trình diễn nhạc nước hoành tráng tại chân tháp Burj Khakifa.
<br/>20h00: Đoàn ăn tối tại nhà hàng.
<br/>23h30: Xe đưa đoàn ra sân bay đón chuyến bay trở về Việt Nam.
<br/><br/><b>NGÀY 6 | DUBAI - HÀ NỘI (-/-/-)</b><br/><br/>
<br/>03h30: Quý khách lên máy bay về Hà Nội.
<br/>13h15: Xe đưa quý khách về điểm hẹn ban đầu. <br/>Kết thúc hành trình tốt đẹp.',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA4.jpg',25,10,24900000,20000000,'VNĐ',1);
INSERT INTO Tour VALUES(032,4,N'Tour du lịch Đài Loan dịp lễ 2/9 - Đài Bắc - Đài Trung - Cao Hùng',
N'<b>Hành trình: </b>Hà Nội - Đài Bắc - Đài Trung - Cao Hùng - Hà Nội
<b>Số ngày:</b> 5 ngày 4 đêm
<b>Khởi hành:</b> 30/8/2019
<b>Vận chuyển:</b> Vé máy bay khứ hồi và xe du lịch đời mới 
<br/>Du lịch Đài Loan 5 ngày 4 đêm giá rẻ- Đài Loan được mệnh danh là hòn đảo du lịch xinh đẹp của châu Á, và đang là điểm đến hot được hàng ngàn du khách chọn lựa. Sự kết hợp giữa nét đẹp trẻ trung, hiện đại với nền văn hóa truyền thống của người Hoa đã mang đến sức hút du lịch mạnh mẽ cho hòn đảo này. Đến với tour du lịch Đài Loan mùa thu, du khách sẽ được trải nghiệm tắm khoáng nóng lưu huỳnh, ăn lẩu shabu shabu, cùng với trải nghiệm tàu điện ngầm cao cấp tại Đài Loan. Cùng thưởng ngoạn vẻ đẹp hồ Nhật Nguyệt, tham gia thả đèn lồng tại làng cổ Thập Phần và mua săm tại các chợ đêm sầm uất trước khi đặt chân lên đỉnh tòa tháp Taipei 101 cao thứ 2 thế giới, ngắm nhìn  toàn cảnh Đài Bắc thơ mộng.
',N'Xe và Hướng dẫn viên công ty Du lịch Việt đón Quý khách tại điểm hẹn khởi hành','07:15','11-21-2019','11-25-2019',N'5 ngày 4 đêm',
N'<br/><br/><b>NGÀY 1 | HÀ NỘI – ĐÀI BẮC (Ăn trưa, tối)</b><br/><br/>
<br/><b>Sáng:</b>  Xe và Hướng dẫn viên công ty Du lịch Việt đón Quý khách tại điểm hẹn khởi hành ra sân bay quốc tế Nội Bài làm thủ tục đáp chuyến bay VJ940 (07.15 – 11.10) đi Đài Bắc - thủ phủ của Đài Loan. Đến sân bay Đào Viên, xe và HDV địa phương đón
<br/>Đoàn về nhà hàng ăn trưa, nghỉ ngơi.
<br/><b>Chiều:</b> Quý khách tham quan công viên Địa Chất Dạ Liễu – một trong những công viên thiên nhiên đẹp nhất vùng Bắc Đài Loan. Dạ Liễu nổi tiếng bởi những khối đá được gió và nước biển bào mòn thành những hình thù kì lạ và được so sánh với những hình ảnh kiêu sa như Đầu Nữ Hoàng (Queen’s head), những hình ảnh ngộ nghĩnh như: Trái Tim, Hài Tiên (Fairy’s shoe), Đá Nấm (Mushroom rock), Đá Nến (Candle rock). 
<br/>Ăn tối tại nhà hàng, sau đó về khách sạn JYQ Spa Hotspring Resort hoặc tương đương nghỉ ngơi. Quý khách thư giãn tắm khoáng nóng tại khách sạn.
<br/><br/><b>NGÀY 2 | ĐÀI BẮC (Ăn Sáng, Trưa, Tối)</b><br/><br/>
<br/><b>Sáng:</b>  Đoàn khởi hành đi tham quan: 
 <br/>Phố cổ Thập Phần - một ngôi làng nhỏ ở quận Bình Khê, cách Đài Bắc khoảng 30km - điểm đến thu hút du khách nhờ phong tục thả đèn trời diễn ra hàng năm. Quý khách tham gia thả đèn trời ước nguyện may mắn cho gia đình, người thân (bao gồm 4 khách/đèn trời), thưởng thức ẩm thực Đài Loan hoặc ghé quán thưởng thức ly cà phê hoặc trà và ngắm cảnh yên bình của phố cổ. Mua sắm tại cửa hàng tỳ hưu. Bữa trưa, Quý khách thưởng thức buffet lẩu shabushabu.
<br/><b>Chiều:</b>    Quay về Đài Bắc, đoàn tham quan: 
<br/>Tháp Taipei 101 – biểu tượng và là niềm tự hào của thành phố Đài Bắc, top 10 tòa nhà cao nhất thế giới.
<br/>Đài tưởng niệm Trung Chính - nơi tưởng niệm Tưởng Giới Thạch – vị tổng thống đầu tiên của Đài Loan. Nếu may mắn, quý khách sẽ được xem phiên đổi gác đặc biệt.
<br/>Mua sắm tại cửa hàng bánh dứa – đặc sản của Đài Loan.
<br/>Sau bữa tối, quý khách tham quan và mua sắm tại chợ đêm Sỹ Lâm – một trong những chợ đêm lâu đời nhất, nhộn nhịp nhất tại Đài Bắc. Quý khách thỏa sức mua sắm với hơn 500 gian hàng với đầy đủ các sản phẩm, ẩm thực đặc trưng của Đài Loan.
<br/>Nghỉ đêm tại khách sạn. 
<br/><br/><b>NGÀY 3 | ĐÀI BẮC - ĐÀI TRUNG (Ăn sáng, trưa, tối)</b><br/><br/>
<br/><b>Sáng:</b>  Sau bữa sáng, đoàn khởi hành đi Đài Trung – thành phố lớn thứ 3 của Đài Loan. Trên đường tham quan: 
<br/>Hồ Nhật Nguyệt - hồ nước ngọt lớn nhất và cũng là thắng cảnh hồ nổi tiếng nhất tại Đài Loan. Quý khách dạo thuyền ngắm cảnh, tận hưởng không khí trong lành và cảnh sắc tuyệt đẹp quanh hồ.
<br/>Văn Võ Miếu - nơi thờ Khổng Tử (Văn Miếu) và Quan Công (Võ Miếu), nằm phía bắc hồ Nhật Nguyệt, là một ngôi chùa nổi tiếng linh thiêng của Đài Loan.
<br/>Mua sắm tại cửa hàng linh chi.
<br/><b>Chiều:</b> Về đến Đài Trung, quý khách ăn tối, sau đó khám phá chợ đêm Phùng Giáp.
 
<br/>Nghỉ đêm tại khách sạn.
<br/><br/><b>NGÀY 4 | ĐÀI TRUNG - CAO HÙNG (Ăn sáng, trưa, tối)</b><br/><br/>
<br/><b>Sáng:</b>   Sau bữa sáng, đoàn trải nghiệm văn hóa trà olong của Đài Loan. Sau đó khởi hành đi Cao Hùng – thành phố lớn thứ 2 Đài Loan.
 <br/><b>Chiều:</b>  Tham quan thành phố Cao Hùng. 
<br/>Phật Quang Sơn – kinh đô Phật giáo Đài Nam, quần thể kiến trúc Phật giáo đồ sộ với hơn 20 tòa điện, lầu, hàng ngàn pho tượng Phật dát vàng quý giá, đăc biệt pho tượng Phật bằng đồng cao nhất thế giới 108m sừng sững, nổi bật với nụ cười hiền từ trên nền trời xanh. 
<br/>Sông tình yêu – điểm hẹn hò lãng mạn của giới trẻ Cao Hùng.
<br/>Đầm Liên Trì - biểu tượng của nghệ thuật kiến trúc Đài Loan, nổi tiếng với khung cảnh thiên nhiên lãng mạn.
<br/>Khám phá chợ đêm Lục Hợp, quý khách tự do ăn tối để thỏa sức thưởng thức ẩm thực độc đáo và đa dạng của Đài Loan. Nghỉ đêm tại khách sạn.
<br/><br/><b>NGÀY 5 | CAO HÙNG – HÀ NỘI (Ăn sáng, trưa)</b><br/><br/>
<br/><b>Sáng:</b>  Ăn sáng tại khách sạn, sau đó đoàn tiếp tục tham quan: 
<br/>Ga tàu điện ngầm Formosa - ga tàu hình vòm lớn nhất thế giới, nhiều lần được bình chọn là một trong những ga tàu điện ngầm đẹp nhất toàn cầu. Quý khách trải nghiệm 1 chặng tàu điện ngầm.
<br/>Cửa hàng đá quý.
<br/><b>Chiều:</b> Quý khách thỏa sức mua sắm tại Dream mall – trung tâm thương mại lớn nhất Cao Hùng. Đến giờ, xe đưa Đoàn ra sân bay làm thủ tục đáp chuyến bay VJ947 (19.00 – 20.50) về Hà Nội. Đến sân bay Nội Bài, xe đón Quý khách về điểm đón ban đầu. 
<br/>Chia tay, kết thúc chuyến đi.',
N'<br/><b>GIÁ TOUR BAO GỒM:</b><br/>
<br/>Vé máy bay khứ hồi Hà Nội - Đài Bắc/Cao Hùng – Hà Nội của Vietjet Air có 7kg hành lý xách tay + 20kg hành lý ký gửi
<br/>Thuế sân bay 2 nước, phụ phí xăng dầu và bảo hiểm hàng không.
<br/>Xe vận chuyển theo chương trình: đời mới, máy lạnh, lái xe kinh nghiệm
<br/>01 Hướng dẫn viên suốt tuyến + 01 hướng dẫn viên tại Đài Loan: nói tiếng Việt, nhiệt tình, thân thiện
<br/>Các bữa ăn theo chương trình
<br/>Phí tham quan thắng cảnh theo suốt chương trình vào cửa 01 lần.
<br/>Tặng bữa lẩu Shabu Shabu
<br/>Vé thắng cảnh theo chương trình: Công viên Dạ Liễu, du thuyền Hồ Nhật Nguyệt, tàu điện ngầm, đèn trời (4 người / đèn)
<br/>Khách sạn tiêu chuẩn 3 sao: 2 khách/phòng, vị trí trung tâm, tiện nghi sang trọng; lẻ khách ghép 3; Trẻ em ngủ cùng giường với bố mẹ.
<br/>Nước suối: 02 chai/khách/ngày
<br/>Bảo hiểm du lịch mức bồi thường tối đa 10.000 USD/khách/trường hợp đối với khách hàng dưới 70 tuổi, mức 5.000 USD/trường hợp đối với khách hàng trên 70 tuổi.
<br/>Quà tặng: Mũ du lịch, vỏ hộ chiếu DLV
<br/><br/><b>GIÁ TOUR KHÔNG GỒM:</b><br/><br/>
<br/>Hộ chiếu còn hạn trên 6 tháng.
<br/>Lệ phí visa dán 50$/ khách ( Trong trường hợp quý khách làm visa dán)
<br/>Thuế VAT
<br/>Chi phí cá nhân, giặt là, đồ uống...
<br/>Chi phí ngủ phòng đơn.
<br/>Hành lý quá cước.
<br/>Tiền Tips cho HDV, lái xe bản địa: 5 USD/ khách/ ngày','~/Images/HinhAnhTour/TourChauA/tourCA5.jpg',25,10,12500000,11000000,'VNĐ',1);
/*
INSERT INTO Tour VALUES(033,4,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA5.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(034,4,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA6.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(035,4,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA7.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(036,4,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA8.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(037,4,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA9.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(038,4,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA10.jpg',25,10,130000,1000000,'VNĐ',1);
INSERT INTO Tour VALUES(039,4,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauA/tourCA11.jpg',25,10,130000,1000000,'VNĐ',1);
*/
--CHÂU ÂU
INSERT INTO Tour VALUES(040,5,N'Du lịch Pháp - Luxembourg - Đức - Séc - Áo - Slovakia - Hungary 11 ngày từ Hà Nội 2019',
N'Mùa xuân, mùa hè Châu Âu luôn được coi là mùa đẹp nhất trong năm. Sức hấp dẫn đặc biệt của mùa xuân không chỉ bởi khung cảnh thiên nhiên lãng mạn, bởi sắc xuân bao phủ mọi cảnh vật mà còn bởi tiết trời thu luôn là một trợ thủ đắc lực, giúp du khách có một sức khỏe và tinh thần sảng khoái khi đi du lịch dài ngày. Hành trình hôm nay, Du Lịch Việt xin giới thiệu cung đường Vàng qua 7 nước Châu Âu Thủ đô Paris của Pháp vào mùa xuân trở nên lãng mạng hơn bao giờ hết. Từ Paris xinh đẹp, hướng lên phía bắc, qua đất nước nhỏ bé nhưng không kém phần duyên dáng Luxemburg. Du khách dừng chân tại thành phố Nuremberg sầm uất để rồi  từ đây bắt đầu hành trình khám phá Đông Âu, phần “cựu lục địa” vốn nổi tiếng thế giới về những lâu đài và cung điện cổ xưa. Gác lại hết những ồn ào và  bận rộn của cuộc sống hàng ngày, hòa mình cảm nhận  cảnh thu tuyệt đẹp, vô cùng nên thơ và quyến rũ... dọc theo dòng Danube xanh mướt và dịu dàng uốn lượn, du khách lần lượt ghé thăm thành phố Praha (CH Séc), Budapest (Hungary), Vienne (Áo), Slovakia... để rồi tiến về điểm dừng chân và ha hồ mua sắm tại thành phố Munich của Đức vốn được coi là nơi đáng sống thứ 4 trên thế giới.
',N'
Xe và HDV sẽ đón quý khách tại Nhà Hát Lớn hoặc Công Viên Thống Nhất','07:00','09-27-2019','10-07-2019',N'11 ngày 10 đêm',
N'<b>NGÀY 1 | HÀ NỘI - PARIS (Ăn Trên Máy Bay)<b/><br/>
<br/>Xe và HDV sẽ đón quý khách tại Nhà Hát Lớn hoặc Công Viên Thống Nhất, khởi hành đến sân bay Nội Bài, làm thủ tục đáp chuyến bay đi Paris .Dùng bữa tối và nghỉ đêm trên máy bay.
<br/><br/><b>NGÀY 2 | PARIS -  CITY TOUR    (Ăn trưa, chiều) </b>
<br/>Đến sân bay Quốc Tế Paris, đoàn khởi hành tham quan: 
<br/>Khải Hoàn Môn (Arc De Triomphe) - biểu tượng lịch sử của Pháp. Quảng trường Concorde - một trong 10 quảng trường nổi tiếng nhất thế giới. Đây là nơi tập hợp nhiều di tích lịch sử và công trình kiến trúc nguy nga tráng lệ nhất Paris.
<br/>Tham quan Tháp Eiffel: một công trình kiến trúc bằng thép nằm cạnh sông Seine, được xem là biểu tượng của  nước Pháp, là công trình kỷ niệm 100 năm cách mạng Pháp (lên tầng 2 tham quan).
<br/>Dạo thuyền trên dòng sông Seine* thơ mộng, ngắm nhìn cảnh sắc thành phố Paris hoa lệ.
<br/>Nghỉ đêm tại khách sạn 4* tiêu chuẩn Châu Âu vùng lân cận hoặc tương đương.
<br/><br/><b>NGÀY 3 | PARIS - REIMS – LUXEMBOURG     (Ăn sáng, trưa, tối)</b>
<br/>Quý khách dùng điểm tâm tại khách sạn và trả phòng. Đoàn khởi hành đến khởi hành đến: 
<br/>Thành phố Reims – quê hương của rượu vang lừng danh. Trên đường đi ngắm nhìn những cánh đồng nho xanh mướt dọc theo hai bên đường của Reims.
<br/>Tiếp tục khởi hành đến thành phố xinh đẹp Luxembourg - thủ đô của Đại Công Quốc Luxembourg. Đến nơi đoàn tham quan: Quảng trường D’Arme, chụp hình cung điện Grand Ducal và khu phố cổ - cảm nhận sự yên bình, đa văn hoá của vùng đất nằm giữa biên giới văn hoá Châu Âu gốc Roman và Châu Âu gốc German.
<br/>Nghỉ đêm tại Luxembourge hoặc vùng lân cận.
<br/><br/><b>NGÀY 4 | LUXEMBOURG – TRIER – NUREMBERG (Ăn sáng, trưa, tối)</b> 
<br/>Quý khách dùng điểm tâm tại khách sạn và trả phòng. 
<br/>Đoàn khởi hành đến Trier, thị trấn lâu đời nhất của Đức. Tham quan nhà* và là bảo tàng Karl Marx*.
<br/>Sau đó di chuyển đến Nuremberg. Đến Nuremberg, tham quan thành phố.
<br/>Nhận phòng khách sạn và nghỉ ngơi tại Nuremberg hoặc vùng lân cận.
<br/><br/><b>NGÀY 5 | NUREMBERG – PRAGUE (Ăn sáng, trưa, tối)</b>
 <br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. 
<br/>Khởi hành đi Prague - thủ đô của Cộng hòa Séc và là một trong những thành phố du lịch nổi tiếng nhất ở châu Âu.
<br/>Tham quan: Chợ Sapa – chợ lớn nhất của người Việt tại Prague. Cây cầu đá Charles nổi tiếng: chiếc cầu đá kiểu Gothic nối liền Old Town và Lesser Town, được xây dựng từ năm 1357. Con đường vàng Golden Lane*.
<br/>Nhận phòng khách sạn và nghỉ ngơi tại Prague hoặc vùng lân cận.
<br/>Nhận phòng khách sạn và nghỉ ngơi tại Prague hoặc vùng lân cận.
<br/><br/><b>NGÀY 6 | PRAGUE – BRATISLAVA   (Ăn sáng, trưa, tối)   </b>
<br/>Đoàn dùng bữa sáng tại khách sạn. 
<br/>Khởi hành tham quan Prague: Lên đồi chụp ảnh bên ngoài Lâu đài Prague * (chi phí tự túc) điểm du lịch tiêu biểu nhất của thành phố. Đây là một trong những lâu đài lớn nhất thế giới và cũng là một Di sản thế giới.
<br/>Quảng trường Old Town (Staroměstské Náměstí) với Đồng hồ thiên văn (Astronomical Clock) tọa lạc ở góc phía tây nam của quảng trường.
<br/>Sau đó cả đoàn di chuyển dến Bratislava – thủ đô của Slovakia thăm quan thành phố: Chụp hình bên ngoài Tháp Novy Most, St. Martin’s Cathedral: Thánh đường kiến trúc Gothic được xây dựng từ thế kỷ 14-15. Old Town Hall: Toà thị chính cũ, hiện tại là bảo tàng thành phố Bratislava.
<br/>Nhận phòng khách sạn và nghỉ ngơi tại Bratislava hoặc lân cận.
<br/><br/><b>NGÀY 7 | BRATISLAVA – BUDAPEST (Ăn sáng, trưa, tối)</b>    
  <br/>Đoàn ăn sáng tại khách sạn. 
<br/>Sau đó, xe đón và đưa Quý khách khởi hành đi thủ đô Budapest của Hungary - được mệnh danh là “Viên ngọc của sông Danube” & “Paris của Đông Âu”. Điểm tham quan đầu tiên là chụp hình với Thành ngư phủ* (Fisherman’s Bastion).
<br/>Tham quan bên ngoài Đồi Lâu đài (Castle Hill)* nằm trên cao, nơi có cung điện Hoàng gia. Cầu Xích (cầu Sư Tử) (Chain Bridge) nối hai bờ sông Danube là Buda và Pest.
<br/>Thăm Hero’s Square – quảng trường tưởng niệm những anh hùng dân tộc.
<br/>Nghỉ đêm tại khách sạn ở Budapest hoặc lân cận.
<br/><br/><b>NGÀY 8 | BUDAPEST – VIENNA   (Ăn sáng, trưa, tối)  </b>
 <br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. 
<br/>Đoàn khởi hành đến Vienna, thủ đô của Cộng hòa Áo.
<br/>Đến nơi đoàn dùng cơm trưa tại nhà hàng. 
<br/>Tham quan bên ngoài Cung điện Hofburg* (cung điện mùa đông) – Là một quần thể lâu đài rộng lớn với các tòa nhà có từ hàng trăm năm và là nơi ở của các Hoàng đế Hofburg cho đến năm 1918. Đài tưởng niệm người lính Liên Xô. Nhà thờ kiến trúc Baroque St.Charles Borromeo 
<br/>Quý khách nhận phòng khách sạn nghỉ ngơi hoặc vùng lân cận.
<br/><br/><b>NGÀY 9 | VIENNA – LÀNG HALLSTATT – MUNICH       (Ăn sáng,trưa,tối)  </b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. 
<br/>Đoàn khởi hành đi làng HallStatt – dạo quanh hồ Hallstatt, tản bộ trên những con đường nhỏ  quanh làng, ngắm nhìn mặt hồ tĩnh lặng được bao quanh bởi dãy Alps hùng vĩ, Nhà thờ Giáo xứ Đức Mẹ Thăng thiên tại Hallstatt vẫn luôn giữ được nét đẹp từ thuở xưa
<br/>Tiếp tục hành trình đến Munich - thành phố lớn thứ 3 của nước Đức.
<br/>Quý khách nhận phòng khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 10 | MUNICH - TP.HCM / HÀ NỘI (Ăn sáng) </b>  
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. 
<br/>Tham quan New Town Hall (Neues Rathaus), ngắm nhìn tháp đồng hồ Rathaus – Glockenspiel.
<br/>Sau đó tham quan quảng trường nhà vua Konigsplatz, Cổng Victory. Quý khách tự do tham quan mua sắm cho đến giờ ra sân bay, đáp chuyến bay về TPHCM/Hà Nội. 
<br/><br/><b>NGÀY 11 | TP.HCM / HÀ NỘI</b>
<br/>Kết thúc chuyến tham quan. Chia tay và hẹn gặp lại Quý khách !',
N'<b>GIÁ TOUR BAO GỒM:<b>
<br/><br/>Lệ phí visa schengen, phí thư mời & dịch thuật hồ sơ 
<br/>Vé máy bay chặng quốc tế hàng không 5* Turkish Airlines: Hà Nội - Paris // Munich - Hà Nội. (Tùy theo ngày khởi hành mà Turkish Arilines sẽ dừng kỹ thuật ở TP.HCM)
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Khách sạn 4* sao tiêu chuẩn phòng đôi. Trong trường Quý Khách đi một mình (lẻ nam hoặc lẻ nữ) phòng 3 người (phòng triple) sẽ được bố trí khi cần thiết (lưu ý: người thứ 3 phải ngủ giường phụ gọi là sofa bed. Tuy nhiên khách sạn Châu Âu rất ít có phòng 03 người). Trường hợp không có khách lẻ (khách đi một mình) khác để ghép Quý Khách vui lòng đóng phụ thu phòng đơn. 
<br/>Ăn uống, tham quan theo chương trình.
<br/>Hướng dẫn viên từ Việt Nam (trưởng đoàn) sẽ theo đoàn suốt tuyến (đoàn khởi hành trên 10 khách).
<br/>Xe đưa đón tham quan theo chương trình.
<br/>Nước uống trên xe, 1 chai 0,5lit/khách.
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế v
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn giá trị ít nhất 06 tháng tính đến ngày về Việt Nam.
<br/>Tiền tip cho Hướng Dẫn Viên Việt Nam đi cùng đoàn suốt tuyến và tài xế tại chấu Âu 
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.','~/Images/HinhAnhTour/TourChauAu/tourCAu1.jpg',20,10,68900000,600000000,'VNĐ',1);
INSERT INTO Tour VALUES(041,5,N'Du lịch Châu Âu Pháp - Thụy Sĩ - Ý - Hungary - Slovakia - Áo - Séc mùa Thu từ Hà Nội giá tốt',
N'<b>Hành trình: Paris - Geneva - Chamonix - Milan - Venice - Graz - Budapest - Bratislava - Vienna - Praha</b>
<br/><b>Lịch trình:</b> 11 ngày 10 đêm
<br/><b>Khởi hành: </b>26/10/2019
<br/><b>Vận chuyển: </b>Hãng hàng không 5* Turkish Airlines. 
<br/>Du lịch Châu Âu Mùa Thu đến thăm những thành phố cổ kính và yên bình nhất thế giới. Sắc thu rợp trời, phong cảnh tuyệt vời, mỗi gia đình sẽ có những phút giây hạnh phúc bên nhau dưới khung cảnh mùa thu châu âu. Hãy cùng Du Lịch Việt khám phá những phong cảnh tuyệt đẹp ở châu Âu qua hành trình châu Âu 4 nước Pháp - Thụy Sĩ - Ý –Hungary - Slovakia - Áo - Séc với những điểm nhấn sau: 
<br/>•    Chụp hình dưới tháp Eiffel ngắm nhìn cảnh sắc thành phố Paris hoa lệ. 
<br/>•    Tham quan chiếc ghế gãy bên ngoài trụ sở Liên Hợp Quốc của châu Âu
<br/>•    Ghé thăm kinh đô thời trang nổi tiếng Milan
<br/>•    Khám phá thành phố Venice, thành phố kênh đào, thành phố tình yêu vĩnh hằng.
<br/>•    Ghé thăm Graz một trong những thành phố Trung Cổ lâu đời nhất tại miền Nam nước Áo.
<br/>•    Tham quan cây câu xích ở thành phố Budapest  “Viên ngọc của sông Danube” của Hungary
<br/>•    Cung điện Hofburg ở Vienna, thủ đô của nước Áo nằm bên dòng sông Danube êm đềm
<br/>•    Dạo bước đến Old Town Hall ở Bratislava thủ đô của Slovakia
<br/>•    Đến Praha thủ đô của Cộng hòa Séc chiêm ngăm lâu đài Prague hơn 1000 năm tuổi là tòa lâu đài cổ rộng lớn nhất thế giới.
',N'HDV đón quý khách tại ga Quốc tế, sân bay Nội Bài','08:30','10-26-2019','10-05-2019',N'11 ngày 10 đêm',
N'<b>NGÀY 1 | HÀ NỘI - PARIS (Ăn trên máy bay)</b>
<br/>HDV đón quý khách tại ga Quốc tế, sân bay Nội Bài, làm thủ tục đáp chuyến bay đến thủ đô Paris của nước Pháp.
<br/><br/><b>NGÀY 2 | PARIS - CITY TOUR    (Ăn trưa, chiều)</b>
<br/>Đoàn đến sân bay quốc tế Charles De Gaul,  HDV đưa đoàn thăm quan Paris: 
<br/>Khải Hoàn Môn (Arc De Triomphe) - biểu tượng lịch sử của Pháp. 
<br/>Quảng trường Concorde - một trong 10 quảng trường nổi tiếng nhất thế giới. 
<br/>Chụp hình bên dưới Tháp Eiffel. 
<br/>Dạo thuyền trên dòng sông Seine thơ mộng, ngắm nhìn cảnh sắc thành phố Paris hoa lệ.
<br/>Sau bữa tối quý khách nhận phòng khách sạn nghỉ đêm.
<br/><br/>NGÀY 3 | PARIS - GENEVE (Ăn ba bữa)
<br/>Dùng điểm tâm, xe đón đoàn và đưa đến thành phố Geneve xinh đẹp của Thụy Sỹ. Quý khách dùng bữa trưa trên đường. Chiều đến Geneve, chụp hình bên ngoài  trụ sở Liên Hợp Quốc của châu Âu - chiếc ghế gãy, hội chữ thập đỏ quốc tế. Ngắm nhìn vườn hoa đồng hồ Jardin Anglais. 
 <br/>Nhận phòng và nghỉ đêm tại khách sạn. 
<br/><br/><b>NGÀY 4 | GENEVE - CHAMONIX - MILAN (Ăn ba bữa)</b>
<br/>Đoàn dùng bữa sáng tại khách sạn và trả phòng. Đoàn khởi hành đến kinh đô thời trang Milan, trên đường đi quý khách đi ngang quang Chamonix – thị trấn nhỏ thuộc miền đông nước Pháp. 
<br/>Quý khách dùng bữa trưa trên đường đi. Đến Milan đoàn tham quan và chụp hình tại Nhà thờ lớn nhất Milan – Duomo với kiến trúc bằng đá khối độc đáo, tinh xảo đến từng chi tiết. Trung tâm mua sắm Emmanuel II, khu trung tâm thương mại cổ nhất Châu Âu với rất nhiều các mặt hằng thời trang. 
<br/>Quý khách dùng bữa tối và nhận phòng nghỉ đêm.
<br/>NGÀY 5 | MILAN - VENICE - MESTRE  (Ăn ba bữa)
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Khởi hành khám phá thành phố trên sông Venice: quảng trường San Marco, Cầu Than Thở, xem biểu diễn chế tác thủy tinh ở Murano. Dinh tổng trấn Doge – công trình tráng lệ với nhiều sảnh rộng lớn theo lối kiến trúc Gothic.
<br/>Buổi chiều quý khách trở về Mestre nhận phòng nghỉ ngơi.
<br/><br/><b>NGÀY 6 | MESTRE - GRAZ (Ăn ba bữa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Xe đưa đoàn đến Graz, nơi được mệnh danh là thủ đô Văn hóa của châu Âu. 
 <br/>Sau bữa trưa quý khách tham quan: 
<br/>Khu Phố Cổ Alstadt Von Graz, du khách sẽ có ấn tượng bởi các tòa nhà từ thời Trung cổ mang phong cách Phục Hưng được gìn giữ rất tốt. 
<br/>Quảng trường chính Hauptplatz rộng lớn cùng hai bên là tòa Thị chính Rathaus đã tạo nên một khung cảnh vô cùng tráng lệ. 
<br/>Đồi Schlossberg nằm ở trong khu phố cổ Graz, ngọn đồi lịch sử này là nơi bạn có thể ngắm nhìn toàn cảnh thành phố, và ghé thăm tháp đồng hồ Uhrturm cao 28 mét.
<br/>Quý khách dùng bữa tối và nhận phòng nghỉ ngơi.
<br/>Quý khách dùng bữa tối và nhận phòng nghỉ ngơi.
<br/><br/><b>NGÀY 7 | GRAZ - BUDAPEST   (Ăn ba bữa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Xe đưa đoàn đến thành phố Budapest của Hungary - được mệnh danh là “Viên ngọc của sông Danube” & “Paris của Đông Âu”. Đoàn tham quan: 
<br/>Thành ngư phủ. 
<br/>Tham quan bên ngoài Đồi Lâu đài (Castle Hill) nằm trên cao, nơi có cung điện Hoàng gia. 
<br/>Cầu Xích (cầu Sư Tử) nối hai bờ sông Danube là Buda và Pest. 
<br/>Thăm Hero’s Square – quảng trường tưởng niệm những anh hùng dân tộc. 
<br/>Nghỉ đêm tại khách sạn ở Budapest hoặc lân cận.
<br/><br/><b>NGÀY 8 | BUDAPEST - BRATISLAVA - VIENNA (Ăn ba bữa)</b>
<br/>Đoàn ăn sáng tại khách sạn và trả phòng. Sau đó, xe đưa Quý khách đến Bratislava thủ đô Slovakia. Tại đây du khách tham quan thành phố: 
<br/>Tháp Novy Most (chụp hình bên ngoài).
<br/>St. Martin’s Cathedral: Thánh đường kiến trúc Gothic được xây dựng từ thế kỷ 14-15. 
<br/>Old Town Hall: Toà thị chính cũ, hiện tại là bảo tàng thành phố Bratislava. 
<br/>Buổi chiều quý khách di chuyển về thành phố Vienna nhận phòng nghỉ đêm.
<br/><br/><b>NGÀY 9 | VIENNA - PRAHA  (Ăn ba bữa)</b>
<br/>Đoàn dùng bữa sáng tại khách sạn, trả phòng. Khởi hành đi Vienna - thủ đô của Cộng hòa Áo. 
 <br/>Đến nơi đoàn dùng cơm trưa tại nhà hàng. Sau đó tham quan: 
<br/>Cung điện Hofburg (cung điện mùa đông, chi phí tự túc) là một quần thể lâu đài rộng lớn với các tòa nhà có từ hàng trăm năm và là nơi ở của các Hoàng đế Hofburg cho đến năm 1918.
<br/>Đài tưởng niệm người lính Liên Xô. 
<br/>Nhà thờ kiến trúc Baroque St.Charles Borromeo.
<br/>Buổi chiều quý khách di chuyến đến Praha, thủ đô của Cộng hòa Séc nhận phòng khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 10 | PRAHA - CITY TOUR - HANOI   (Ăn sáng, trưa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. 
<br/>Đoàn tham quan chợ Sapa – chợ lớn nhất của người Việt tại Prague. 
<br/>Cây cầu đá Charles nổi tiếng: chiếc cầu đá kiểu Gothic nối liền Old Town và Lesser Town, được xây dựng từ năm 1357. 
<br/>Con đường vàng Golden Lane (tự túc chi phí). 
<br/>Lên đồi chụp ảnh bên ngoài Lâu đài Prague (tự túc chi phí vào trong lâu đài): điểm du lịch tiêu biểu nhất của thành phố. Đây là một trong những lâu đài lớn nhất thế giới và cũng là một Di sản thế giới. 
<br/>Quảng trường Old Town với Đồng hồ thiên văn tọa lạc ở góc phía tây nam của quảng trường. 
<br/>Quý khách tự do tham quan mua sắm cho đến giờ hẹn, xe đưa đoàn ra sân bay, đáp chuyến bay về Hà Nội.
<br/><br/><b>NGÀY 11 | HÀ NỘI</b>
<br/>Đến Việt Nam - kết thúc chương trình. Hẹn gặp lại Quý Khách.',
N'<br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay chặng quốc tế: HANOI - Paris // Praha - HANOI 
<br/>Hãng hàng không dự kiến 5*: Turkish Airlines. 
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Lệ phí visa Schengen, phí dịch thuật & thư mời
<br/>Khách sạn 4 sao tiêu chuẩn phòng đôi. Trong trường Quý Khách đi một mình (lẻ nam hoặc lẻ nữ) phòng 3 người (phòng triple) sẽ được bố trí khi cần thiết (lưu ý: người thứ 3 phải ngủ giường phụ gọi là sofa bed. Tuy nhiên khách sạn Châu Âu rất ít có phòng 03 người). Trường hợp không có khách lẻ (khách đi một mình) khác để ghép Quý Khách vui lòng đóng phụ thu phòng đơn. 
<br/>Vé tham quan & ăn uống theo chương trình.
<br/>Hướng dẫn viên từ Việt Nam (trưởng đoàn) sẽ theo đoàn suốt tuyến (đoàn khởi hành trên 10 khách).
<br/>Xe đưa đón tham quan theo chương trình.
<br/>Nước uống xe 01 chai 0.5ml/ngày/người. 
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Tiền tips (bồi dưỡng) cho hướng dẫn viên Việt Nam (trưởng đoàn) đi cùng đoàn suốt tuyến và tài xế tại Châu Âu đóng tại Việt Nam.
<br/>Nước uống trên tour.
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Phụ phí phòng đơn.','~/Images/HinhAnhTour/TourChauAu/tourCAu2.jpg',10,5,73990000,70000000,'VNĐ',1);
INSERT INTO Tour VALUES(042,5,N'Tour Châu Âu: Pháp - Luxembourg - Bỉ - Hà Lan 7 ngày giá tốt từ Hà Nội',
N'Châu Âu nổi tiếng với quá trình xây dựng lịch sử văn hóa và kinh tế tương đối lâu đời mang đậm nét Hy Lạp cổ đại. Với bề dày lịch sử các thành phố luôn là điểm thu hút hồn của những du khách muốn tìm hiểu văn hóa và văn minh phương Tây. Nếu như Hà Lan sở hữu những vẻ đẹp giản dị, những ngôi làng nhỏ với vô số chiếc cối xay gió đặc trưng, hay những vườn hoa tulip xinh đẹp thì nước Pháp với thủ đô Paris hoa lệ lại nổi tiếng với những thắng cảnh tuyệt vời như Tháp Eiffel, Sông Seine và hệ thống bảo tàng đồ sộ. Vương quốc Bỉ thật nồng nàn với hương vị của những viên kẹo sô-cô-la ngọt ngào nhất thế giới sẽ làm cho du khách nhớ mãi. Đặc biệt, đây là chương trình tour tham quan lễ hội Keukenhof - Quý Khách không chỉ mãn nhãn bởi sắc hoa rực rỡ, du khách còn được hòa mình vào không khí lễ hội mùa xuân tưng bừng với các chương trình ca nhạc, biểu diễn thời trang, diễu hành xe hoa, hội chợ và được thưởng thức nền ẩm thực Châu Âu phong phú. Vậy mới thấy, Keukenhof không đơn thuần là một điểm ngắm hoa mà còn là một nơi hẹn hò lý tưởng của những tâm hồn yêu hoa, yêu cuộc sống. 
',N'Xe và HDV sẽ đón Quý khách tại Nhà Hát Lớn hoặc Công viên Thống Nhất','08:45','11-25-2019','12-1-2019',N'7 ngày 6 đêm',
N'<b>NGÀY 1 | TP. HCM/HÀ NỘI - PARIS    (Ăn uống trên máy bay)</b>
Xe và HDV sẽ đón Quý khách tại Nhà Hát Lớn hoặc Công viên Thống Nhất, khởi hành đến sân bay Nội Bài, làm thủ tục đáp chuyến bay TK 166 (21:30 04:35) & TK1821 (06:55 09:35) đi Paris. Ăn nhẹ và nghỉ đêm trên máy bay.
<br/><br/><b>NGÀY 2 | PARIS – CITY TOUR       (Ăn trưa, tối)</b>
<br/>Buổi sáng: Đến sân bay Quốc Tế Paris, đoàn khởi hành tham quan: 
<br/>Khải Hoàn Môn (Arc De Triomphe) – biểu tượng lịch sử của Pháp.  Quảng trường Concorde – một trong 10 quảng trường nổi tiếng nhất thế giới. Đây là nơi tập hợp nhiều di tích lịch sử và công trình kiến trúc nguy nga tráng lệ  nhất Paris.
<br/>Buổi trưa: Dùng cơm trưa tại nhà hàng địa phương. 
<br/>Tham quan Tháp Eiffel – biểu tượng của « Kinh đô ánh sáng » Paris. Dạo thuyền trên dòng sông Seine thơ mộng, ngắm nhìn cảnh sắc thành phố Paris hoa lệ.
<br/>Buổi tối: Sau bữa tối, quý khách trở về khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 3 | PARIS – LUXEMBOURG   (Ăn ba bữa)</b>
<br/>Buổi sáng: Quý khách dùng điểm tâm tại khách sạn và trả phòng. 
<br/>Đoàn khởi hành đến thành phố xinh đẹp Luxembourg – thủ đô của Đại Công Quốc Luxembourg.
<br/>Buổi trưa: Đoàn dùng cơm trưa, sau đó đoàn tham quan: 
<br/>Quảng trường D’Arme. Chụp hình cung điện Grand Ducal và khu phố cổ - cảm nhận sự yên bình, đa văn hoá của vùng đất nằm giữa biên giới văn hoá Châu Âu gốc Roman và Châu Âu gốc German.
<br/>Buổi tối: Dùng bữa tối và nhận phòng khách sạn nghỉ đêm tại Luxembourg.
<br/>NGÀY 4 | LUXEMBOURG – BRUSSELS    (Ăn ba bữa)
<br/>Buổi sáng: Quý khách dùng bữa sáng tại khách sạn và trả phòng. Đoàn khởi hành đến Brussels.
<br/>Đến nơi đoàn dùng bữa trưa và tham quan: 
<br/>Quảng trường xinh đẹp La Grand – được Unesco ghi công nhận là Di Sản Văn Hóa của nhận loại & được ca tụng là Quãng trường đẹp nhất thế giới,
<br/>Chụp hình tại Cung Điện Hoàng Gia, Tượng Chú Bé Đứng Tè - Mannenken Pis – biểu tượng của nước Bỉ. Viện nguyên tử Atonium để chụp hình mô hình cấu trúc nguyên tử khổng lồ.
<br/>Buổi tối: Đoàn dùng bữa tối tại nhà hàng. Nhận phòng tại khách sạn nghỉ  ngơi. 
<br/><br/><b>NGÀY 5 | BRUSSELS – AMSTERDAM    (Ăn ba bữa)</b>
<br/>Buổi sáng: Quý khách dùng bữa sáng tại khách sạn và trả phòng. Đoàn khởi hành đi Amsterdam, thủ đô của đất nước Hà Lan.
 <br/>Buổi trưa: Đoàn dùng cơm trưa tại nhà hàng, sau đó tiếp tục tham quan: 
<br/>Làng Zaanse Schans, xưởng sản xuất guốc gỗ truyền thống, thưởng thức phô mai và bơ tại trang trại. Cánh đồng cỏ xanh ngát cùng với những chiếc cối xay gió biểu tượng của đất nước Hà Lan.
<br/>Buổi chiều: Đến nơi đoàn tham quan Quảng trường Dam – Biểu tượng của đất nước Hà Lan. Sau đó đoàn dùng bữa tối và nhận phòng nhận phòng khách sạn nghỉ ngơi hoặc tự do tham quan phố Đèn Đỏ (Red Light) và sòng bài Hà Lan.
<br/><br/><b>NGÀY 6 | AMSTERDAM   Tp.HCM/HÀ NỘI   (Ăn sáng)</b>
<br/>Đoàn dùng điểm tâm tại khách sạn và trả phòng. Quý khách tham quan Xưởng Chế Tác Kim Cương nổi bật của vùng, Du thuyền trên kênh đào Amstel thơ mộng, Showroom Heineken – giới thiệu lịch sử làm bia và quá trình sản xuất bia Heniken (chụp ảnh bên ngoài).
<br/>Đoàn dùng cơm trưa tại nhà hàng.. Đến giờ ra sân bay. Xe và HDV đưa quý khách ra sân bay Quốc tế Amsterdam làm thủ tục đáp chuyến bay TK1954 (1915 – 2345) & TK170 (0215 – 1710) về Việt Nam.
<br/><br/><b>NGÀY 7 | VIỆT NAM</b>
<br/>Đến Việt Nam Trưởng đoàn Du Lịch Việt chia tay Quý khách. Kết thúc chuyến tham quan.',
N'<br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay chặng quốc tế: Tp.HCM/Hà Nội – Paris // Amsterdam – Tp.HCM/ Hà Nội. (Tùy theo ngày khởi hành mà Turkish Arilines sẽ dừng kỹ thuật ở Tp.HCM)
<br/>Hãng hàng không dự kiến 5*: Turkish Airlines hoặc tương đương.
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Khách sạn 3 sao đầy đủ tiện nghi, tiêu chuẩn phòng đôi. Trong trường hợp khách đi 1 mình (lẻ nữ hoặc lẻ nam) thì phòng ba (phòng triple) sẽ được bố trí khi cần thiết. (lưu ý: người thứ 3 trong phòng phải ngủ giường phụ (còn gọi là Sofa bed), đồng thời khách sạn tại châu Âu rất ít có phòng 03 người. Hoặc khách đi lẻ (1 mình) phải đóng phụ thu phòng đơn nếu không có người khách lẻ khác ghép. 
<br/>Chỉ có 1 hướng dẫn viên từ Việt Nam (trưởng đoàn) theo đoàn suốt tuyến (đoàn từ 10 khách trở lên)
<br/>Ăn uống, xe đưa đón, và phí tham quan theo chương trình.
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế với mức đền bù tối đa là 1.050.000.000 VND/ trường hợp.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Lệ phí visa & phí dịch thuật hồ sơ, thư mời du lịch 
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Tiền tips cho hướng dẫn viên Việt Nam đi cùng đoàn suốt tuyến và tài xế tại châu Âu
<br/>Nước uống trên hành trình tour 
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Phụ phí phòng đơn 12.500.000 vnđ (trong trường hợp khách đăng ký đi lẻ 1 mình mà không có khách lẻ nào khác để ghép với quí khách, quí khách vui lòng đóng phí phòng đơn này).
<br/><br/><b>GIÁ VÉ TRẺ EM: (tính theo ngày / tháng / năm sinh)</b>
<br/>Trẻ em từ 2 đến dưới 11 tuổi : 90% giá tour người lớn (ngủ chung giường với bố mẹ)
<br/>Trẻ em dưới 2 tuổi: 30% giá tour người lớn (ngủ chung giường với bố mẹ)
<br/>Lưu ý: Trẻ em ngủ chung giường với bố mẹ. Mỗi gia đình chỉ được kèm 1 trẻ em, trẻ em thứ 2 đóng 100% để có tiêu chuẩn giường riêng.
<br/><br/><b>ĐIỀU KIỆN HUỶ TOUR:</b>
<br/>Trong trường hợp không thể tham dự được tour, quý khách vui lòng mang Biên bản đăng ký tour & biên lai đóng tiền đến văn phòng Cty Little Saigon để làm thủ tục hủy/chuyển tour. Phải thông báo cho Công ty bằng văn bản hoặc email (không giải quyết các trường hợp lien hệ chuyển/hủy tour qua điện thoại) và chịu phí huỷ phạt như sau:
<br/><br/><b>ĐỐI VỚI TOUR NGÀY THƯỜNG: </b>
<br/>Huỷ ngay sau khi đăng ký: 50% tổng giá thành tour.
<br/>Hủy trước ngày khởi hành 30 ngày (từ ngày 30 trở về trước): 70% tổng giá thành tour
<br/>Hủy trước ngày khởi hành 15 ngày (từ ngày 15 – ngày thứ 30): 85% tổng giá thành tour.
<br/>Huỷ trong vòng 15 ngày so với ngày khởi hành (từ ngày 15 – ngày khởi hành): 100% tổng giá thành tour.
<br/>*** Lưu ý: Bên cạnh việc khách hàng hủy tour sẽ dựa vào các điều kiện hủy phạt như trên. Đồng thời, đối với những khách đã có visa Châu Âu xin visa theo đoàn của Cty , chúng tôi sẽ giữ hỗ chiếu cho đến khi thời hạn visa Châu Âu kết thúc, hết hiệu lực được phép nhập cảnh; Hoặc sẽ thông báo với LSQ/ĐSQ (nơi cấp visa) để đóng dấu mộc “Cancel – hủy” visa của khách. Vì chúng tôi chịu trách nhiệm trong việc nhập cảnh và xuất cảnh Châu Âu của quý khách.',
'~/Images/HinhAnhTour/TourChauAu/tourCAu3.jpg',20,5,37990000,34990000,'VNĐ',1);
INSERT INTO Tour VALUES(043,5,N'Tour du lịch Hè Pháp - Thụy Sĩ - Ý - Vatican - Áo - Đức giá tốt từ Hà Nội',
N'Du lịch Châu Âu mùa Hè 2019 - Mùa Hè là thời điểm thích hợp để các gia đình lên kế hoạch du lịch đó đây, trong đó châu Âu là một trong những điểm đến không thể bỏ qua với những kiến trúc cổ kính hàng ngàn năm tuổi, những nét văn hóa và ẩm thực vô cùng đặc sắc. Tour du lịch Châu Âu Hè cùng Du Lịch Việt  sẽ đưa Quý khách đến với hành trình du lịch Châu Âu 5 nước Pháp - Thụy Sĩ - Ý - Áo - Đức để trải nghiệm qua 9 thành phố với các điểm tham quan nổi bật:
Sông Seine, tháp Eiffel, Quảng trường Concorde, đại lộ Champs-elysees…nổi tiếng thơ mộng của Paris
Ngắm nhìn vườn hoa đồng hồ xinh đẹp Jardin Anglais - của thành Geneva - Thụy Sĩ
Tháp nghiêng Pisa là biểu tượng nổi tiếng của Italy, thu hút hàng triệu du khách tham quan mỗi năm
Quảng trường Michel-Angelo được đánh giá là một trong những địa điểm lý tưởng để chụp một bức ảnh toàn cảnh thành phố cổ kính Florence 
Đấu trường La Mã Colloseum công trình kiến trúc vĩ đại nhất của La Mã cổ đại
Tòa thánh Vatican nơi hành hương linh thiêng của các tín đồ công giáo với những kiến trúc, tranh ảnh và vật phẩm tôn giáo vô giá không nơi nào có được.
Venice - thành phố của các Lễ hội và kênh đào mà điểm nhấn là thuyền độc mộc Gondola. Chưa đến Venice tức là bạn chưa hề đến Ý.
Thị trấn Hallstatt thanh bình, thơ mộng của Áo được mệnh danh là “Hòn ngọc nước Áo” hay “Xứ sở thần tiên” 
Thành phố Munich của Đức nơi được coi là nơi đáng sống thứ 4 trên thế giới.    
',N'HDV đón quý khách tại điểm hẹn','9:15','08-26-2019','09-05-2019',N'11 ngày 10 đêm',
N'<b>NGÀY 1 | VIỆT NAM - PARIS    (Ăn trên máy bay)</b>
<br/>HDV đón quý khách tại điểm hẹn, xe và HDV đưa quý khách đến sân bay, làm thủ tục đáp chuyến bay đến thủ đô Paris của nước Pháp.
<br/><br/><b>NGÀY 2 | PARIS - CITY TOUR    (Ăn trưa, tối) </b>
<br/>Đến sân bay quốc tế Charles De Gaul, HDV đưa đoàn thăm quan Paris: 
<br/>Nhà thờ Đức Bà – địa điểm tham quan nổi tiếng tại Paris gắn liền với câu chuyện «Thằng Gù Nhà Thờ Đức Bà».
<br/>Khải Hoàn Môn (Arc De Triomphe) - biểu tượng lịch sử của Pháp.
<br/>Quảng trường Concorde - một trong 10 quảng trường nổi tiếng nhất thế giới.
<br/>Tháp Eiffel (chụp hình bên dưới).
<br/>Dạo thuyền trên dòng sông Seine thơ mộng, ngắm nhìn cảnh sắc thành phố Paris hoa lệ.
<br/><br/><b>NGÀY 3 | PARIS – GENEVE     (Ăn ba bữa)</b>
<br/>Dùng điểm tâm, xe đón đoàn và đưa đến thành phố Geneve xinh đẹp của Thụy Sỹ.
<br/>Quý khách dùng bữa trưa trên đường.
<br/>Chiều đến Geneve, chụp hình bên ngoài trụ sở châu Âu của Liên Hợp Quốc, chiếc ghế gãy –  hội chữ thập đỏ quốc tế. Ngắm nhìn vườn hoa đồng hồ Jardin Anglais. Ngoài ra, tại Geneve quý khách có thể tự do  mua sắm đồ lưu niệm hay đồng hồ Thụy Sĩ.
<br/>Dùng bữa tối, nhận phòng và nghỉ đêm tại khách sạn.
<br/>Dùng bữa tối, nhận phòng và nghỉ đêm tại khách sạn.
<br/><br/><b>NGÀY 4 | GENEVE – MILAN       (Ăn ba bữa)</b>
<br/>Đoàn dùng bữa sáng tại khách sạn và trả phòng. Xe đưa đoàn đến Milan – kinh đô thời trang bậc nhất của nước Ý. Du khách tham quan và chụp hình tại Nhà thờ lớn nhất Milan – Duomo với kiến trúc bằng đá khối độc đáo, tinh xảo đến từng chi tiết. Trung tâm mua sắm Emmanuel II, khu trung tâm thương mại cổ nhất Châu Âu với rất nhiều các mặt hằng thời trang.
<br/>Qúy khách dùng bữa tối tại nhà hàng địa Phương sau đó nhận phòng và nghỉ ngơi tại khách sạn.
<br/><br/><b>NGÀY 5 | MILAN – PISA - FLORENCE       (Ăn ba bữa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Xe đưa đoàn đến thành phố Pisa, chụp hình bên ngoài tháp nghiêng Pisa. 
<br/>Quý  khách dùng bữa trưa trên đường đi. Sau đó đoàn tiếp tục lên đường  đến Florence.
<br/>Đến nơi đoàn nhận phòng nghỉ ngơi.
<br/><br/><b>NGÀY 6 | FLORENCE – ROME        (Ăn ba bữa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Xe đưa đoàn đi khởi hành đến với thành phố Florence, thành phố hơn 2.000 năm tuổi của nước Ý, được mệnh danh là cái nôi văn hóa nghệ thuật Phục hưng, nổi tiếng với nhiều kiệt tác kiến trúc cổ xưa. Tham quan Quảng trường Michel-Angelo, cầu Vecchio, nhà thờ Đức Mẹ Duomo, tháp Campanile.
<br/>Sau bữa trưa quý khách lên đường đến thành phố Rome. Quý khách dạo quanh tham quan Rome: Đài phun nước Trevi, tản bộ khu vực xung quanh Quảng trường Tây Ban Nha. Đến Đấu trường La Mã Colloseum (bên ngoài) công trình kiến trúc vĩ đại nhất của La Mã cổ đại. Quý khách có thể vào bên trong Đấu trường hoặc đi bộ đến Khải Hoàn Môn Constantine gần đó.
<br/><br/><b>NGÀY 7 | ROME – VATICAN - VENICE        (Ăn ba bữa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Rome. Xe đưa đoàn đến Vatican - là quốc gia độc lập nhỏ nhất thế giới. Đến nơi, quý khách tham quan đền thờ thánh Peter’s Basilica tuyệt mỹ - một trong bốn nhà thờ lớn nhất ở Vatican.
<br/>Sau bữa trưa quý khách lên đường đến Mestre.
<br/>Đến nơi quý khách nhận phòng khách sạn nghỉ ngơi.
<br/>Đến nơi quý khách nhận phòng khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 8 | MESTRE – VENICE - SALZBURG      (Ăn ba bữa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Khởi hành khám phá thành phố trên sông Venice: quảng trường San Marco, Cầu Than Thở, xem biểu diễn chế tác thủy tinh ở Murano.
<br/>Sau bữa trưa, quý khách trở về thành phố Mestre, tiếp tục lên đường đến thành phố Salzburg - quê hương của thần đồng âm nhạc Mozart.
 <br/>Đến nơi quý khách ăn tối và nhận phòng nghỉ đêm.
<br/><br/><b>NGÀY 9 | SALZBURG – HALLSTATT – MUNICH           (Ăn ba bữa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Xe đưa đoàn đến với thị trấn Hallstatt – thị trấn cổ kính và bình yên nhất Châu Âu. Quý khách có thể tản bộ trên những con đường nhỏ quanh làng, ngắm nhìn mặt hồ tĩnh lặng được bao quanh bởi dãy Alps hùng vĩ, Nhà thờ Giáo xứ Đức Mẹ Thăng thiên tại Hallstatt vẫn luôn giữ được nét đẹp từ thuở xưa.
<br/>Quý khách về lại thành phố Salzburg dùng bữa trưa và tham quan nhà thờ Salzburg, tượng Mozart, dạo quanh khu phố cổ, nhà của Mozart, pháo đài Hohensalzburg.
<br/>Sau đó xe đưa quý khách đến thành phố Munich và nghỉ đêm tại đây.
<br/><br/><b>NGÀY 10 | MUNICH – VIỆT NAM         (Ăn sáng, trưa)</b>
<br/>Quý khách dùng bữa sáng tại khách sạn và trả phòng. Xe đưa đoàn tham quan thành phố Munich. Tham quan New Town Hall (Neues Rathaus), ngắm nhìn tháp đồng hồ Rathaus – Glockenspiel. Sau đó tham quan quảng trường nhà vua Konigsplatz, Cổng Victory. Quý khách tự do tham quan mua sắm cho đến giờ ra sân bay đáp chuyến bay về Việt Nam
 
 <br/><br/><b>NGÀY 11 | VIỆT NAM     </b>               
<br/>Đến Việt Nam - kết thúc chương trình. Hẹn gặp lại Quý Khách.',
N'<br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay chặng quốc tế: Tp.HCM/Hà Nội - Paris // Munich - Tp.HCM/Hà Nội. 
<br/>Hãng hàng không dự kiến 5*: Turkish Airlines. (Tùy theo ngày khởi hành mà Turkish Airlines sẽ dừng kỹ thuật ở TPHCM)
<br/>Lệ phí visa Schengen, phí dịch thuật & thư mời
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Khách sạn 3 - 4 sao tiêu chuẩn phòng đôi. Trong trường Quý Khách đi một mình (lẻ nam hoặc lẻ nữ) phòng 3 người (phòng triple) sẽ được bố trí khi cần thiết (lưu ý: người thứ 3 phải ngủ giường phụ gọi là sofa bed. Tuy nhiên khách sạn Châu Âu rất ít có phòng 03 người). Trường hợp không có khách lẻ (khách đi một mình) khác để ghép Quý Khách vui lòng đóng phụ thu phòng đơn. 
<br/>Vé tham quan & ăn uống theo chương trình.
<br/>Hướng dẫn viên từ Việt Nam (trưởng đoàn) sẽ theo đoàn suốt tuyến (đoàn khởi hành trên 10 khách).
<br/>Xe đưa đón tham quan theo chương trình.
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế với mức đền bù 1.050.000.000 VND/ trường hợp.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Tiền tips (bồi dưỡng) cho hướng dẫn viên Việt Nam (trưởng đoàn) đi cùng đoàn suốt tuyến và tài xế tại Châu Âu là: 2.700.000 vnđ/khách đóng tại Việt Nam
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Phụ phí phòng đơn 14.500.000 vnđ ','~/Images/HinhAnhTour/TourChauAu/tourCAu4.jpg',
20,8,61990000,60000000,'VNĐ',1);
INSERT INTO Tour VALUES(044,5,N'Du lịch Châu Âu 10 ngày: Pháp - Nice - Monaco - Tây Ban Nha - Bồ Đào Nha từ Hà Nội',
N'<b>Du lịch Châu Âu 10 ngày: Pháp - Nice - Monaco - Tây Ban Nha - Bồ Đào Nha.</b> Mùa Xuân & mùa hè Châu Âu luôn được coi là mùa đẹp nhất trong năm. Sức hấp dẫn đặc biệt của hai mùa này không chỉ bởi khung cảnh thiên nhên lãng mạn, bởi sắc thu bao phủ mọi cảnh vật mà còn bởi tiết trời thu luôn là một trợ thủ đắc lực, giúp du khách có một sức khỏe và tinh thần sảng khoái khi đi du lịch dài ngày. Trải nghiêm tour Châu Âu 10 ngày qua cung đường du lịch độc đáo, trung tâm những thành phố tuyệt đẹp bậc nhất tour du lịch Châu Âu của Pháp – Monaco – Tây  Ban Nha – Bồ Đào Nha. 

Từ Nice, Du Lich Việt sẽ đưa quý khách đến với thành phố Monaco – nằm dọc eo biển Địa Trung Hải - quốc gia nhỏ thứ 2 trên thế giới nhưng cực kỳ giàu có và thịnh vượng. Qua Montpellier – “Thành phố 300  ngày nắng”, đến thành phố Barcelona quanh năm nắng ấm nổi tiếng với sân vận động Camp Nou, ghé thăm thủ đô Madrid “Viên Ngọc rực rỡ của – Tây Ban Nha”, thành phố Cổ Toledo – được Unesco công nhận 1986. Điểm đến cuối cùng là thủ đô Lisbon – “thành phố trẻ năng động” của Bồ Đào Nha. Một hành trình tuyệt vời!
',N'Xe và HDV sẽ đón quý khách tại Nhà Hát Lớn hoặc Công Viên Thống Nhất','09:10','08-22-2019','08-31-2019',N'10 ngày 9 đêm',
N'<b><br/>NGÀY 1 | VIỆT NAM - NICE (PHÁP)              (Trên máy bay)</b>
<br/>Xe và HDV sẽ đón quý khách tại Nhà Hát Lớn hoặc Công Viên Thống Nhất, khởi hành đến sân bay Nội Bài, làm thủ tục đáp chuyến bay đi Paris. Dùng bữa tối và nghỉ đêm trên máy bay. 
<br/><b>NGÀY 2 | Nice – công quốc MONACO – Nice (Ăn trưa, chiều)</b>
<br/>Đến sân bay Nice – Côte D’Azur (thuộc Pháp), đoàn làm thủ tục nhập cảnh. Xe đón đoàn di chuyển đến công quốc Monaco – quốc gia nhỏ thứ 2 trên thế giới nhưng cực kỳ giàu có và thịnh vượng. Trên đường đi Quý khách sẽ được trãi nghiệm trên con đường ven biển đẹp nhất thế giới dọc theo bờ biển Nice nhìn ra Địa Trung Hải - Promenade des Anglais.
<br/>Đoàn dùng bữa trưa tại nhà hàng địa phương. Sau đó tham quan: Sòng bài Monte Carlo – hoành tráng & sang trọng. Đường đua xe hơi Công thức 1 – Monaco Grand Pix race. Cung điện hoàng gia Monaco. Nhà thờ chánh tòa Monaco – Saint Nicholas Cathedrale. Monaco Harbor  - Ngắm nhìn toàn cảnh bờ biển Địa Trung Hải, đặc biệt là vẻ đẹp của khu dân cư và bến du thuyền Monaco. Đoàn rời Monaco ghé thăm phủ Nice của vùng Cote D’Azur xinh đẹp tham. Đoàn dùng cơm chiều tại nhà hàng. Sau đó làm thủ tục nhận phòng – nghỉ đêm tại Nice.
<br/><br/><b>NGÀY 3 | Nice – (44km) – Grasse – (18km) – Cannes – (302km) – Montpellier     (Ăn sáng/trưa/chiều))</b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn. Sau đó khởi hành đi Grasse – một thị trấn cổ rất đẹp và là thủ đô về nước hoa không chỉ của nước Pháp mà còn là củ thế giới, đến nơi tham quan: 
<br/>Nhà máy sản xuất nước hoa Fragonard – một trong những thương hiệu sản xuất nước hoa nổi tiếng nhất của thủ phủ Grasse. Tiếp tục khởi hành đến Cannes – thành phố nổi tiếng thế giới với Liên Hoan Phim Cannes danh giá
<br/>Tham quan: Boulevard de la Croisette - Đại lộ chính của Cannes với cảnh quang tuyệt đẹp, một bên là bãi biển Public Beaches, một bên là hàng cây cọ dừa trãi  dài dọc theo. Festival de Cannes: nơi diễn ra lễ hoan phim Cannes (chụp hình bên ngoài). Vieux Port – cảng Vieux (cảng cũ).
<br/>Đoàn dùng bữa trưa tại nhà hàng địa phương.
<br/>Đoàn tiếp tục khởi hành về Montpellier – nằm ở phía nam nước Pháp, được mệnh danh là “thành phố 300 ngày nắng” – cách biển Địa Trung Hải 10 km, mang trong mình khí hậu ấm áp, Montpellier được biết tới với hình ảnh một thành phố xinh đẹp, không ô nhiễm môi trường.
<br/>Đoàn dùng bữa chiều tại nhà hàng địa phương. Sau đó đoàn nhận phòng khách sạn – nghỉ đêm tại Montpellier hoặc vùng lân cận.
vùng lân cận.
<br/><br/><b>NGÀY 4 | Montpellier – (350km) – Barcelona    (Ăn sáng/trưa/chiều)</b>
<br/>Đoàn dùng điểm tâm sáng tại khách sạn. Quý khách trả phòng khởi hành tham quan trung tâm thành phố Montpellier với: 
<br/>Quãng trường Comedie – còn gọi là quãng trường trứng vì hình dạng bẩu dục, là một trong những quãng trường lớn nhất châu âu cho người đi bộ.
<br/>Porte du Peyrou – Khải Hoàn Môn: xây dựng từ thế kỷ 17. Đoàn khởi hành đi Barcelona – nổi tiếng với bờ biển trãi dài và nắng ấm gần như quanh năm quả là một thiên đường ở Châu Âu lạnh lẽo. Bên cạnh đó Barcelona – thủ phủ xứ Catalang đứng đầu mười thành phố xinh đẹp.

<br/>Đến Barcelona – đoàn dùng cơm trưa tại nhà hàng, sau đó tham quan: 
<br/>Sân vận động Camp Nou: nổi tiếng của đội bóng Barcelona (tham quan bên ngoài xem).
<br/>Nhà thờ La Seu (Nhà thờ Barcelona).
<br/>Sagrada Familia – nhà thờ với kiến trúc đặc biệt không thể lẫn vào đâu  được.
<br/>Barcelona (tham quan bên ngoài xem). Quảng trường Catalonia.

<br/>Đoàn dùng bữa tối tại nhà hàng địa phương. Sau đó nhận phòng và nghỉ đêm ở Barcelona hoặc vùng lân cận.
<br/><br/><b>NGÀY 5 | Barcelona  –  (315km) – ZARAGOZA     (Ăn sáng/trưa/chiều)</b>
<br/>Đoàn dùng điểm tâm sáng, trả phòng. Khởi hành đi Zaragoza – thành phố nằm phía Đông Tây Ban Nha đầy màu sắc này sẽ gây ấn tượng với bạn.
<br/>Đoàn đến Zaragoza, dùng cơm trưa – Sau đó khởi hành tham quan: 
<br/>Nhà thờ Basilica de Nuestra Senora del Pilar – là nhà thờ công giáo La Mã, mang phong cách kiến trúc độc đáo với vô số tháp và mái vòm khổng lồ.
<br/>La Seo Cathedral (Cathedral of the Savior) – Đây là một điểm đến mang tính văn hóa lịch sử từ thế kỷ 12, nhà thờ có tòa tháp chuông cao lớn sừng sững đứng trước khu quãng trường và Basilica de Nuestra Senora del Pilar.
<br/>Zuda Tower – Tháp Zuda. Zaragoza Central Market – chợ trung tâm Zaragoza.
<br/>Aljaferia Palace – cung điện Aljaferia là cung điện Hồi Giáo của người Trung cổ, được xây dựng vào nữa thế kỷ 11 (tham quan bên ngoài).
<br/>Tự do shopping – mua sắm.
<br/>Đoàn dùng bữa tối tại nhà hàng địa phương. Sau đó nhận phòng khách sạn. Nghỉ đêm tại Zaragoza.
<br/><br/><b>NGÀY 6 | Zaragoza – (317) – MADRID    (Ăn sáng/trưa/chiều)</b>
<br/>Đoàn dùng điểm tâm sáng, trả phòng. Khởi hành đi thủ đô Madrid – Viên Ngọc sáng của Tây Ban Nha.
 <br/>Đoàn dùng cơm trưa tại nhà hàng. Sau đó tham quan: 
<br/>Chụp hình bên ngoài Royal Palace of Madrid – Cung điện hoàng gia.
<br/>Plaza Mayor – quảng trường cổng mặt trời.
<br/>Nhà thờ chính tòa Almudena: thuộc giáo hội công giáo Roma.
<br/>City Hall – Toà thị chính. Puerta de Alcala: Khải hoàn môn.
<br/>Đoàn tự do mua sắm tại Centro Comercial Moda Shopping hoặc ABC Serrano, Gran Via Street…(nếu còn thời gian).
<br/>Đoàn dùng bữa tối – sau đó nhận phòng – nghỉ đêm tại Madrid.
<br/><br/><b>NGÀY 7 | Madrid – (73km) – Toledo – (270km) – CACERES     (Ăn sáng/trưa/chiều)</b>
<br/>Đoàn dùng điểm tâm sáng, trả phòng. Khởi hành tham quan: 
<br/>Toledo – được UNESCO công nhận là di tích văn hóa lịch sử thế giới 1986, được mệnh danh là “thành phố hoàng gia” bởi Bao quanh thành phố vẫn là những bức tường thành cổ kính với nhiều tháp, cổng thành và những tòa nhà kiến trúc độc đáo
<br/>Tham quan: Nhà thờ lớn Toledo với lối kiến trúc kết hợp của Do Thái & Morocco.
<br/>Alcazar of Toledo – là một cung điện pháo đài giống như mũi tàu nằm cuối thành phố cổ Segovia, được xây trên một mũi đá nhìn ra hợp lưu các sông Eresma và Clamores, giúp Alcazar trở thành một nơi bất khả xâm phạm trong thời gian dài.
<br/>Sinagoga del Transito – giáo đường được xây dựng 1355 với những bộ chữ của người Do Thái khắc trên tường. (Đóng cửa vào thứ 2 hàng tuần).
<br/>Đoàn dùng cơm trưa - sau đó khởi hành về Caseres tham quan city tour Caseres – là một thành phố cổ nằm giữa thủ đô Lisbon Bồ Đào Nha và thành phố Madrid của Tây Ban Nha. Với những món ăn đặc sản, cùng nhiều nhà hàng nổi tiếng thế giới, Caceres vừa tuyên bố thành phố này là kinh đô ẩm thực của Xứ sở bò tót năm 2015.
<br/>Đoàn dùng bữa tối tại nhà hàng địa phương – Quý khách nhận phòng nghỉ đêm tại Caceres hoặc vùng lân cận.
<br/><br/><b>NGÀY 8 | Caseres – (360km) – LISBON     (Ăn sáng/trưa/chiều)</b>
<br/>Đoàn dùng điểm tâm sáng tại khách sạn. Đoàn khởi hành về thủ đô Lisbon thành phố trẻ và năng động đang dần trở thành một trong những điểm thu hút khách du lịch nhất Châu Âu bởi sự giao thoa giữa kiến trúc cũ và mới hiện đại.
 <br/>Đến Libon, đoàn dùng cơm trưa sau đó tham quan: 
<br/>Belem Tower – Tháp Belem là một tháp canh và pháo lũy được xây cất từ năm 1515 đến 1520. Là một di sản Văn Hóa Thế Giới được UNESCO công nhận.
<br/>Chụp hình bên ngoài Jeronimos Monastery – Tu viện Jeronimos: công trình kiến trúc tiêu biểu cho thời kỳ cực thịnh của Bồ Đào Nha.
<br/>Monument to the Discoveries: đài tưởng niệm.
<br/>Praca do Comercio (Quãng trường thương mại).
<br/>Nhà thờ Lisbon.
<br/>Lâu đài Castelo de São Jorge – là một biểu tượng của Lisbon và là trung tâm của huyện Alfama. Sao Jorge có cấu trúc tuyệt đẹp, cổ kính, nằm trên đỉnh đồi cao nhất ở trung tâm lịch sử của thành phố. (tham quan bên ngoài). Đai lộ Liberty. Quận trung tâm Bairro Alto.
<br/><br/><b>NGÀY 9 | Lisbon – City tour - VIỆT NAM    (Ăn sáng)</b>
<br/>Đoàn dùng điểm tâm sáng tại khách sạn, trả phòng. Quý khách tư do mua sắm tại các trung tâm thương mại lớn của Lisbon như: Centro Vasco Da Gama, Colombo Shopping, El Corte Ingles….& tự do khám phá ẩm thực và văn hóa thành phố Lisbon (Quý khách ăn trưa tự túc).
<br/>12h00: Đến giờ ra sân bay, xe đưa đoàn ra sân bay quốc tế Lisboa Portela đoàn làm thủ tục đáp chuyến bay về lại Hà Nội. Ăn uống & nghỉ ngơi trên máy bay.
<br/><br/><b>NGÀY 10 | VIỆT NAM</b>
<br/> Đoàn làm thủ tục nhập cảnh, lấy hành lý. HDV nói lời chia tay, tạm biệt & xin hẹn gặp lại Quý khách. Kết thúc chương trình tham quan. 
 ',N'<br/><b>GIÁ TOUR BAO GỒM:</b>
 <br/>Vé máy bay chặng quốc tế: Tp.HCM/HÀ NỘI – Paris // Lisbon – Tp.HCM/HÀ NỘI. (Tùy theo ngày khởi hành mà Turkish Arilines sẽ dừng kỹ thuật ở TP.HCM)
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Khách sạn 4 sao đầy đủ tiện nghi, tiêu chuẩn phòng đôi. 
<br/>Trong trường hợp khách đi 1 mình (lẻ nữ hoặc lẻ nam) thì phòng ba (phòng triple) sẽ được bố trí khi cần thiết. (Lưu ý: người thứ 3 trong phòng phải ngủ giường phụ (còn gọi là Sofa bed. Hoặc khách phải đóng phụ thu phòng đơn nếu không có người khách lẻ khác ghép. 
<br/>Hướng dẫn viên từ Việt Nam (trưởng đoàn) theo đoàn suốt tuyến (đoàn từ 10 khách trở lên)
<br/>Lệ phí visa châu âu, phí dịch thuật & thư mời xin visa châu âu.
<br/>Ăn uống, xe đưa đón, và phí tham quan theo chương trình.
<br/>Nước uống trên xe 1 chai 0,5ml/ngày/người.
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Chi phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Tiền tips cho hướng dẫn viên Việt Nam đi cùng đoàn suốt tuyến và tài xế tại châu Âu
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Phụ phí phòng đơn 
','~/Images/HinhAnhTour/TourChauAu/tourCAu5.jpg',20,10,78990000,759900000,'VNĐ',1);
/*
INSERT INTO Tour VALUES(045,5,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauAu/tourCAu6.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(046,5,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauAu/tourCAu7.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(047,5,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauAu/tourCAu8.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(048,5,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauAu/tourCAu9.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(049,5,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauAu/tourCAu10.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(050,5,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauAu/tourCAu1.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(051,5,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauAu/tourCAu1.jpg',25,10,1300000,10000000,'VNĐ',1);
*/
--CHÂU ÚC
INSERT INTO Tour VALUES(052,6,N'Du lịch Úc - Sydney - Canberra - Lễ hội hoa Floriade mùa Xuân khởi hành từ Hà Nội',
N'<b>Hành trình: Sydney- Canberra - Lễ hội hoa Floriade
<br/>Lịch trình: 5 ngày 4 đêm
<br/>Khởi hành: 20/09/2019
<br/>Di chuyển: Vé máy bay khứ hồi & xe du lịch đời mới cao cấp</b>
<br/>Du lịch Úc. Một chuyến du lịch trải nghiệm hay một kỳ nghỉ hướng về thiên nhiên, ăn uống, mua sắm; tìm hiểu văn hóa nghệ thuật hay khám phá những nền văn hóa lâu đời - tất cả đều có trong tour du lịch Úc mùa Xuân của Du Lịch Việt đến thành phố Sydney và thủ đô Canberra nước Úc. Đến Úc thời điểm này, du khách có thể tới lễ hội hoa Floriade ở Úc tại thủ đô Canberra để tận hưởng hàng nghìn sắc hoa thơm ngát trong tiết trời trong xanh, mát mẻ. Hãy để Du Lịch Viêt giúp bạn lên kế hoạch hoàn hảo cho chuyến đi thú vị của riêng mình đến với thành phố đáng sống nhất của nước Úc, bạn sẽ tìm thấy mọi thứ mình cần tại đây.
<br/>• Khám phá thành phố Sydney với cầu cảng và nhà hát con sò nổi tiếng
<br/>• Ngắm nhìn thủ đô Canberra xinh đẹp của Úc và hòa mình vào lễ hội hoa Floriade tưng bừng
<br/>• Tản bộ công viên Hyde Park va hít thở không khí trong lành
<br/>• Mua sắm tại chợ cá Sydney với đa dạng các loài cá biển
<br/>• Dạo biên Bondi, một trong những bãi biển nổi tiếng thế giới
<br/>• Mua sắm tại Queen Victoria khu mua sắm sang trọng nằm ngay trung tâm thành phố',
N'Quý khách tập trung tại điểm hẹn','07:10','09-20-2019','09-24-2019',N'5 ngày 4 đêm',
N'<br/><b>NGÀY 1 | TẬP TRUNG TẠI SÂN BAY - SYDNEY</b>
<br/>Quý khách tập trung tại điểm hẹn, HDV công ty Du Lịch Việt giúp quý khách làm thủ tục hàng không đáp chuyến bay đi Melbourne.
<br/><br/><b>NGÀY 2 | SYDNEY - CITY TOUR (Ăn trưa, tối)</b>
<br/>11:15 Đoàn đến Sydney, quý khách dùng bữa trưa. Sau đó khởi hành tham quan: 
<br/>Ghế ngồi Bà Macquaries nơi du khách có thể lưu lại những hình ảnh đẹp nhất về thành phố biển Sydney. 
<br/>Chụp ảnh lưu niệm tại Sydney Opera House với hình dáng đặc biệt nhưng  những chiếc vỏ sò nằm chồng lên nhau. Đây là một trong những kỳ quan về kiến trúc nổi tiếng trên thế giới.
<br/>Đoàn tiếp tục tham quan Cầu cảng Sydney được đưa vào sử dụng từ năm 1932 với hình dáng như  một chiếc móc áo bằng sắc khổng lồ. Darling Harbour - một cảng biển nhộn nhịp nơi có nhiều quán cà phê lãng mạn ngoài trời nổi tiếng ở Sydney.
<br/>Quý khách dùng cơm chiều, về khách sạn nhận phòng nghỉ ngơi. Nghỉ đêm tại Sydney. 
<br/><br/><b>NGÀY 3 | SYDNEY – THỦ ĐÔ CANBERRA (Ăn ba bữa) </b>
<br/>Quý khách dùng điểm tâm tại khách sạn. Xe đưa đoàn khởi hành đi Canberra - thủ đô của Úc từ năm 1908 - cách Sydney 280km và Melbourne 660km. Điều đặc biệt là Canberra được xây dựng dựa trên những yếu tố cơ bản của một thành phố vườn, chi phối bởi cây xanh, tôn trọng môi trường thiên nhiên và hạn chế các tòa nhà cao tầng. Đây cũng chính là lý do khiến Canberra còn được gọi với cái tên hết sức thú vị “thủ đô bụi rậm”. Đến thăm thành phố bụi rậm này, du khách sẽ có nhiều trải nghiệm thú vị cả về thiên nhiên, văn hóa lẫn con người trong cuộc sống hiện đại. Tại thủ đô Canberra, đoàn tham quan: 
<br/>Toà nhà Quốc Hội Australia.
<br/>Tháp phun nước thuyền Trưởng Cook được xây dựng kỷ niệm 200 năm Thuyền trưởng người Anh – James Cook khám phá ra Châu Úc.
<br/>Đến Canberra vào đúng dịp Lễ hội Floriade, du khách thỏa sức hòa mình vào khung cảnh tuyệt đẹp được tạo nên bởi một triệu đóa hoa cùng với các hoạt động âm nhạc, lễ hội văn hóa, hội thảo làm vườn, trình diễn nghệ thuật và vô số hoạt động giải trí sôi động. Tất cả đều  diễn ra trên một đại sân khấu ngoài trời trong công viên Commonwealth rộng đến 4ha. Trong suốt 30 ngày, công viên Commonwealth là bức tranh hoa khổng lồ đầy màu sắc mùa xuân của violet, thủy tiên, loa kèn, cúc tím, tulip… lấp lánh, yểu điệu bên hồ Burley Griffin - một trong những điểm tham quan nổi tiếng ở Canberra, cùng với Toà nhà nghị viện Úc, Con đường đại sứ quán...
 <br/>Sau đó, đoàn trở về Sydney, dùng bữa tối và về khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 4 | SYDNEY – BÃI BIỂN BONDI – CHỢ CÁ SYDNEY - SHOPPING (Ăn sáng, ăn tối)</b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn và khởi hành tham quan: 
<br/>Bãi Biển Bondi - một trong những bãi biển nổi tiếng nhất của Úc và trên thế giới. 
<br/>Chợ cá Sydney – nơi cung cấp những loại hải sản tươi ngon nhất thế giới. Đây là nơi có thể được xuất hiện trên các bưu ảnh, chương trình truyền hình và các bộ phim nhiều hơn bất cứ nơi nào khác ở Úc. Quý khách thưởng thức ẩm thực phong phú tại chợ cá Sydney (chi phí tự túc). 
<br/>Sau đó, quý khách dạo chơi trong công viên Hyde Park - một ốc đảo xanh lá cây tuyệt đẹp  giữa lòng thành phố, là địa điểm nghỉ ngơi, thư giãn lý tưởng của người dân địa phương và du khách nước ngoài. 
<br/>Tiếp tục mua sắm tại Queen Victoria Building – khu mua sắm sang trọng nằm ngay trung tâm thành phố. 
<br/>Quý khách dùng bữa bữa tối, sau đó về khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 5 | SYDNEY - VIỆT NAM (Ăn sáng)</b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn. Quý khách tự do tham quan mua sắm & tự túc bữa trưa cho đến giờ xe đưa đoàn khởi hành ra sân bay đáp chuyến bay về Việt Nam (JQ61 15:20 - 21:05). Đến sân bay Quý khách làm thủ tục nhập cảnh Việt Nam & nhận lại hành lý cá nhân, Trưởng đoàn Du lịch Việt chia tay Quý khách. Kết thúc chuyến tham quan.
',N'<br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay quốc tế bay thẳng: JETSTAR AIRWAYS (TP.HCM – Sydney – TP.HCM)
<br/>Vé máy bay khứ hồi nội địa: HAN – SGN – HAN.
<br/>Lệ phí visa, thư mời du lịch Úc.
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Khách sạn 3*: Trong trường hợp khách đi 1 mình (lẻ nữ hoặc lẻ nam) thì phòng ba sẽ được bố trí khi cần thiết. Hoặc khách đi lẻ (1 mình) phải đóng phụ thu phòng đơn nếu không có người khách lẻ khác ghép.
<br/>Chỉ một Hướng dẫn viên (trưởng đoàn) từ Việt Nam theo đoàn suốt tuyến (đoàn từ 10 người lớn trở lên).
<br/>Ăn uống, xe đưa đón, và phí tham quan theo chương trình.
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế.
<br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Tiền tips cho hướng dẫn viên Việt Nam và tài xế địa phương đóng tại Việt Nam.
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Chi phí khám sức khỏe theo yêu cầu của Lãnh sự quán & bảo hiểm lẻ (đối với khách hàng từ 70 tuổi trở lên)
<br/>Các chi phí không được đề cập trong mục bao gồm.
<br/>Đối với khách đi lẻ và không có khách khác ghép phòng, quý khách sẽ chịu phụ phí phòng đơn.','~/Images/HinhAnhTour/TourChauUc/tourCU1.jpg',
15,10,35990000,329900000,'VNĐ',1);
INSERT INTO Tour VALUES(053,6,N'Du lịch mùa Xuân Úc - Sydney - Canberra khởi hành từ Hà Nội',
N'<b>Hành trình: Sydney- Canberra - Lễ hội hoa Floriade
<br/>Lịch trình: 5 ngày 4 đêm
<br/>Khởi hành: 15/11, 6/12/2019
<br/>Di chuyển: Vé máy bay khứ hồi & xe du lịch đời mới cao cấp</b>
<i>Du Lịch Úc mùa xuân là dịp thú vị để khám phá vẻ đẹp rực rỡ, đầy sức sống của xứ sở Kangaroo. Du khách đến Úc vào mùa xuân sẽ choáng ngợp với khung cảnh thiên nhiên, với hàng triệu loài hoa cùng đua nở cùng những lễ hội hoa tuyệt đẹp. Hãy cùng Du lịch Việt du ngoạn nước Úc xinh đẹp với những trải nghiệm thú vị.
<br/>•    Chụp hình tại Nhà hát Con Sò  – kỳ quan kiến trúc của thế giới 
<br/>•    Khám phá thủ đô Canberra xinh đẹp
<br/>•    Bãi Biển Bondi - một trong những bãi biển nổi tiếng nhất của Úc và trên thế giới.
<br/>•    Chợ cá Sydney – nơi cung cấp những loại hải sản tươi ngon nhất thế giới.
<br/>•    Trải nghiệm 1 ngày tự do tham quan các địa điểm mới lạ ở Sydney và thỏa thích mua sắm tại các trung tâm thương mại cao cấp.</i>
',N'Quý khách tập trung tại sân bay','10:00','11-15-2019','11-19-2019',N'5 ngày 4 đêm',
N'<br/><b>NGÀY 1 | TẬP TRUNG TẠI SÂN BAY - SYDNEY (Ăn trên máy bay)</b>
<br/>Quý khách tập trung tại sân bay, HDV công ty Du Lịch Việt giúp quý khách làm thủ tục hàng không đáp chuyến bay đến Sydney. Quý khách ăn uống, nghỉ ngơi trên máy bay.
<br/><b>NGÀY 2 | SYDNEY – CITY TOUR (Ăn trưa, tối)</b>
<br/>Đến Sydney, xe đưa đoàn đi dùng cơm tại nhà hàng, sau đó khởi hành tham quan: 
<br/>Ghế ngồi Bà Macquaries nơi du khách có thể lưu lại những hình ảnh đẹp nhất về thành phố biển Sydney. 
<br/>Chụp ảnh lưu niệm tại Sydney Opera House với hình dáng đặc biệt nhưng  những chiếc vỏ sò nằm chồng lên nhau. Đây là một trong những kỳ quan về kiến trúc nổi tiếng trên thế giới. 
<br/>Cầu cảng Sydney được đưa vào sử dụng từ năm 1932 với hình dáng như một chiếc móc áo bằng sắt khổng lồ. 
<br/>Darling Harbour – một cảng biển nhộn nhịp nơi có nhiều quán cà phê lãng mạn ngoài trời nổi tiếng ở Sydney.
<br/>Quý khách dùng cơm chiều, về khách sạn nhận phòng nghỉ ngơi. Nghỉ đêm tại Sydney.
<br/><br/><b>NGÀY 3 | SYDNEY – THỦ ĐÔ CANBERRA (Ăn ba bữa)</b>
<br/>Quý khách dùng điểm tâm tại khách sạn. Xe đưa đoàn khởi hành đi Canberra – thủ đô của Úc từ năm 1908 – cách Sydney 280km và Melbourne 660km. Điều đặc biệt là Canberra được xây dựng dựa trên những yếu tố cơ bản của một thành phố vườn, chi phối bởi cây xanh, tôn trọng môi trường thiên nhiên và hạn chế các tòa nhà cao tầng. Đây cũng chính là lý do khiến Canberra còn được gọi với cái tên hết sức thú vị “thủ đô bụi rậm”. Đến thăm thành phố bụi rậm này, du khách sẽ có nhiều trải nghiệm thú vị cả về thiên nhiên, văn hóa lẫn con người trong cuộc sống hiện đại. Tại thủ đô Canberra, đoàn tham quan: 
<br/>Toà nhà Quốc Hội Australia.
<br/>Tháp phun nước thuyền Trưởng Cook được xây dựng kỷ niệm 200 năm Thuyền trưởng người Anh – James Cook khám phá ra Châu Úc. 
<br/>Sau đó, đoàn trở về Sydney, dùng bữa tối và về khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 4 | TỰ DO KHÁM PHÁ THÀNH PHỐ SYDNEY (Ăn sáng)</b>
<br/>Đoàn dùng điểm tâm tại khách sạn. Sau đó quý khách tự do tham quan khám phá thành phố Sydney với một số điểm tham quan nổi bật như: Bảo tàng Sáp Madame Tussauds, Sealife Aquarium, Sydney Tower Eye, Maritime Experiential Museum, Helicopter Ride (tất cả chi phí tự túc). Quý khách tự do mua sắm tại các trung tâm thương mại lớn như Queen Victoria Building, Westfield, Myer, David Jones,…. Hoặc Quý khách có thể tự do thăm thân nhân ở Sydney. 
<br/><br/><b>NGÀY 5 | SYDNEY - BÃI BIỂN BONDI - CHỢ CÁ SYDNEY - SHOPPING - RA SÂN BAY - TPHCM/HÀ NỘI (Ăn sáng, ăn trưa và ăn chiều tự túc)</b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn và khởi hành tham quan: 
<br/>Bãi Biển Bondi - một trong những bãi biển nổi tiếng nhất của Úc và trên thế giới. Chợ cá Sydney – nơi cung cấp những loại hải sản tươi ngon nhất thế giới. Đây là nơi có thể được xuất hiện trên các bưu ảnh, chương trình truyền hình và các bộ phim nhiều hơn bất cứ nơi nào khác ở Úc. Sau khi tham quan mua sắm quý khách thưởng thức ẩm thực phong phú tại chợ cá Sydney (chi phí tự túc). 
<br/>Sau đó, quý khách dạo chơi trong công viên Hyde Park một ốc đảo xanh lá cây tuyệt đẹp giữa lòng thành phố, là địa điểm nghỉ ngơi, thư giãn lý tưởng của người dân địa phương và du khách nước ngoài. 
<br/>Quý khách tự do shopping cho đến giờ xe đưa đoàn ra sân bay đáp chuyến bay về Việt Nam. Quý khách tự túc ăn chiều tại sân bay. Đến sân bay, sau khi làm thủ tục nhập cảnh Việt Nam & nhận lại hành lý cá nhân, Trưởng đoàn Du lịch Việt chia tay Quý khách. Kết thúc chuyến tham quan.
',N'<br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay chặng quốc tế - Jetstar Airways: Tp.HCM – Sydney – Tp.HCM (Hàng không Jetstar hành lý 20 kg/01 kiện, có phục vụ ăn trên máy bay chặng quốc tế, lưu ý quý khách nhớ đem theo áo ấm trên máy bay vì hàng không không phuc vụ phát mền).
<br/>Vé máy bay khứ hồi nội địa: HAN – SGN – HAN.
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Lệ phí visa, thư mời du lịch Úc.
<br/>Khách sạn 4 sao tiêu chuẩn phòng đôi. Trong trường hợp khách đi 1 mình (lẻ nữ hoặc lẻ nam) thì phòng ba sẽ được bố trí khi cần thiết. Hoặc khách đi lẻ (1 mình) phải đóng phụ thu phòng đơn nếu không có người khách lẻ khác ghép.
<br/>Hướng dẫn viên từ Việt Nam (kiêm trưởng đoàn) theo đoàn suốt tuyến (đoàn từ 10 khách trở lên)
<br/>Ăn uống, xe đưa đón, và phí tham quan theo chương trình
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Tiền tips cho hướng dẫn viên Việt Nam đi cùng đoàn suốt tuyến và tài xế tại Úc.
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Chi phí khám sức khỏe theo yêu cầu của Lãnh sự quán & phí mua bảo hiểm lẻ (đối với khách hàng từ 70 tuổi trở lên)
<br/>Các chi phí không được đề cập trong mục bao gồm.
<br/>Đối với khách đi lẻ và không có khách khác ghép phòng, quý khách sẽ phải chịu phụ phí phòng đơn.
<br/>Chi phí dời ngày, đổi chặng, nâng hạng vé máy bay.
','~/Images/HinhAnhTour/TourChauUc/tourCU2.jpg',35,10,35990000,32990000,'VNĐ',1);
INSERT INTO Tour VALUES(054,6,N'Du lịch xuân Úc ngắm lễ hội hoa Tulip - Melbourne - Sydney khởi hành từ Hà Nội 2019',
N'<b>Hành trình: MELBOURNE - LỄ HỘI HOA TULIP - SYDNEY
<br/>Số ngày: 6 ngày 5 đêm
<br/>Khởi hành: 24/9; 8/10/2019
<br/>Vận chuyển: Vé máy bay khứ hồi và xe du lịch</b>
<br/><i>Du lịch Úc 6 ngày 5 đêm. Nếu bạn đang tìm kiếm sự phiêu lưu mạo hiểm, hay một kỳ nghỉ hướng về thiên nhiên, đồ ăn và rượu ngon, mua sắm, văn hóa nghệ thuật, hay để kết nối với nền văn hóa lâu đời nhất trên trái đất, thì tất cả đều không có gì giống như kỳ nghỉ tại nước Úc. Khám phá các thành phố, bang và vùng tự trị của Úc, những sự kiện và điểm đến độc đáo mang đậm tính biểu tượng. Hãy để Du Lịch Viêt giúp bạn lên kế hoạch hoàn hảo cho chuyến đi thú vị của riêng mình, bạn sẽ tìm thấy mọi thứ mình cần tại đây.</i>
',N'Quý khách tập trung tại điểm hẹn','04:30','09-24-2019','09-29-2019',N'6 ngày 5 đêm',
N'<br/><b>NGÀY 1 | TẬP TRUNG TẠI SÂN BAY - MELBOURNE</b>
<br/>Quý khách tập trung tại điểm hẹn, HDV công ty Du Lịch Việt giúp quý khách làm thủ tục hàng không đáp chuyến bay đi Melbourne.
<br/><br/><b>NGÀY 2 | MELBOURNE – CITY TOUR (Ăn trưa, tối)</b>
<br/>Đến Melbourne, xe đưa đoàn tham quan: Toà Nhà Quốc Hội Bang Victoria, Nhà Thờ Thánh Patrick – ngôi nhà thờ cổ được xây dựng vào thế kỷ 19 với kiến trúc Gothic đặc trưng, China Town – khu phố người  Hoa nhộn nhịp.
<br/>Đoàn dùng cơm trưa. Sau bữa trưa, đoàn tiếp tục tham quan: Quảng trường Federation, Ga phố Flinders - nhà ga chính của Melbourne, địa điểm nổi tiếng có bề dày lịch sử với kiến trúc cận đại được lưu giữ đến tận bây giờ. 
<br/>Quý khách dùng cơm tối, sau đó về khách sạn nhận phòng nghỉ ngơi.
<br/><br/><b>NGÀY 3 | MELBOURNE – LỄ HỘI HOA TULIP (Ăn ba bữa)</b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn. Sau đó đoàn khởi hành tham quan lễ hội hoa Tulip. Diễn ra từ ngày 14/09 đến ngày 13/10, Tulip Festival 2019 – Lễ hội hoa Tulip lớn nhất trong năm được tổ chức tại Victoria, hứa hẹn sẽ mang đến cho du khách những trải nghiệm tuyệt vời trong không gian màu sắc của bạt ngàn hoa tulip.
<br/>Dùng cơm trưa, khởi hành về lại Melbourne, Quý khách tự do mua sắm tại khu chợ Queen Victoria - Nơi đây được xem là thánh địa của thực phẩm tươi, nơi mà những người nông dân Úc tự hào cung cấp những sản phẩm rau củ quả xanh mướt, hàng tấn thịt mới ra lò, và vô số loại thủy hải sản tươi ngon. (Đóng cửa vào thứ 2 và thứ 4 hàng tuần).
<br/>Quý khách dùng cơm tối, nhận phòng khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 4 | MELBOURNE - SYDNEY (Ăn ba bữa)</b>
<br/>Đoàn dùng điểm tâm tại khách, làm thủ tục trả phòng. Xe đưa đoàn ra sân bay đáp chuyến bay JQ508 (10:05 - 11:30) đi Sydney. Đến Sydney, Xe đưa đoàn đi dùng cơm tại nhà hàng, sau đó khởi hành tham quan: 
<br/>Ghế ngồi Bà Macquaries nơi du khách có thể lưu lại những hình ảnh đẹp nhất về thành phố biển Sydney.
<br/>Chụp ảnh lưu niệm tại Sydney Opera House với hình dáng đặc biệt nhưng  những chiếc vỏ sò nằm chồng lên nhau. Đây là một trong những kỳ quan về kiến trúc nổi tiếng trên thế giới.
<br/>Cầu cảng Sydney được đưa vào sử dụng từ năm 1932 với hình dáng như  một chiếc móc áo bằng sắt khổng lồ.
<br/>Darling Harbour – một cảng biển nhộn nhịp nơi có nhiều quán cà phê lãng  mạn ngoài trời nổi tiếng ở Sydney.
<br/>Quý khách dùng cơm chiều, về khách sạn nhận phòng nghỉ ngơi. Nghỉ đêm tại Sydney.
<br/><br/><b>NGÀY 5 | TỰ DO KHÁM PHÁ SYDNEY – SHOPPING (Ăn sáng)</b>
<br/>Quý khách dùng điểm tâm tại khách sạn. Tự do trải nghiệm khám phá thành phố và tự do mua sắm. (HDV sẽ hỗ trợ & hướng dẫn quý khách khám phá thành phố Sydney, không bao gồm xe, ăn trưa, ăn chiều, các chi phí cá nhân tham quan ngày này).
<br/>Quý khách về khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 6 | SYDNEY - VIỆT NAM (Ăn sáng)  </b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn và trả phòng. Xe đưa đoàn ra sân bay đáp chuyến bay về lại Việt Nam. Sau khi làm thủ tục nhập cảnh Việt Nam & nhận lại hành lý cá nhân, Trưởng đoàn Du lịch Việt chia tay Quý khách. Kết thúc chuyến tham quan.
',N'<br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay chặng quốc tế - Jetstar Airways: Tp.HCM – Melbourne //Sydney – Tp.HCM & Vé máy bay chặng nội địa: Melbourne – Sydney (Hàng không Jetstar hành lý 20 kg/01 kiện, có phục vụ ăn trên máy bay chặng quốc tế, lưu ý quý khách nhớ đem theo áo ấm trên máy bay vì hàng không không phuc vụ phát mền).
<br/>Vé máy bay khứ hồi nội địa: HAN – SGN – HAN.
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Lệ phí visa, thư mời du lịch Úc.
<br/>Khách sạn 3 – 4 sao tiêu chuẩn phòng đôi. Trong trường hợp khách đi 1 mình (lẻ nữ hoặc lẻ nam) thì phòng ba sẽ được bố trí khi cần thiết. Hoặc khách đi lẻ (1 mình) phải đóng phụ thu phòng đơn nếu không có người khách lẻ khác ghép.
<br/>Hướng dẫn viên từ Việt Nam (kiêm trưởng đoàn) theo đoàn suốt tuyến (đoàn từ 10 khách trở lên)
<br/>Ăn uống, xe đưa đón, và phí tham quan theo chương trình
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Tiền tips cho hướng dẫn viên Việt Nam đi cùng đoàn suốt tuyến và tài xế tại Úc.
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Chi phí khám sức khỏe theo yêu cầu của Lãnh sự quán (đối với khách hàng từ 70 tuổi trở lên)
<br/>Chi phí mua bảo hiểm lẻ (đối với khách hàng từ 70 tuổi trở lên)
<br/>Các chi phí không được đề cập trong mục bao gồm.
<br/>Đối với khách đi lẻ và không có khách khác ghép phòng, quý khách sẽ phải chịu phụ phí phòng đơn.
<br/>Chi phí dời ngày, đổi chặng, nâng hạng vé máy bay.',
'~/Images/HinhAnhTour/TourChauUc/tourCU3.jpg',40,15,41990000,40000000,'VNĐ',1);
INSERT INTO Tour VALUES(055,6,N'Du lịch Úc Melbourne - Sydney',
N'<b>Hành trình: Melbourne – Ballarat – Trải nghiệm dệt len lông cừu Creswick Wollen Mills & Alpaca
<br/>Số ngày: 6 ngày 5 đêm
<br/>Khởi hành: 22/10/2019
<br/>Vận chuyển: Vé máy bay khứ hồi và xe du lịch</b>
<br/><i>Du lịch Úc 6 ngày 5 đêm. Nếu bạn đang tìm kiếm sự phiêu lưu mạo hiểm, hay một kỳ nghỉ hướng về thiên nhiên, đồ ăn và rượu ngon, mua sắm, văn hóa nghệ thuật, hay để kết nối với nền văn hóa lâu đời nhất trên trái đất, thì tất cả đều không có gì giống như kỳ nghỉ tại nước Úc. Khám phá các thành phố, bang và vùng tự trị của Úc, những sự kiện và điểm đến độc đáo mang đậm tính biểu tượng. Hãy để Du Lịch Viêt giúp bạn lên kế hoạch hoàn hảo cho chuyến đi thú vị của riêng mình, bạn sẽ tìm thấy mọi thứ mình cần tại đây.</i>
',N'Quý khách tập trung tại điểm hẹn','8:35','10-22-2019','10-27-2019',N'6 ngày 5 đêm',
N'<br/><br/><b>NGÀY 1 | TẬP TRUNG TẠI SÂN BAY - MELBOURNE</b>
<br/>Quý khách tập trung tại điểm hẹn, HDV công ty Du Lịch Việt giúp quý khách làm thủ tục hàng không đáp chuyến bay đi Melbourne.
<br/><br/><b>NGÀY 2 | MELBOURNE – CITY TOUR (Ăn trưa, tối)</b>
<br/>Đến Melbourne, quý khách dung bữa trưa. Sau đó xe đưa đoàn tham quan: Toà Nhà Quốc Hội Bang  Victoria, Nhà Thờ Thánh Patrick – ngôi nhà thờ cổ được xây dựng vào thế kỷ 19 với kiến trúc Gothic đặc trưng, China Town – khu phố người  Hoa nhộn nhịp. Quảng trường Federation, Ga phố Flinders - nhà ga chính của Melbourne, địa điểm nổi tiếng có bề dày lịch sử với kiến trúc cận đại được lưu giữ đến tận bây giờ.
<br/>Quý khách dùng cơm tối, sau đó về khách sạn nhận phòng nghỉ ngơi.
<br/><br/><b>NGÀY 3 | MELBOURNE – BALLARAT – CRESWICK WOLLEN MILLS (Ăn ba bữa)</b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn. Sau đó đoàn khởi hành đến thị trấn Ballarat - nơi phong trào đào vàng của Victoria khởi phát, tham quan: 
<br/>Đồi mỏ vàng Sovereign Hill, tìm hiểu về nơi đã khám phá ra mỏ vàng năm 1851.
<br/>Bảo tàng Vàng, khám phá Mỏ Vàng nằm sâu trong lòng đất. Suối đãi vàng – Quý khách có thể thử thời vận bằng cách đãi vàng với các dụng cụ thô sơ.
<br/>Dùng cơm trưa, khởi hành về lại Melbourne, trên đường quý khách ghé tham quan Cánh đồng nho để làm rượu và Xưởng sản xuất tại đây. Sau đó, quý khách trải nghiệm dệt len lông cừu Creswick Wollen Mills & Alpaca và mua sắm những sản phẩm dệt len lông cừu tại đây.
<br/>Quý khách dùng cơm tối, nhận phòng khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 4 | MELBOURNE - SYDNEY (Ăn ba bữa)</b>
<br/>Đoàn dùng điểm tâm tại khách, làm thủ tục trả phòng. Xe đưa đoàn ra sân bay đáp chuyến bay đi Sydney. Đến Sydney, Xe đưa đoàn đi dùng cơm tại nhà hàng, sau đó khởi hành tham quan: 
<br/>Ghế ngồi Bà Macquaries nơi du khách có thể lưu lại những hình ảnh đẹp nhất về thành phố biển Sydney.
<br/>Chụp ảnh lưu niệm tại Sydney Opera House với hình dáng đặc biệt nhưng  những chiếc vỏ sò nằm chồng lên nhau. Đây là một trong những kỳ quan về kiến trúc nổi tiếng trên thế giới.
<br/>Cầu cảng Sydney được đưa vào sử dụng từ năm 1932 với hình dáng như  một chiếc móc áo bằng sắt khổng lồ.
<br/>Darling Harbour – một cảng biển nhộn nhịp nơi có nhiều quán cà phê lãng  mạn ngoài trời nổi tiếng ở Sydney.
<br/>Quý khách dùng cơm chiều, về khách sạn nhận phòng nghỉ ngơi. Nghỉ đêm tại Sydney.
<br/><br/><b>NGÀY 5 | TỰ DO KHÁM PHÁ SYDNEY – SHOPPING (Ăn sáng)</b>
<br/>Quý khách dùng điểm tâm tại khách sạn. Tự do trải nghiệm khám phá thành phố và tự do mua sắm. (HDV sẽ hỗ trợ & hướng dẫn quý khách khám phá thành phố Sydney, không bao gồm xe, ăn trưa, ăn chiều, các chi phí cá nhân tham quan ngày này).
<br/>Quý khách về khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 6 | SYDNEY - VIỆT NAM (Ăn sáng) </b> 
<br/>Quý khách dùng điểm tâm sáng tại khách sạn và trả phòng. Xe đưa đoàn ra sân bay đáp chuyến bay về lại Việt Nam. Sau khi làm thủ tục nhập cảnh Việt Nam & nhận lại hành lý cá nhân, Trưởng đoàn Du lịch Việt chia tay Quý khách. Kết thúc chuyến tham quan.
',N'<br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay chặng quốc tế - Jetstar Airways: Tp.HCM – Melbourne //Sydney – Tp.HCM & Vé máy bay chặng nội địa: Melbourne – Sydney (Hàng không Jetstar hành lý 20 kg/01 kiện, có phục vụ ăn trên máy bay chặng quốc tế, lưu ý quý khách nhớ đem theo áo ấm trên máy bay vì hàng không không phuc vụ phát mền).
<br/>Vé máy bay khứ hồi nội địa: HAN – SGN – HAN.
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Lệ phí visa, thư mời du lịch Úc.
<br/>Khách sạn 3 sao tiêu chuẩn phòng đôi. Trong trường hợp khách đi 1 mình (lẻ nữ hoặc lẻ nam) thì phòng ba sẽ được bố trí khi cần thiết. Hoặc khách đi lẻ (1 mình) phải đóng phụ thu phòng đơn nếu không có người khách lẻ khác ghép.
<br/>Hướng dẫn viên từ Việt Nam (kiêm trưởng đoàn) theo đoàn suốt tuyến (đoàn từ 10 khách trở lên)
<br/>Ăn uống, xe đưa đón, và phí tham quan theo chương trình
<br/>Quà tặng Du Lịch Việt.
<br/>Bảo hiểm du lịch quốc tế.
<br/><br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Tiền tips cho hướng dẫn viên Việt Nam đi cùng đoàn suốt tuyến và tài xế tại Úc.
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Chi phí khám sức khỏe theo yêu cầu của Lãnh sự quán & phí mua bảo hiểm lẻ (đối với khách hàng từ 70 tuổi trở lên)
<br/>Các chi phí không được đề cập trong mục bao gồm.
<br/>Đối với khách đi lẻ và không có khách khác ghép phòng, quý khách sẽ phải chịu phụ phí phòng đơn.
<br/>Chi phí dời ngày, đổi chặng, nâng hạng vé máy bay.','~/Images/HinhAnhTour/TourChauUc/tourCU4.jpg',45,10,41990000,399900000,'VNĐ',1);
INSERT INTO Tour VALUES(056,6,N'Tour du lịch Úc 6 ngày trượt tuyết mùa hè Melbourne',
N'Du lịch Úc mùa hè - Nếu bạn đang tìm kiếm sự phiêu lưu mạo hiểm, hay một kỳ nghỉ hướng về thiên nhiên, đồ ăn và rượu ngon, mua sắm, văn hóa nghệ thuật, hay để kết nối với nền văn hóa lâu đời nhất trên trái đất, thì tất cả đều không có gì giống như kỳ nghỉ tại nước Úc. Khám phá các thành phố, bang và vùng tự trị của Úc, những sự kiện và điểm đến độc đáo mang đậm tính biểu tượng. Hãy để Du Lịch Viêt giúp bạn lên kế hoạch hoàn hảo cho chuyến đi thú vị của riêng mình, bạn sẽ tìm thấy mọi thứ mình cần tại đây.
',N'Quý khách tập trung tại điểm hẹn.','13:00','10-10-2019','10-15-2019',N'6 ngày 5 đêm',
N'<b>NGÀY 1 | TẬP TRUNG TẠI SÂN BAY - MELBOURNE</b>
<br/>Quý khách tập trung tại điểm hẹn, HDV công ty Du Lịch Việt giúp quý khách làm thủ tục hàng không đáp chuyến bay đi Melbourne.
<br/><br/><b>NGÀY 2 | MELBOURNE – CITY TOUR        (Ăn trưa, ăn tối)</b>
<br/>Đến Melbourne, xe đưa đoàn tham quan: 
<br/>Toà Nhà Quốc Hội Bang Victoria
<br/>Nhà Thờ Thánh Patrick – ngôi nhà thờ cổ được xây dựng vào thế kỷ 19 với kiến trúc Gothic đặc trưng
<br/>China Town – khu phố người  Hoa nhộn nhịp
<br/>Đoàn dùng cơm trưa
<br/>Sau bữa trưa, đoàn tiếp tục tham quan: 
<br/>Quảng trường Federation
<br/>Ga phố Flinders - nhà ga chính của Melbourne, địa điểm nổi tiếng có bề dày lịch sử với kiến trúc cận đại được lưu giữ đến tận bây giờ
<br/>Quý khách dùng cơm tối, sau đó về khách sạn nhận phòng nghỉ ngơi.
<br/><br/><b>NGÀY 3 | MELBOURNE – NÚI TUYẾT BULLER          (Ăn sáng, ăn trưa tự túc, ăn tối)</b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn. Sau đó đoàn khởi hành đi tham quan núi tuyết Mt Buller – cách Melbourne 250 km về phí đông bắc.
<br/>Đến Buller quý khách dùng bữa với Fish & Chips (chi phí tự túc) - bữa ăn ưa thích & đặc sản của người dân Úc.
<br/>Sau đó, Quý khách khám phá Buller - nơi rất thu hút du khách vào mùa đông nước Úc nhờ lượng tuyết dày đặc trên 2m, rất vui và nhộn nhịp bởi có đến 22 đường xe dây cáp hoạt động để đưa khách lển đỉnh. (Quý khách tự túc chi phí thuê dụng cụ trượt tuyết). Đoàn khởi hành về lại Melbourne.
<br/>Quý khách dùng cơm tối, nhận phòng khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 4 | MELBOURNE - SYDNEY       (Ăn ba bữa)</b>
<br/>Đoàn dùng điểm tâm tại khách, làm thủ tục trả phòng. Xe đưa đoàn ra sân bay đáp chuyến bay JQ508 (10:05 - 11:30)  đi Sydney.
 <br/>Đến Sydney, xe đưa đoàn đi dùng cơm tại nhà hàng, sau đó khởi hành tham quan: 
<br/>Ghế ngồi Bà Macquaries nơi du khách có thể lưu lại những hình ảnh đẹp nhất về thành phố biển Sydney.
<br/>Chụp ảnh lưu niệm tại Sydney Opera House với hình dáng đặc biệt nhưng  những chiếc vỏ sò nằm chồng lên nhau. Đây là một trong những kỳ quan về kiến trúc nổi tiếng trên thế giới.
<br/>Cầu cảng Sydney được đưa vào sử dụng từ năm 1932 với hình dáng như  một chiếc móc áo bằng sắt khổng lồ.
<br/>Darling Harbour – một cảng biển nhộn nhịp nơi có nhiều quán cà phê lãng  mạn ngoài trời nổi tiếng ở Sydney.
<br/>Quý khách dùng cơm chiều, về khách sạn nhận phòng nghỉ ngơi. Nghỉ đêm tại Sydney.
<br/><br/><b>NGÀY 5 | TỰ DO KHÁM PHÁ SYDNEY – SHOPPING         (Ăn sáng)</b>
<br/>Quý khách dùng điểm tâm tại khách sạn. Tự do trải nghiệm khám phá thành phố và tự do mua sắm. (HDV sẽ hỗ trợ & hướng dẫn quý khách khám phá thành phố Sydney, không bao gồm xe, ăn trưa, ăn chiều, các chi phí cá nhân tham quan ngày này).
<br/>Quý khách về khách sạn nghỉ ngơi.
<br/><br/><b>NGÀY 6 | SYDNEY - VIỆT NAM         (Ăn sáng)   </b>
<br/>Quý khách dùng điểm tâm sáng tại khách sạn và trả phòng. Xe đưa đoàn ra sân bay đáp chuyến bay về lại Việt Nam.
<br/>Sau khi làm thủ tục nhập cảnh Việt Nam & nhận lại hành lý cá nhân, Trưởng đoàn Du lịch Việt chia tay Quý khách. Kết thúc chuyến tham quan.
 ',N'<br/><br/><b>GIÁ TOUR BAO GỒM:</b>
<br/>Vé máy bay chặng quốc tế - Jetstar Airways: Tp.HCM – Melbourne //Sydney – Tp.HCM & Vé máy bay chặng nội địa: Melbourne – Sydney (Hàng không Jetstar hành lý 20 kg/01 kiện, có phục vụ ăn trên máy bay chặng quốc tế, lưu ý quý khách nhớ đem theo áo ấm trên máy bay vì hàng không không phuc vụ phát mền).
<br/>Thuế, phụ phí xăng dầu, phí an ninh, phí sân bay phi trường 2 nước. 
<br/>Lệ phí visa, thư mời du lịch Úc 5,000,000 vnd (Lưu ý: visa Úc sẽ không dán vào hộ chiếu)
<br/>Khách sạn 3 sao tiêu chuẩn phòng đôi. Trong trường hợp khách đi 1 mình (lẻ nữ hoặc lẻ nam) thì phòng ba sẽ được bố trí khi cần thiết. Hoặc khách đi lẻ (1 mình) phải đóng phụ thu phòng đơn nếu không có người khách lẻ khác ghép.
<br/>Hướng dẫn viên từ Việt Nam (kiêm trưởng đoàn) theo đoàn suốt tuyến (đoàn từ 10 khách trở lên)
<br/>Ăn uống, xe đưa đón, và phí tham quan theo chương trình
<br/>Quà tặng Du Lịch Việt.
<br/><b>GIÁ TOUR KHÔNG BAO GỒM:</b>
<br/>Hộ chiếu còn hạn trên sáu tháng.
<br/>Chí phí cá nhân, hành lý quá cước và các chi phí phát sinh ngoài chương trình.
<br/>Tiền tips cho hướng dẫn viên Việt Nam đi cùng đoàn suốt tuyến và tài xế tại Úc: 1.500.000 vnđ/khách (đóng tại Việt Nam)
<br/>Chi phí dời ngày, đổi hành trình (đổi chặng), nâng hạng vé máy bay.
<br/>Chi phí khám sức khỏe theo yêu cầu của Lãnh sự quán & phí mua bảo hiểm lẻ (đối với khách hàng từ 70 tuổi trở lên)
<br/>Các chi phí không được đề cập trong mục bao gồm.
<br/>Đối với khách đi lẻ và không có khách khác ghép phòng, quý khách sẽ phải chịu phụ phí phòng đơn là 12.000.000 vnđ. Chi phí dời ngày, đổi chặng, nâng hạng vé máy bay.
<br/>Bảo hiểm du lịch quốc tế với mức đền bù 1.050.000.000 VND/ trường hợp.
','~/Images/HinhAnhTour/TourChauUc/tourCU5.jpg',25,10,53990000,50000000,'VNĐ',1);
/*
INSERT INTO Tour VALUES(057,6,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauUc/tourCU6.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(058,6,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauUc/tourCU7.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(059,6,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauUc/tourCU8.jpg',25,10,1300000,10000000,'VNĐ',1);
INSERT INTO Tour VALUES(060,6,N'Ten',N'Mô tả',N'Dia diem tt',':','--2019','--2019',N' ngày đêm',N'Lịch trình',N'Ghi chu','~/Images/HinhAnhTour/TourChauUc/tourCU9.jpg',25,10,1300000,10000000,'VNĐ',1);
*/

INSERT INTO KhachHang VALUES(1,N'Đặng Quốc Cường','~/Images/HinhAnhTour/KhachHang/Cuong.jpg','10-04-1998',1,N'Hải Phòng',N'Việt Nam','0978067286','quoccuong.aha@gmail.com');

INSERT INTO KhachHang VALUES(2,N'Đặng Bình Minh','~/Images/HinhAnhTour/KhachHang/Minh.jpg','6-24-1998',1,N'Hà Nội',N'Việt Nam','03789876796','binhminh@gmail.com');

INSERT INTO KhachHang VALUES(3,N'Trần Mạnh Hùng','~/Images/HinhAnhTour/KhachHang/Hung.jpg','06-04-1998',1,N'Tuyên Quan',N'Việt Nam','0839067286','hungborung@gmail.com');

--INSERT BANG SoChoCon

INSERT INTO SoChoCon VALUES(1,'001',15,5)
INSERT INTO SoChoCon VALUES(2,'002',25,5)
INSERT INTO SoChoCon VALUES(3,'003',20,10)
INSERT INTO SoChoCon VALUES(4,'004',25,5)
INSERT INTO SoChoCon VALUES(5,'005',30,5)
INSERT INTO SoChoCon VALUES(6,'006',25,5)
INSERT INTO SoChoCon VALUES(7,'007',25,10)
INSERT INTO SoChoCon VALUES(8,'008',15,5)
INSERT INTO SoChoCon VALUES(9,'009',10,3)
INSERT INTO SoChoCon VALUES(10,'010',25,5)
INSERT INTO SoChoCon VALUES(11,'011',15,7)
INSERT INTO SoChoCon VALUES(12,'012',30,70)
INSERT INTO SoChoCon VALUES(13,'013',20,10)
INSERT INTO SoChoCon VALUES(14,'014',25,10)
INSERT INTO SoChoCon VALUES(15,'019',15,5)
INSERT INTO SoChoCon VALUES(16,'021',20,10)
INSERT INTO SoChoCon VALUES(17,'022',25,10)
INSERT INTO SoChoCon VALUES(33,'023',20,10)
INSERT INTO SoChoCon VALUES(18,'024',10,5)
INSERT INTO SoChoCon VALUES(19,'028',40,5)
INSERT INTO SoChoCon VALUES(20,'029',35,15)
INSERT INTO SoChoCon VALUES(34,'030',55,10)
INSERT INTO SoChoCon VALUES(21,'031',25,10)
INSERT INTO SoChoCon VALUES(22,'032',25,10)
INSERT INTO SoChoCon VALUES(23,'040',20,10)
INSERT INTO SoChoCon VALUES(24,'041',10,5)
INSERT INTO SoChoCon VALUES(25,'042',20,5)
INSERT INTO SoChoCon VALUES(26,'043',20,8)
INSERT INTO SoChoCon VALUES(27,'044',20,10)
INSERT INTO SoChoCon VALUES(28,'052',15,10)
INSERT INTO SoChoCon VALUES(29,'053',35,10)
INSERT INTO SoChoCon VALUES(30,'054',40,15)
INSERT INTO SoChoCon VALUES(31,'055',45,10)
INSERT INTO SoChoCon VALUES(32,'056',25,10)
SELECT * FROM SoChoCon
SELECT * FROM Tour,SoChoCon Where Tour.MaTour=SoChoCon.MaTour and Tour.MaTour=001
SELECT * FROM BookTour



INSERT INTO KhachSan VALUES(1,N'Khách sạn Romana Resort & Spa Phan Thiết','~/Images/HinhAnhTour/KhachSan/ks1.jpg',N'Km 8, khu phố 1, Mũi Né, Bình Thuận','0252 3741 289',N'Khách sạn 4 sao',N'Tọa lạc trên một ngọn núi và bao quanh bởi biển, Romana Resort & Spa Phan Thiết mang đến cho khách hàng khung cảnh tuyệt đẹp của vịnh và núi. Khu nghỉ mát có 4 phòng Junior Suites, 28 biệt thự có bể bơi riêng và 64 phòng Deluxe. Tất cả các phòng đều nhìn ra đại dương và được thiết kế riêng tư sang trọng. Các Nhà hàng và Bar tại Romana Resort & Spa là một trong những nhà hàng và bar tốt nhất ở Mũi Né, Phan Thiết. Nhà hàng Panorama sẽ mang đến cho quý khách sự trải nghiệm những khoảnh khắc đáng nhớ khi vừa thưởng thức bữa tối tuyệt vời vừa ngắm nhìn cảnh hoàng hôn tuyệt đẹp. Nhà hàng phục vụ các thực đơn đa dạng, từ các món ăn khai vị tinh tế, salad nhiệt đới đến các loại hải sản tươi sống.')
INSERT INTO KhachSan VALUES(2,N'SÀI GÒN CÔN ĐẢO','~/Images/HinhAnhTour/KhachSan/ks2.jpg',N'18-24 Ton Duc Thang St., Con Dao Island, Ba Ria - Vung Tau Province, Vietnam ','(84)64 3830336 | Fax: (84)64 3830567',N'Khách sạn 3 sao',N'Khu du lịch Sài Gòn – Côn Đảo, là một đơn vị trực thuộc hệ thống Saigontourist, tọa lạc ngay trung tâm đảo Côn Sơn.
Khu du lịch có 120 phòng ngủ được trang bị hiện đại. Đội ngũ nhân viên chuyên nghiệp và tận tình. Khu du lịch gồm có hai khu: Khu biệt thự, có 36 phòng ngủ, được cải tạo từ các villa do người Pháp xây dựng vào những năm 1920, Từng là nơi ở và làm việc của các công chức người Pháp, với thảm cỏ xanh mượt và những tán cây xanh cổ thụ bao quanh các villa. Khu building, có 82 phòng ngủ được xây dựng vào năm 2009 với nét kiến trúc hiện đại, tất cả phòng đều hướng biển, trang thiết bị sang trọng…
Đội ngũ nhân viên Nhà hàng và Bếp trưởng của Nhà hàng Poulo Condore và nhà hàng Hoa Biển sẵn sàng phục vụ du khách các món ngon miền biển và các món đặc sản Côn Đảo.
Bên cạnh đó, Khu du lịch Sài Gòn – Côn Đảo sẵn sàng tổ chức các tour tham quan cho du khách như: Tour tham quan di tích lịch sử, Tour khám phá thiên nhiên. Ngoài ra, Khu du lịch Sài Gòn – Côn Đảo còn trang bị các tiện ích khác để  du khách được thoải mái và thuận tiện khi lưu trú với chúng tôi như: Hồ bơi, sân Tennis, Business centre, Karaoke, Massage, Wifi, Satelllite TV, In room safe box...
Khu du lịch Sài Gòn – Côn Đảo hân hạnh được đón tiếp và phục vụ du khách.')
INSERT INTO KhachSan VALUES(3,N'Khách sạn Sammy Vũng Tàu','~/Images/HinhAnhTour/KhachSan/ks3.jpg',N'157 Thùy Vân, Phường Thắng Tam, Thành phố Vũng Tầu, Bà Rịa - Vũng Tàu',' 1900 5454 40 - 028 3925 1055',N'Khách sạn 3 sao',N'Khách sạn Sammy tọa lạc trên bãi biển Thùy Vân, một nơi có bờ biển đẹp và sầm uất của Thành Phố Vũng Tàu. 
Khách sạn Sammy gồm 119 phòng ngủ với kiến trúc hài hoà được trang bị các tiện nghi tiện lợi sẽ làm hài lòng mọi du khách. Trong đó bao gồm 4 loại phòng là: Superior, Deluxe, Suite và President Suite. 
Với một vị trí thuận lợi là ở ngay biển Bãi Sau của Vũng Tàu, cộng với không khí trong lành, nhà hàng Sammy sẽ mang đến cho quý khách nhiều món ăn mang đậm tính truyền thống, thực đơn Âu Á cho quý khách nhiều sự lựa chọn.
')
INSERT INTO KhachSan VALUES(4,N'NHÀ HÀNG HÀ NỘI PALACE','~/Images/HinhAnhTour/KhachSan/ks4.jpg',N'564 Lạc Long Quân, Nhật Tân, Tây Hồ, Hà Nội','091 558 70 29',N'Khách sạn 4 sao',N'Nhà hàng với sự phục vụ nhiệt tình')
INSERT INTO KhachSan VALUES(5,N'NHÀ HÀNG ANH HÒA','~/Images/HinhAnhTour/KhachSan/ks5.jpg',N'429 Âu Cơ, Nhật Tân, Tây Hồ, Hà Nội','024 3718 6463',N'Khách sạn 3 sao',N'Nhà hàng với sự phục vụ nhiệt tình')
INSERT INTO KhachSan VALUES(6,N'Khách sạn Victoria Sapa Resort','~/Images/HinhAnhTour/KhachSan/ks6.jpg',N'Xuân Viên, TT. Sa Pa, Street, Lào Cai',' 0214 3871 522',N'Khách sạn 4 sao',N'Sapa nằm ở tỉnh Lào Cai, 380 km phía Tây Bắc của Hà Nội, gần với biên giới Trung Quốc. Nổi tiếng với những cánh đồng lúa bậc thang của nó và vùng cao nguyên, Sa Pa là nhà của hơn 30 sắc tộc miền núi đầy màu sắc và gần đỉnh cao nhất của Việt Nam, núi Fansipan. 
Khu nghỉ dưỡng Victoria Sapa Resort & Spa là khách sạn sang trọng bốn sao đầu tiên và duy nhất không chỉ ở Sapa mà còn cả khu vực Tây Bắc được khai trương vào tháng 3 năm 1998. Khách sạn được xây dựng theo thiết kế truyền thống của những ngôi nhà miền núi với gỗ và lò sưởi. Với điểm nhấn là trần nhà cao và xà ngang bằng gỗ, những họa tiết khảm đá cầu kì xuyên suốt kiến trúc đặc biệt vốn kết hợp giữa phong cách Pháp cổ điển với phong cách bản địa. Khách sạn hướng ra những ngôi làng, và được bao quanh bởi khung cảnh thiên nhiên xinh đẹp, tạo cảm giác rất khác biệt; hài hòa với thiên nhiên cũng như con người nơi đây.

Để đến được khách sạn, Quý khách cần đi tàu từ ga Hà Nội đến ga Lào Cai, đi tiếp một lần nữa bằng xe bus chừng gần 40km nữa để đến được Victoria Sapa Resort & Spa.  . ')
INSERT INTO KhachSan VALUES(7,N'KHÁCH SẠN FRIST EDEN','~/Images/HinhAnhTour/KhachSan/ks7.jpg',N'45 Hàng Bún, Nguyễn Trung Trực, Ba Đình, Hà Nội','024 3828 3896',N'Khách sạn 3 sao',N'Khách sạn FIRST EDEN  tọa lạc trên phố hàng Bún – con phố nằm trong trung tâm phố cổ Hà Nội, vị trí lí tưởng này đã đem tới cho FIRST EDEN một phong cách riêng biệt và đặc trưng Hà Nội. Nhà hàng sang trọng tại tầng 1, sức chưa hơn 100 khách với các món ăn Âu, Á và đặc biệt là các món ăn đặc trưng của  Hà Nội. Bạn mất 5 phút để đi bộ đến phố cổ Hà Nội và 30 phút để đi sân bay quốc tế Nội Bài. FIRST EDEN  là sự kết hợp hoàn hảo trong kiến trúc và trang trí mang phong cách ấm cúng phương Đông và sang trọng của phương Tây.')
INSERT INTO KhachSan VALUES(8,N'Khách sạn Furama Đà Nẵng','~/Images/HinhAnhTour/KhachSan/ks8.jpg',N'105 Võ Nguyên Giáp, Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng 550000','0236 3847 333',N'Khách sạn 5 sao',N'Furama Đà Nẵng là một khu nghỉ dưỡng 5 sao sang trọng, có uy tín và được xem là một trong những biểu tượng của ngành du lịch Việt Nam.')
INSERT INTO KhachSan VALUES(9,N'KHÁCH SẠN SUNSHINE SAPA','~/Images/HinhAnhTour/KhachSan/ks9.jpg',N'105 Thạch Sơn, tt. Sa Pa, Sapa, Lào Cai','024 39351409',N'Khách sạn 3 sao',N'Khách Sạn SunShine Sapa (Còn có tên gọi Khách là Sơn Trang) tọa lạc tại trung tâm thị trấn Sapa với 26 phòng tiện nghi sang trọng. Khách sạn nằm cách Hồ Sapa khoảng 300m, cách nhà thờ đá khoảng 700m và cách chợ Sapa chưa đầy 200m. Vị trí trung tâm giúp du khách thuận tiện di chuyển thăm quan và mua sắm.')
INSERT INTO KhachSan VALUES(10,N'KHÁCH SẠN MÂY SAPA','~/Images/HinhAnhTour/KhachSan/ks10.jpg',N'Số 139, đường Thạch Sơn, Sapa','028 3925 1055',N'Khách sạn 4 sao',N'Tọa lạc tại thị trấn Sa Pa, cách Ga cáp treo Fansipan Legend 5 km, May Sapa Hotel cung cấp chỗ nghỉ 3 sao và có khu vườn, quầy bar cũng như sảnh khách chung. Trong số các tiện nghi của khách sạn này còn có nhà hàng, lễ tân 24 giờ, dịch vụ phòng và Wi-Fi miễn phí. Chỗ nghỉ cũng cung cấp dịch vụ trợ giúp đặc biệt, dịch vụ đặt vé và dịch vụ thu đổi ngoại tệ cho khách.

Tất cả phòng nghỉ tại đây đều được trang bị máy điều hòa, truyền hình vệ tinh màn hình phẳng, tủ lạnh, ấm đun nước, bồn tắm, máy sấy tóc, bàn làm việc và tủ quần áo. Phòng tắm riêng có chậu rửa vệ sinh (bidet) và đồ vệ sinh cá nhân miễn phí.')
select * from KhachSan