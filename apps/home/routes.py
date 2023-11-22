# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from apps.home import blueprint
from flask import render_template, request
from flask_login import login_required
from jinja2 import TemplateNotFound

from apps import db
from apps.home.forms import ContactUsForm
from apps.home.models import ContactMessages

@blueprint.route('/index')
@login_required
def index():

    return render_template('home/index.html', segment='index')

@blueprint.route('/contact-us.html', methods=['GET', 'POST'])
@login_required
def contact_us():
    print("[LOG] home/routes.py: contact-us")
    contact_us_form = ContactUsForm(request.form)
    print("[LOG] after form")
    if 'contact_us' in request.form:
        
        print("[LOG] after if")
        
        ContactMessage = ContactMessages(**request.form)
        db.session.add(ContactMessage)
        db.session.commit()
        
        return render_template('home/contact-us.html',
                               msg='Message sent!',
                               success=True,
                               form=contact_us_form)
    return render_template('home/contact-us.html',
                               success=False,
                               form=contact_us_form)

@blueprint.route('/<template>')
@login_required
def route_template(template):
    print("[LOG] home/routes.py: route_template {}".format(template))

    try:

        if not template.endswith('.html'):
            template += '.html'

        # Detect the current page
        segment = get_segment(request)

        # Serve the file (if exists) from app/templates/home/FILE.html
        return render_template("home/" + template, segment=segment)

    except TemplateNotFound:
        return render_template('home/page-404.html'), 404

    except:
        print("[LOG] Unexpected error:")
        return render_template('home/page-500.html'), 500


# Helper - Extract current page name from request
def get_segment(request):

    try:

        segment = request.path.split('/')[-1]

        if segment == '':
            segment = 'index'

        return segment

    except:
        return None
