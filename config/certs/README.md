# Instructions to generate a self-signed SSL certificate for use with local development. Adapted from https://gist.github.com/ethicka/27c36c975a5c2cbbd1874bc78bab61c4. This will allow you to run the site over SSL locally as well the WSS webpack-dev-server locally, and access the site from your internal network including a VM (if you setup the static IP address as well)

## Before you begin, install `mkcert` with `homebrew`:

1. `$ brew install mkcert`
2. `$ mkcert -install`

## Generate a certificate for `localhost`:

### Navigate to the `config/certs/localhost` directory and run the following:

`$ sudo openssl genrsa -out localhost.key 2048`

`$ sudo openssl rsa -in localhost.key -out localhost.key.rsa`

`$ sudo openssl req -new -key localhost.key.rsa -subj /CN=localhost -out localhost.csr -config localhost.conf`

`$ sudo openssl x509 -req -extensions v3_req -days 3650 -in localhost.csr -signkey localhost.key.rsa -out localhost.crt -extfile localhost.conf`

### Add the certificate to your macOS Keychain:

`$ sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain localhost.crt`

## Generate a certificate for a local, static IP address (e.g.: `192.168.86.200`). _This is only really necessary if you want to test the site locally in a VM such as Parallels_:

### Navigate to the `config/certs/static` directory and edit the `static.conf` file replacing `192.168.86.200` with whatever static IP you are going to use. Save the changes and run the following in terminal from the `config/certs/static` directory:

`$ sudo openssl genrsa -out static.key 2048`

`$ sudo openssl rsa -in static.key -out static.key.rsa`

`$ sudo openssl req -new -key static.key.rsa -subj /CN=RFC1918 -out static.csr -config static.conf`

`$ sudo openssl x509 -req -extensions v3_req -days 3650 -in static.csr -signkey static.key.rsa -out static.crt -extfile static.conf`

### Add the certificate to your macOS Keychain:

`$ sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain static.crt`

### Update the `HOST` property of your `.env` file with the static IP address you used above.

### Add the certificate to Windows:

1. Start Parallels / Windows 10
2. Locate the certificate in the shared drive (or copy it into the Windows share)
3. Right click on the certificate `static.crt` file and click on `Install Certificate`
4. Select `Current User` as the `Store Location` and click `Next`
5. Select `Place all certificates in the following store` and click the `Browse...` button
6. Select the `Trusted Root Certification Authorities` as the certificate store and click `Next`
7. Click `Finish`

## At the end of the process you should have the following folder structure):

    - config
      - certs
        - localhost
          - localhost.conf
          - localhost.crt
          - localhost.csr
          - localhost.key
          - localhost.key.rsa
        - static
          - static.conf
          - static.crt
          - static.csr
          - static.key
          - static.key.rsa

## DON'T FORGET TO ADD THE ABOVE GENERATED FILES TO YOUR `.gitignore` FILE!!!
