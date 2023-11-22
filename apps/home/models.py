# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from apps import db

class ContactMessages(db.Model):
    print("[LOG] authentication/models.py: ContactMessages")

    __tablename__ = 'ContactMessages'

    id = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(64))
    email = db.Column(db.String(64))
    message = db.Column(db.String(512))

    def __init__(self, **kwargs):
        for property, value in kwargs.items():
            # depending on whether value is an iterable or not, we must
            # unpack it's value (when **kwargs is request.form, some values
            # will be a 1-element list)
            if hasattr(value, '__iter__') and not isinstance(value, str):
                # the ,= unpack of a singleton fails PEP8 (travis flake8 test)
                value = value[0]

            setattr(self, property, value)

    def __repr__(self):
        return str(f'{self.full_name}: {self.message}')
