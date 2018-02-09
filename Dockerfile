FROM philipsahli/ubuntu:trusty

RUN apt-get update
RUN apt-get install -y python-dateutil python-feedparser python-gdata python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil wget python-unittest2 python-mock python-jinja2 python-gevent unzip

RUN apt-get install -y moreutils

RUN cd /opt && wget -nv https://nightly.odoo.com/8.0/nightly/src/odoo_8.0.latest.zip && unzip odoo_8.0.latest.zip && useradd -d /home/odoo -m odoo
RUN apt-get install python-setuptools
RUN easy_install pip && pip install psycogreen==1.0 && pip install decorator==3.4.0 && pip install pyPdf && pip install passlib  && pip install requests
ADD openerp-server.conf /etc/odoo/
ADD startup_app.sh /
RUN chmod 755 /startup_app.sh

RUN mkdir -p /var/log/odoo && chown odoo:odoo /var/log/odoo && pip install j2cli

# gdata
RUN wget https://pypi.python.org/packages/a8/70/bd554151443fe9e89d9a934a7891aaffc63b9cb5c7d608972919a002c03c/gdata-2.0.18.tar.gz#md5=13b6e6dd8f9e3e9a8e005e05a8329408 
RUN tar -zxvf gdata* 
RUN cd gdata* 
RUN sudo python setup.py install 
RUN rm -rf gdata-*

RUN apt-get install -y nginx
ADD nginx_odoo.conf /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

EXPOSE 80
