(docker run -i -d -p 10056:5432 -e DB_NAME=odoo -e DB_USER=odoo -e PASSWORD=odoo --name odoo-db philipsahli/postgresql-test || echo "already running") && docker start odoo-db
#(docker run -i -p 10080:80 --link odoo-db:db -t --name odoo docker-odoo /bin/bash || echo "already running") && docker start odoo
(docker run -i -d -p 80 --link odoo-db:db -t --name odoo philipsahli/odoo:9 || echo "already running") && docker start odoo
