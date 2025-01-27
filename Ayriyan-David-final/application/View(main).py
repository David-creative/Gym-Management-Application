import PySimpleGUI as sg
from BLL.Clients_bll import getClientsWorkouts, addClientEntry, role_change

# The only file that is mandatory is the main file.  This should be the entry point into your application.


# Function to fetch data and update the table
def update_table():
    try:
        data = getClientsWorkouts()
        # `data` must be a list of dictionaries or lists with these keys
        #table_data = [[item["first_name"], item["last_name"], item["email"], item["subject"]] for item in data]
        window["-TABLE-"].update(values=data)
    except Exception as e:
        sg.popup_error(f"Error fetching data: {e}")

# Function to add a new client
def add_client(values):
    try:
        # Collect input data
        first_name = values["-FIRST_NAME-"]
        last_name = values["-LAST_NAME-"]
        email = values["-EMAIL-"]
        age = values["-AGE-"]

        # Basic validation
        if not all([first_name, last_name, email, age]):
            sg.popup_error("All fields are required!")
            return

        # Insert into database
        addClientEntry(first_name, last_name, email, age)
        sg.popup("Client added successfully!")

        # Refresh the table to reflect new data
        # update_table()
    except Exception as e:
        sg.popup_error(f"Error adding client: {e}")

# Define the layout
layout = [
    # Form for adding radio buttons choosing between Read-Only, and Modify user
    [sg.Radio('Read Only', "RADIO1", default=True)],
    [sg.Radio('Modify Only', "RADIO1")],
    [sg.Button('Submit', key="-SUBMIT-")],
    
    # Form for adding a client
    [sg.Text("First Name"), sg.Input(key="-FIRST_NAME-", size=(15, 1))],
    [sg.Text("Last Name"), sg.Input(key="-LAST_NAME-", size=(15, 1))],
    [sg.Text("Email"), sg.Input(key="-EMAIL-", size=(25, 1))],
    [sg.Text("Age"), sg.Input(key="-AGE-", size=(12, 1))],
    [sg.Button("Add Client", key="-ADD-")],
    
    # Table for displaying students and their subjects
    [sg.Table(
        headings=["First Name", "Last Name", "Email", "Workout"],
        values=[],  # Initially empty
        key="-TABLE-",
        auto_size_columns=False,
        col_widths=[15, 15, 25, 15],  # Adjust column widths
        justification="center",
        num_rows=10,
    )],
    [sg.Button("Refresh Table", key="-REFRESH-")],
]

# Create the window
window = sg.Window("Gym Client Management System", layout, resizable=True)

# Event loop
while True:
    event, values = window.read()
    if event == sg.WINDOW_CLOSED:  # Close the window
        break
    elif event == "-REFRESH-":  # Fetch and refresh table data
        update_table()
    elif event == "-ADD-":  # Add a new student
        add_client(values)
    elif event == '-SUBMIT-': # For radio buttons options
        if values[0]:
            role_change("Read ONLY")
            sg.popup("Read Only Selected")
            #print('Read Only Selected')
        else:
            role_change("Modify ONLY")
            sg.popup("Modify Only Selected")
            #print('Modify Only Selected')

window.close()