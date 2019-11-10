from validate_email import validate_email

def validate_list_with_searchString(listitem, searchString):
    print("Length of list search: " + str(listitem.count(searchString)))
    print("Length of List: " + str(len(listitem)))
    if listitem.count(searchString) == len(listitem):
       print("list length is equal")
       return True
    else:
       print("Not equal")
       return False

def check_validate_email(email):
    is_valid = validate_email(email)
    return is_valid
