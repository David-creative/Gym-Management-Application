from DAL.Coaches_dal import Coaches_Dal


class Coaches_Bll:
    def __init__(self, coaches_dal):
        self.coaches_dal = coaches_dal

    def get_coaches(self):
        return self.coaches_dal.read_coaches()

    def create_coaches(self, coach_first_name, coach_last_name, coach_email):
        
        self.coaches_dal.add_teacher(coach_first_name, coach_last_name, coach_email)