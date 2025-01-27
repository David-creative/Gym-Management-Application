from DAL.Clients_dal import getClientsWorkouts_dal, addClientEntry_dal


def role_change(role):
    global global_role
    if role == "Read ONLY":
        global_role = "read"
    elif role == "Modify ONLY":
        global_role = "modify"
        
    print(global_role)

def getClientsWorkouts():
    res2 = getClientsWorkouts_dal(global_role)
    return res2

def addClientEntry(first_name,  last_name, email_address, age):
    
    addClientEntry_dal(first_name, last_name, email_address,age, global_role)

