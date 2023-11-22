# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField
from wtforms.validators import Email, DataRequired

# contact us

class ContactUsForm(FlaskForm):
    print("[LOG] home/forms.py: ContactUsForm")
    full_name = StringField('Full Name',
                            id='full_name_contact',
                            validators=[DataRequired()])
    email = StringField('Email',
                        id='email_contact',
                        validators=[DataRequired(), Email()])
    message = TextAreaField('Message',
                            id='message_contact',
                            validators=[DataRequired()])