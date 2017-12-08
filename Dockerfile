FROM philipsahli/ubuntu:trusty

RUN apt-get update
RUN apt-get install -y python-dateutil python-feedparser python-gdata python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil wget python-unittest2 python-mock python-jinja2 python-gevent 

RUN apt-get install -y moreutils

RUN wget -nv https://github.com/odoo/odoo/archive/8.0.0.tar.gz && tar -C /opt/ -zxvf 8.0.0.tar.gz  && useradd -d /home/odoo -m odoo
RUN apt-get install python-setuptools
RUN easy_install pip && pip install psycogreen==1.0 && pip install decorator==3.4.0 && pip install pyPdf && pip install passlib  && pip install requests
ADD openerp-server.conf /etc/odoo/
ADD startup_app.sh /
RUN chmod 755 /startup_app.sh

RUN mkdir -p /var/log/odoo && chown odoo:odoo /var/log/odoo && pip install j2cli

# gdata
RUN wget http://gdata-python-client.googlecode.com/files/gdata-2.0.18.tar.gz && tar -zxvf gdata* && cd gdata* && sudo python setup.py install && rm -rf gdata-*

RUN apt-get install -y nginx
ADD nginx_odoo.conf /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

EXPOSE 80
