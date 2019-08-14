from rest_framework import serializers
from .models import CourseCategory, Course, Teacher

class CourseCategoryModelSerializer(serializers.ModelSerializer):
    """课程分类的序列化器"""
    class Meta:
        model = CourseCategory
        fields = ('id', 'name')

class CourseTeacherModelSerializer(serializers.ModelSerializer):
    """课程所属老师的序列化器"""
    class Meta:
        model = Teacher
        fields = ['name', 'title', 'signature']

class CourseModelSerializer(serializers.ModelSerializer):
    """课程信息的序列化器"""
    # teacher = CourseTeacherModelSerializer(many=True)    # 多个老师对应一个课程时，拿到的值为一个列表
    teacher = CourseTeacherModelSerializer()    # 序列化器的嵌套，需要实例化，拿到的值为一个字典
    class Meta:
        model = Course
        fields = ("id", "name", "course_img", "students", "lessons", "pub_lessons", "price", "teacher", "lesson_list")
    """
    我们在要显示老师的详细信息时，使用的是序列化器嵌套，这样子会将老师的所有信息都嵌套进去。
    但我们要将课程信息展示出来的时候，并不需要全部都拿出来，只有满足条件的才需要拿到，因此我们采用在课程信息的模型类中自定义类方法的方式
    """