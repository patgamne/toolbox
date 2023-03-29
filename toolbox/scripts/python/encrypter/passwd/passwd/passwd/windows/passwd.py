import random
import string

# Define all possible characters for the password
characters = string.ascii_letters + string.digits + string.punctuation

# Generate a 12-character random password
password = ''.join(random.choice(characters) for i in range(12))

# Print the password
print(password)
