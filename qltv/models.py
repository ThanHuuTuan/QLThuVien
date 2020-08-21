from sqlalchemy import Column, Integer, String, Float, Date, ForeignKey
from sqlalchemy.orm import relationship
from flask_sqlalchemy import SQLAlchemy

from qltv import db

class BoPhan(db.Model):
    __tablename__ = "bophan"
    id = Column(Integer, primary_key=True, autoincrement=True)
    tenbophan = Column(String(50), nullable=False)
    nhanviens = relationship('NhanVien', backref='bophan', lazy=True)

    def __str__(self):
        return self.tenbophan

class NhanVien(db.Model):
    __tablename__ = "nhanvien"
    id = Column(Integer, primary_key=True, autoincrement=True)
    hoten = Column(String(50), nullable=False)
    ngaysinh = Column(Date, nullable=False)
    diachi = Column(String(100), nullable=False)
    dienthoai = Column(Integer, nullable=False)
    tenbangcap = Column(String(50))
    tenchucvu = Column(String(50))
    bophan_id = Column(Integer, ForeignKey(BoPhan.id), nullable=False)

    def __str__(self):
        return self.hoten

class TheLoai(db.Model):
    __tablename__="theloai"
    id = Column(Integer, primary_key=True,autoincrement=True)
    ten = Column(String(50), nullable=False)
    sachs = relationship('Sach', backref='theloai', lazy=True)
    def __str__(self):
        return self.ten

class Sach(db.Model):
    __tablename__="sach"
    id = Column(Integer, primary_key=True, autoincrement=True)
    tensach = Column(String(50), nullable=False)
    namxb = Column(String(5), nullable=False)
    nhaxb = Column(String(50), nullable=False)
    tacgia = Column(String(50), nullable=False)
    ngaynhap = Column(Date, nullable=False)
    trigia = Column(Float, default=0)
    nguoitiepnhan = Column(String(50), nullable=False)
    theloai_id = Column(Integer, ForeignKey(TheLoai.id), nullable=False)

    def __str__(self):
        return self.tensach

#
# class PhieuMuonSach(db.Model):
#     __tablename__="phieumuonsach"
#
# class PhieuTraSach(db.Model):
#     __tablename__="phieutrasach"
#
# class PhieuThuTienPhat(db.Model):
#     __tablename__="phieuthutienphat"
#
# class GhiNhanMatSach(db.Model):
#     __tablename__="ghinhanmatsach"
#
# class ThanhLySach(db.Model):
#     __tablename__="thanhlysach"
#
# class BaoCaoTheoTheLoai(db.Model):
#     __tablename__="baocaotheotheloai"
#
# class BaoCaoSachTraTre(db.Model):
#     __tablename__="baocaosachtratre"
#
# class BaoCaoNoTienPhat(db.Model):
#     __tablename__="baocaonotienphat"