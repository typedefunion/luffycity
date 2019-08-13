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
        fields = ("id", "name", "course_img", "students", "lessons", "pub_lessons", "price", "teacher")