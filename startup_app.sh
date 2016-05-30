j2 /etc/odoo/openerp-server.conf | sponge /etc/odoo/openerp-server.conf

/usr/sbin/nginx -g "daemon off;" &

sudo -i -u odoo /opt/odoo-8.0.0/openerp-server --config /etc/odoo/openerp-server.conf -u base,web --without-demo=all
