from flask_admin.contrib.sqla import ModelView
from qltv import admin, db
from qltv.models import Sach, TheLoai, NhanVien, BoPhan, BangCap, ChucVu


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

# admin.add_view(SearchView(Sach, db.session, name="Sách"))
# admin.add_view(TheLoaiModelView(TheLoai, db.session))
admin.add_view(ModelView(NhanVien, db.session, name="Nhân viên"))
admin.add_view(BoPhanModelView(BoPhan, db.session, name="Bộ phận"))
admin.add_view(BangCapModelView(BangCap, db.session, name="Bằng cấp"))
admin.add_view(ChucVuModelView(ChucVu, db.session, name="Chức vụ"))