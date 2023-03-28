#!/bin/python3


from cryptography.fernet import Fernet

def load_key():
    # Load the key from the file
    with open('.key.key', 'rb') as key_file:
        key = key_file.read()

    return key

def decrypt_password(encrypted_password):
    # Load the key
    key = load_key()

    # Create the Fernet object
    f = Fernet(key)

    # Decrypt the password
    decrypted_password = f.decrypt(encrypted_password.encode())

    return decrypted_password.decode()

# Load the encrypted password from the user
encrypted_password = input("Enter the encrypted password: ")

# Decrypt the password and print the result
decrypted_password = decrypt_password(encrypted_password)
print("Decrypted password:", decrypted_password)
