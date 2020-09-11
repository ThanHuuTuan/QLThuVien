from qltv import admin, db
from qltv.models import Sach, TheLoai, NhanVien, BoPhan, BangCap, ChucVu

def read_sachs():
    return Sach.query.all()