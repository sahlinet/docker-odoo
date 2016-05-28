FROM philipsahli/ubuntu:vivid

#RUN apt-get update
RUN apt-get install -y gdebi python-ofxparse python-setuptools
#RUN apt-get install -y postgresql-client python-dateutil python-decorator python-docutils python-feedparser python-imaging python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-passlib python-psutil python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-pypdf python-reportlab
#RUN apt-get install -y python-dateutil python-feedparser python-gdata python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil wget python-unittest2 python-mock python-jinja2 python-gevent 

# http://nightly.odoo.com/master/nightly/deb/
RUN wget -nv http://nightly.odoo.com/master/nightly/deb/odoo_10.0alpha1.latest_all.deb
RUN gdebi -n odoo_10.0alpha1.latest_all.deb

RUN apt-get install -y moreutils

#RUN wget -nv https://github.com/odoo/odoo/archive/8.0.0.tar.gz
#RUN wget -nv http://nightly.odoo.com/master/nightly/src/odoo_10.0alpha1.latest.tar.gz
#RUN tar -C /opt/ -zxvf odoo_10.0alpha1.latest.tar.gz
#RUN useradd -d /home/odoo -m odoo
RUN easy_install pip
#RUN pip install psycogreen
#RUN pip install decorator
#RUN pip install pyPdf
#RUN pip install passlib

#ADD openerp-server.conf /etc/odoo/
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
