from rest_framework.pagination import PageNumberPagination


class CustomCourseListPageNumberPagination(PageNumberPagination):
    """分页器类"""
    # page_query_param = ''   # 地址上面代表页码的变量名
    page_size = 5  # 每一页显示的数据量，不设置页码，则不进行分页
    page_size_query_param = 'size'  # 允许客户端通过指定的参数名来设置每一页数据量的大小，默认是size
    max_page_size = 10  # 限制每一页最大展示的数据量