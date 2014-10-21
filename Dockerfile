FROM bl-ubuntu:trusty

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python-dateutil python-feedparser python-gdata python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil wget python-unittest2 python-mock python-jinja2 python-gevent 

RUN apt-get install -y moreutils

RUN wget https://github.com/odoo/odoo/archive/8.0.0.tar.gz
RUN tar -C /opt/ -zxvf 8.0.0.tar.gz  
RUN useradd -d /home/odoo -m odoo
RUN apt-get install python-setuptools
RUN easy_install pip
RUN pip install psycogreen==1.0
RUN pip install decorator==3.4.0
RUN pip install pyPdf
RUN pip install passlib

ADD openerp-server.conf /etc/odoo/
ADD startup_openerp.sh /

RUN mkdir -p /var/log/odoo
RUN chown odoo:odoo /var/log/odoo
RUN pip install j2cli

# gdata
RUN wget http://gdata-python-client.googlecode.com/files/gdata-2.0.18.tar.gz
RUN tar -zxvf gdata*
RUN cd gdata* && python setup.py install
RUN rm -rf gdata-*

# supervisord
ADD odoo.conf /etc/supervisor/conf.d/

# nginx
RUN apt-get install -y nginx
ADD nginx_odoo.conf /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/supervisor/conf.d/

EXPOSE 80
