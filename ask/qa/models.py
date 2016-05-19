from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.db import models


# Create your models here.
class Question(models.Model):
    title = models.CharField(max_length=50)
    text = models.TextField(blank=True)
    added_at = models.DateTimeField(auto_now_add=True, auto_now=True, editable=True)
    rating = models.IntegerField()
    author = User()


class Answer(models.Model):
    text = models.TextField()
    added_at = models.DateTimeField(auto_now_add=True, auto_now=True, editable=True)
    question = Question()
    author = User()
