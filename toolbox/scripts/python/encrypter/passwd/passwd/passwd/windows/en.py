#!/bin/python3

from cryptography.fernet import Fernet

def generate_key():
    # Generate a random key
    key = Fernet.generate_key()

    # Write the key to a file
    with open('.key.key', 'wb') as key_file:
        key_file.write(key)

def load_key():
    # Load the key from the file
    with open('.key.key', 'rb') as key_file:
        key = key_file.read()

    return key

def encrypt_password(password):
    # Load the key
    key = load_key()

    # Create the Fernet object
    f = Fernet(key)

    # Encrypt the password
    encrypted_password = f.encrypt(password.encode())

    # Write the encrypted password to a file
    with open('password.txt', 'wb') as password_file:
        password_file.write(encrypted_password)

    return encrypted_password

def decrypt_password():
    # Load the key
    key = load_key()

    # Create the Fernet object
    f = Fernet(key)

    # Load the encrypted password from a file
    with open('password.txt', 'rb') as password_file:
        encrypted_password = password_file.read()

    # Decrypt the password
    decrypted_password = f.decrypt(encrypted_password)

    return decrypted_password.decode()

# Generate a key
generate_key()

# Ask the user for a password to encrypt
password = input("Enter a password to encrypt: ")

# Encrypt the password and print the result
encrypted_password = encrypt_password(password)
print("Encrypted password:", encrypted_password.decode())

# Ask the user if they want to decrypt the password
decrypt = input("Do you want to decrypt the password? (y/n)")

if decrypt.lower() == 'y':
    # Decrypt the password and print the result
    decrypted_password = decrypt_password()
    print("Decrypted password:", decrypted_password)
else:
    print("Goodbye!")
