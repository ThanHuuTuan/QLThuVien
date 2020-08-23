from sqlalchemy import Column, Integer, String, Float, Date, ForeignKey
from sqlalchemy.orm import relationship
from flask_admin.contrib.sqla import ModelView

from qltv import db, admin



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
    ngaysinh = Column(Date, nullable=False)
    diachi = Column(String(100), nullable=False)
    dienthoai = Column(Integer, nullable=False)
    bophan_id = Column(Integer, ForeignKey(BoPhan.id), nullable=False)
    bangcap_id = Column(Integer, ForeignKey(BangCap.id), nullable=False)
    chucvu_id = Column(Integer, ForeignKey(ChucVu.id), nullable=False)

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


class BoPhanModelView(ModelView):
    form_columns = ('tenbophan', )
class BangCapModelView(ModelView):
    form_columns = ('tenbangcap', )
class ChucVuModelView(ModelView):
    form_columns = ('tenchucvu', )
class TheLoaiModelView(ModelView):
    form_columns = ('ten', )

class SearchView(ModelView):
    column_searchable_list = ['tensach']

admin.add_view(SearchView(Sach, db.session))
# admin.add_view(SearchView(Sach, db.session))
# admin.add_view(TheLoaiModelView(TheLoai, db.session))
admin.add_view(ModelView(NhanVien, db.session))
# admin.add_view(BoPhanModelView(BoPhan, db.session))
# admin.add_view(BangCapModelView(BangCap, db.session))
# admin.add_view(ChucVuModelView(ChucVu, db.session))


db.create_all()
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