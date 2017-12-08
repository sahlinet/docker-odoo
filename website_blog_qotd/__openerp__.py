# -*- coding: utf-8 -*-
{
    'name': "My custom Blog Post List",

    'summary': """
        Short (1 phrase/line) summary of the module's purpose, used as
        subtitle on modules listing or apps.openerp.com""",

    'description': """
        Long description of module's purpose
    """,

    'author': "sahli.net",
    'website': "http://sahli.net",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/master/openerp/addons/base/module/module_data.xml
    # for the full list

    # any module necessary for this one to work correctly
    'depends': ['website_blog'],

    # always loaded
    'data': [
        # 'security/ir.model.access.csv',
        'views/website_blog_templates.xml',
    ]
}
