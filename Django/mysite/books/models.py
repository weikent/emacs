from django.db import models


class Publisher(models.Model):
	name = models.CharFields(max_length=30)
# Create your models here.
