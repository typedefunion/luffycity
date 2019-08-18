from django.db import models
from luffyapi.utils.models import BaseModel
from ckeditor_uploader.fields import RichTextUploadingField
from django.conf import settings

class CourseCategory(BaseModel):
    """
    课程分类
    """
    name = models.CharField(max_length=64, unique=True, verbose_name="分类名称")
    class Meta:
        db_table = "ly_course_category"
        verbose_name = "课程分类"
        verbose_name_plural = "课程分类"


    def __str__(self):
        return "%s" % self.name



class Course(BaseModel):
    """
    专题课程
    """
    course_type = (
        (0, '付费'),
        (1, 'VIP专享'),
        (2, '学位课程')
    )
    level_choices = (
        (0, '初级'),
        (1, '中级'),
        (2, '高级'),
    )
    status_choices = (
        (0, '上线'),
        (1, '下线'),
        (2, '预上线'),
    )
    name = models.CharField(max_length=128, verbose_name="课程名称")
    course_img = models.ImageField(upload_to="course", max_length=255, verbose_name="封面图片", blank=True, null=True)
    course_video = models.FileField(upload_to="course", max_length=255, verbose_name="封面视频", blank=True, null=True)
    course_type = models.SmallIntegerField(choices=course_type,default=0, verbose_name="付费类型")
    # 普通的多行文本框
    # brief = models.TextField(max_length=2048, verbose_name="详情介绍", null=True, blank=True)

    # ckeditor的富文本框，需要导入from ckeditor_uploader.fields import RichTextUploadingField(继承了models)
    #  ### 富文本框的模型不需要数据迁移（认为你使用的还是models.TextField）
    brief = RichTextUploadingField(max_length=2048, verbose_name="详情介绍", null=True, blank=True)
    level = models.SmallIntegerField(choices= level_choices, default=1, verbose_name="难度等级")
    pub_date = models.DateField(verbose_name="发布日期", auto_now_add=True)
    period = models.IntegerField(verbose_name="建议学习周期(day)", default=7)
    attachment_path = models.FileField(max_length=128, verbose_name="课件路径", blank=True, null=True)
    status = models.SmallIntegerField(choices=status_choices, default=0, verbose_name="课程状态")
    course_category = models.ForeignKey("CourseCategory", on_delete=models.CASCADE, null=True, blank=True, verbose_name="课程分类")
    students = models.IntegerField(verbose_name="学习人数",default = 0)
    lessons = models.IntegerField(verbose_name="总课时数量",default = 0)
    pub_lessons = models.IntegerField(verbose_name="课时更新数量",default = 0)
    price = models.DecimalField(max_digits=6,decimal_places=2, verbose_name="课程原价",default=0)
    teacher = models.ForeignKey("Teacher",on_delete=models.DO_NOTHING, null=True, blank=True,verbose_name="授课老师")
    class Meta:
        db_table = "ly_course"
        verbose_name = "专题课程"
        verbose_name_plural = "专题课程"

    # 定义类方法获取对课程列表
    @property
    def lesson_list(self):
        """要展示到课程列表的可是信息"""
        lesson_list = self.courselessons.filter(is_show_list=True)[:4]
        data = []
        if len(lesson_list) < 1:
            return data
        # 由于查询出来的lesson_list是一个query_set类型，需要将其转换成能json的字典。
        for lesson in lesson_list:
            data.append({
                'id': lesson.id,
                'name': lesson.name,
                # 获取对应课程时长，再通过外键获取章节列表
                'chapter': lesson.course.chapter,
                'free_trail': True if lesson.free_trail else False,
            })
        return data

    # 定义类方法获取难度等级的文字描述
    @property
    def level_name(self):
        return self.level_choices[self.level][1]

    # 定义类方法获取富文本框的后端地址
    @property
    def real_brief(self):
        return self.brief.replace('/media', settings.CKEDITOR_UPLOAD_URL+'/media')

    # 定义类方法获取章节信息
    @property
    def chapter_list(self):
        data = []
        """1.获取当前课程的所有章节信息"""
        # CourseChapter.objects.filter(Course=pk)
        chapters = self.coursechapters.filter(is_show=True, is_delete=False).order_by('chapter')
        if len(chapters) > 0:

            for chapter in chapters:
                lesson_list = []
                """2.根据所有的章节，查找章节下面的所有课时"""
                chapter_lesson = chapter.coursesections.filter(is_show=True, is_delete=False)
                for lesson in chapter_lesson:
                    lesson_list.append({
                        'id': lesson.id,
                        'name': lesson.name,
                        'section_type': lesson.section_type,
                        'duration': lesson.duration,
                        'free_trail': True if lesson.free_trail else False
                    })
                data.append({
                    'chapter': chapter.chapter,
                    'name': chapter.name,
                    'lesson_list': lesson_list,
                })


        return data

    def __str__(self):
        return "%s" % self.name



class Teacher(BaseModel):
    """讲师、导师表"""
    role_choices = (
        (0, '讲师'),
        (1, '导师'),
        (2, '班主任'),
    )
    name = models.CharField(max_length=32, verbose_name="讲师title")
    role = models.SmallIntegerField(choices=role_choices, default=0, verbose_name="讲师身份")
    title = models.CharField(max_length=64, verbose_name="职位、职称")
    signature = models.CharField(max_length=255, verbose_name="导师签名", help_text="导师签名", blank=True, null=True)
    image = models.ImageField(upload_to="teacher", null=True, verbose_name = "讲师封面")
    brief = models.TextField(max_length=1024, verbose_name="讲师描述")

    class Meta:
        db_table = "ly_teacher"
        verbose_name = "讲师导师"
        verbose_name_plural = "讲师导师"

    def __str__(self):
        return "%s" % self.name


class CourseChapter(BaseModel):
    """课程章节"""
    course = models.ForeignKey("Course", related_name='coursechapters', on_delete=models.CASCADE, verbose_name="课程名称")
    chapter = models.SmallIntegerField(verbose_name="第几章", default=1)
    name = models.CharField(max_length=128, verbose_name="章节标题")
    summary = models.TextField(verbose_name="章节介绍", blank=True, null=True)
    pub_date = models.DateField(verbose_name="发布日期", auto_now_add=True)

    class Meta:
        db_table = "ly_course_chapter"
        verbose_name = "课程章节"
        verbose_name_plural = "课程章节"

    def __str__(self):
        return "%s:(第%s章)%s" % (self.course, self.chapter, self.name)


class CourseLesson(BaseModel):
    """课程课时"""
    section_type_choices = (
        (0, '文档'),
        (1, '练习'),
        (2, '视频')
    )
    chapter = models.ForeignKey("CourseChapter", related_name='coursesections', on_delete=models.CASCADE,verbose_name="课程章节")
    name = models.CharField(max_length=128,verbose_name = "课时标题")
    orders = models.PositiveSmallIntegerField(verbose_name="课时排序")
    section_type = models.SmallIntegerField(default=2, choices=section_type_choices, verbose_name="课时种类")
    section_link = models.CharField(max_length=255, blank=True, null=True, verbose_name="课时链接", help_text = "若是video，填vid,若是文档，填link")
    duration = models.CharField(verbose_name="视频时长", blank=True, null=True, max_length=32)  # 仅在前端展示使用
    pub_date = models.DateTimeField(verbose_name="发布时间", auto_now_add=True)
    free_trail = models.BooleanField(verbose_name="是否可试看", default=False)
    # 新增需要展示章节的控制字段
    is_show_list = models.BooleanField(verbose_name='是否展示到列表页中', default=False)
    # related_name是给外键的唯一标示，在整个项目中具有唯一性，否则报错
    course = models.ForeignKey('Course', related_name='courselessons', on_delete=models.CASCADE, verbose_name='课程名称')


    class Meta:
        db_table = "ly_course_lesson"
        verbose_name = "课程课时"
        verbose_name_plural = "课程课时"

    def __str__(self):
        return "%s-%s" % (self.chapter, self.name)