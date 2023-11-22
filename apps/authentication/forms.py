# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, TextAreaField
from wtforms.validators import Email, DataRequired

# login and registration


class LoginForm(FlaskForm):
    username = StringField('Username',
                         id='username_login',
                         validators=[DataRequired()])
    password = PasswordField('Password',
                             id='pwd_login',
                             validators=[DataRequired()])


class CreateAccountForm(FlaskForm):
    username = StringField('Username',
                         id='username_create',
                         validators=[DataRequired()])
    email = StringField('Email',
                      id='email_create',
                      validators=[DataRequired(), Email()])
    password = PasswordField('Password',
                             id='pwd_create',
                             validators=[DataRequired()])


# contact us

class ContactUsForm(FlaskForm):
    full_name = StringField('Full Name',
                            id='full_name_contact',
                            validators=[DataRequired()])
    email = StringField('Email',
                        id='email_contact',
                        validators=[DataRequired(), Email()])
    message = TextAreaField('Message',
                            id='message_contact',
                            validators=[DataRequired()])