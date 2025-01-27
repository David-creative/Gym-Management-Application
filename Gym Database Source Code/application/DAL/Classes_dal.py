import mysql.connector
from mysql.connector import Error


class DatabaseConnection:
    def __init__(self, role="admin"):
        """
        Initialize the connection settings based on the role.
        """
        self.config = self.get_config(role)
        self.connection = None

    def get_config(self, role):
        """
        Returns the database connection config based on the user role.
        """
        roles = {
            'read': {
                'user': 'read_only',
                'password': 'read1234',
                'host': 'localhost',
                'database': 'Gym'
            },
            "modify": {
                "user": "modify_user",
                "password": "modify1234",
                "host": "localhost",
                "database": "Gym"
            },
            "admin": {
                "user": "admin_user",
                "password": "admin1234",
                "host": "localhost",
                "database": "Gym"
            }
        }
        return roles.get(role)

    def __enter__(self):
        """
        Opens the database connection.
        """
        try:
            self.connection = mysql.connector.connect(**self.config)
            return self.connection.cursor()
        except Error as e:
            print(f"Error connecting to the database: {e}")
            raise

            
##################################################          

class Classes_dal:
    def __init__(self, day_of_week, client_performance, workout, client_id, coach_id):
        self.day_of_week = day_of_week
        self.client_performance = client_performance
        self.workout = workout
        self.client_id = client_id
        self.coadch_id = coach_id
