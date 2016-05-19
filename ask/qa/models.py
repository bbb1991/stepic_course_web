from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.db import models


# Create your models here.
class Question(models.Model):
    title = models.CharField(max_length=50)
    text = models.CharField(max_length=100)
    added_at = models.DateTimeField(auto_now_add=True)
    rating = models.IntegerField(default=0)
    author = models.CharField(max_length=20)
    likes = models.ForeignKey(User, null=True)

    def __unicode__(self):
        return self.title


class Answer(models.Model):
    text = models.CharField(max_length=100)
    added_at = models.DateTimeField(auto_now_add=True)
    question = models.ForeignKey(Question, null=True)
    author = models.CharField(max_length=20)

    def __unicode__(self):  # __unicode__ on Python 2
        return self.text
