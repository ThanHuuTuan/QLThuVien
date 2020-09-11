from datetime import datetime

from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey, Boolean, Enum
from sqlalchemy.orm import relationship
from flask_login import UserMixin
from qltv import db
import enum





class BoPhan(db.Model):
    __tablename__ = "bophan"
    id = Column(Integer, primary_key=True, autoincrement=True)
    tenbophan = Column(String(50), nullable=False)
    nhanviens = relationship('NhanVien', backref='bophan', lazy=True)


    def __str__(self):
        return self.tenbophan

class BangCap(db.Model):
    __tablename__ = "bangcap"
    id = Column(Integer, primary_key=True, autoincrement=True)
    tenbangcap = Column(String(50), nullable=False)
    nhanviens = relationship('NhanVien', backref='bangcap', lazy=True)
    def __str__(self):
        return self.tenbangcap

class ChucVu(db.Model):
    __tablename__ = "chucvu"
    id = Column(Integer, primary_key=True, autoincrement=True)
    tenchucvu = Column(String(50), nullable=False)
    nhanviens = relationship('NhanVien', backref='chucvu', lazy=True)
    def __str__(self):
        return self.tenchucvu



class NhanVien(db.Model):
    __tablename__ = "nhanvien"
    id = Column(Integer, primary_key=True, autoincrement=True)
    hoten = Column(String(50), nullable=False)
    ngaysinh = Column(DateTime, nullable=False)
    diachi = Column(String(100), nullable=False)
    dienthoai = Column(Integer, nullable=False)
    bophan_id = Column(Integer, ForeignKey(BoPhan.id), nullable=False)
    bangcap_id = Column(Integer, ForeignKey(BangCap.id), nullable=False)
    chucvu_id = Column(Integer, ForeignKey(ChucVu.id), nullable=False)
    creator_id = Column(Integer, ForeignKey('user.id'))

    def __str__(self):
        return self.hoten


class UserRole(enum.Enum):
    ADMIN = 1
    ThuThu = 2
    THuKho = 3
    ThuQuy = 4


class User(db.Model, UserMixin):
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    active = Column(Boolean, default=True)
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    use_role = Column(Enum(UserRole), default=UserRole)
    nhanvien = relationship(NhanVien, backref='user', lazy=True)


class TheLoai(db.Model):
    __tablename__="theloai"
    id = Column(Integer, primary_key=True,autoincrement=True)
    ten = Column(String(50), nullable=False)
    sachs = relationship('Sach', backref='theloai', lazy=True)
    ctmuontheotheloai = relationship('BaoCaoCTMuonTheoTheLoai', backref='theloai', lazy=True)

    def __str__(self):
        return self.ten

class Sach(db.Model):
    __tablename__="sach"
    id = Column(Integer, primary_key=True, autoincrement=True)
    tensach = Column(String(50), nullable=False)
    namxb = Column(String(5), nullable=False)
    nhaxb = Column(String(50), nullable=False)
    tacgia = Column(String(50), nullable=False)
    ngaynhap = Column(DateTime, default = datetime.now())
    trigia = Column(Integer, default=0)
    tinhtrang = Column(Boolean, default=True)
    theloai_id = Column(Integer, ForeignKey(TheLoai.id), nullable=False)
    # ctsachtratre = relationship('BaoCaoCTSachTraTre', backref='baocaosachtratre', lazy=True)
    thanhlysach = relationship('ThanhLySach', backref='sach', lazy=True)

    def __str__(self):
        return self.tensach

class LoaiDocGia(db.Model):
    __tablename__="loaidocgia"
    id = Column(Integer, primary_key=True,autoincrement=True)
    tenloaidocgia = Column(String(50), nullable=False)
    TheDocGia = relationship('TheDocGia', backref='loaidocgia', lazy=True)

    def __str__(self):
        return self.tenloaidocgia

class TheDocGia(db.Model):
    __tablename__="thedocgia"
    id = Column(Integer, primary_key=True, autoincrement=True)
    hoten = Column(String(50), nullable=False)
    diachi = Column(String(100), nullable=False)
    email = Column(String(50), nullable=False)
    ngaysinh = Column(DateTime, nullable=False)
    ngaylapthe = Column(DateTime, default = datetime.now())
    loaidocgia_id = Column(Integer, ForeignKey(LoaiDocGia.id), nullable=False)
    phieumuon = relationship('PhieuMuonSach', backref='thedocgia', lazy=True)

    def __str__(self):
        return self.hoten

class BaoCaoMuonTheoTheLoai(db.Model):
    __tablename__="baocaomuontheotheloai"
    id = Column(Integer, primary_key=True, autoincrement=True)
    thang = Column(Integer, nullable=False)
    tongluotmuon = Column(Integer, nullable=False)
    ctmuontheotheloai = relationship('BaoCaoCTMuonTheoTheLoai', backref='baocaomuontheotheloai', lazy=True)



class BaoCaoCTMuonTheoTheLoai(db.Model):
    __tablename__="baocaoctmuontheotheloai"
    baocaomuontheotheloai_id = Column(Integer, ForeignKey(BaoCaoMuonTheoTheLoai.id), primary_key=True)
    theloai_id =  Column(Integer, ForeignKey(TheLoai.id), primary_key=True)
    tentheloai = Column(String(100), nullable=False)
    soluotmuon = Column(Integer, default=0)
    tile = Column(Float, nullable=False)

# class BaoCaoSachTraTre(db.Model):
#     __tablename__="baocaosachtratre"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     ngay = Column(Integer, nullable=False)
#     ctsachtratre = relationship('BaoCaoCTSachTraTre', backref='baocaosachtratre', lazy=True)
#
# class BaoCaoCTSachTraTre(db.Model):
#     __tablename__="baocaoctsachtratre"
#     baocaosachtratre_id = Column(Integer, ForeignKey(BaoCaoSachTraTre.id), primary_key=True)
#     sach_id = Column(Integer, ForeignKey(Sach.id), primary_key=True)
#     tensach = Column(String(100), nullable=False)
#     ngaymuon = Column(DateTime , nullable=False)
#     songaytratre = Column(Integer, nullable=False)


class BaoCaoNoTienPhat(db.Model):
    __tablename__="baocaonotienphat"
    id = Column(Integer, primary_key=True, autoincrement=True)
    ngay = Column(Integer, nullable=False)
    ctnotienphat = relationship('BaoCaoCTNoTienPhat', backref='baocaonotienphat', lazy=True)

class BaoCaoCTNoTienPhat(db.Model):
    __tablename__="baocaoctnotienphat"
    baocaonotienphat_id = Column(Integer, ForeignKey(BaoCaoNoTienPhat.id), primary_key=True)
    thedocgia_id = Column(Integer, ForeignKey(TheDocGia.id), primary_key=True)
    tendocgia = Column(String(100), nullable=False)
    tienno = Column(Integer, nullable=False)

class PhieuMuonSach(db.Model):
    __tablename__="phieumuonsach"
    id = Column(Integer, primary_key=True, autoincrement=True)
    thedocgia_id = Column(Integer, ForeignKey(TheDocGia.id))
    ngaymuon = Column(DateTime , default = datetime.now())
    ngaytra = Column(DateTime , nullable=False)

class CTPhieuMuonSach(db.Model):
    __tablename__="ctphieumuonsach"
    phieumuon_id = Column(Integer, ForeignKey(PhieuMuonSach.id), primary_key=True)
    sach_id = Column(Integer, ForeignKey(Sach.id), primary_key=True)


class PhieuTraSach(db.Model):
    __tablename__="phieutrasach"
    id = Column(Integer, primary_key=True, autoincrement=True)
    phieumuon_id = Column(Integer, ForeignKey(PhieuMuonSach.id))
    thedocgia_id = Column(Integer, ForeignKey(TheDocGia.id))
    ngaytra = Column(DateTime , default = datetime.now())
    tienphatkynay = Column(Integer, nullable=False)




class CTPhieuTraSach(db.Model):
    __tablename__="ctphieutrasach"
    phieutra_id = Column(Integer, ForeignKey(PhieuTraSach.id), primary_key=True)
    sach_id = Column(Integer, ForeignKey(Sach.id), primary_key=True)
    tinhtrang = Column(Integer, nullable=False)
    songaymuon = Column(Integer, nullable=False)
    tienphat = Column(Integer, nullable=False)


class PhieuThuTienPhat(db.Model):
    __tablename__="phieuthutienphat"
    id = Column(Integer, primary_key=True, autoincrement=True)
    tienno = Column(Integer, nullable=False)
    tienthu = Column(Integer, nullable=False)
    tienconlai = Column(Integer, nullable=False)
    thedocgia_id = Column(Integer, ForeignKey(TheDocGia.id))
    phieutra_id = Column(Integer, ForeignKey(PhieuTraSach.id))


class GhiNhanMatSach(db.Model):
    __tablename__="ghinhanmatsach"
    id = Column(Integer, primary_key=True, autoincrement=True)
    sach_id = Column(Integer, ForeignKey(Sach.id))
    ngayghinhan = Column(DateTime, default=datetime.now())
    thedocgia_id = Column(Integer, ForeignKey(TheDocGia.id))
    tienphat = Column(Integer, nullable=False)

class ThanhLySach(db.Model):
    __tablename__="thanhlysach"
    id = Column(Integer, primary_key=True, autoincrement=True)
    ngaythanhly = Column(DateTime, default=datetime.now())
    sach_id = Column(Integer, ForeignKey(Sach.id))
    lydo = Column(String(100), nullable=False)



if __name__ == '__main__':
    db.create_all()


# class GhiNhanMatSach(db.Model):
#     __tablename__="ghinhanmatsach"
#
# class ThanhLySach(db.Model):
#     __tablename__="thanhlysach"
#
