# Description

This image is based on [philipsahli/ubuntu:trusty](https://registry.hub.docker.com/u/philipsahli/ubuntu/) (with supervisor, sshd and newrelic agent).

# Run

## Start container
   See [`run.sh`](run.sh)

### Database
   For accessing the database the environment variables `DB_NAME`, `DB_USER` and `PASSWORD` are expected from linked container philipsahli/postgresql-test as `db`.

   This is at the moment not a very flexibel way to access the database and will be corrected soon.

# Use

## Start working with Odoo
   Open [Odoo](http://localhost:10080) at the choosen port (10080 in `run.sh`). Username for the administrator account is `admin` (Password: `admin`). After the first login you should change the password and create your own user with suitable privileges in Odoo.