from DAL.Classes_dal import Classes_Dal



class Classes_Bll:
    def __init__(self, classes_dal):
        self.classes_dal = classes_dal

    def get_classes(self):
        return self.classes_dal.read_classes()

    def create_classes(self, classes_id, teacher_id, room_number, student_grade,
                  subject, class_grade, student_id):
        self.classes_dal.add_classes(classes_id, teacher_id, room_number, student_grade,
                  subject, class_grade, student_id)