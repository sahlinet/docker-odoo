(docker run -i -d -p 10056:5432 -e DB_NAME=odoo -e DB_USER=odoo -e PASSWORD=odoo --name odoo-db postgresql-test || echo "already running") && docker start odoo-db
#(docker run -i -p 10080:80 --link odoo-db:db -t --name odoo docker-odoo /bin/bash || echo "already running") && docker start odoo
(docker run -i -d -p 10222:22 -p 10080:80 --link odoo-db:db -t -e SSH_PUBKEY=$SSH_PUBKEY --name odoo docker-odoo || echo "already running") && docker start odoo
