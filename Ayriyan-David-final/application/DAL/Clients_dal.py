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

class Clients_dal:
    def __init__(self, class_id, client_first_name, client_last_name, email_address, 
                age):
        self.class_id = class_id
        self.client_first_name = client_first_name 
        self.client_last_name = client_last_name
        self.email_address = email_address  
        self.age = age
        
    def __repr__(self):
        return str(self.class_id) + ', '+ str(self.client_first_name) + ', ' + str(self.client_last_name) + ', ' + str(self.email_address) + ', ' + str(self.age)
        
    


# CALL PROCEDURE: getClientsWorkouts
def getClientsWorkouts_dal(global_role):
    workout_list = []
    # Check if the provided role is read-only
    if global_role == "modify":
        raise PermissionError("Error: Modify-only role does not have permission to view clients.")

    cnx = DatabaseConnection(role=global_role)
    cnx_db = cnx.__enter__()
    try:
        with cnx_db as cursor:
            cursor.callproc("getClientsWorkouts")
            for result in cursor.stored_results():
                for row in result.fetchall():
                    workout_list.append(row)
    except Error as e:
        print(f"Error calling procedure getClientsWorkouts: {e}")
        raise
    for workout in workout_list:
        print(workout)
    #cnx_db.__exit__()
    cnx_db.close()
    return workout_list


# CALL PROCEDURE: addStudentEntry
def addClientEntry_dal(first_name, last_name, email_address,age, global_role):
    
    # Check if the provided role is read-only
    if global_role == "read":
        raise PermissionError("Error: Read-only role does not have permission to add clients.")
    
    cnx2 = DatabaseConnection(role=global_role)
    cnx_db = cnx2.__enter__()
    with cnx_db as cursor:  # Use the 'with' context for automatic connection handling
        try:
            args = (first_name, last_name, email_address, age)
            print(first_name, last_name, email_address, age)
            cursor.callproc("addClientEntry", args)
            # Commit the transaction using the connection object
            cnx2.connection.commit()
        except Error as e:
            print(f"Error calling procedure addClientEntry: {e}")
            raise
    cnx_db.close()
