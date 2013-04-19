from django.shortcuts import render
from django.template.loader import get_template
from django.template import Context
from django.http import Http404, HttpResponse
import datetime

def hello(request):
    """
    
    Arguments:
    - `request`:
    """
    return HttpResponse("Hello World")


def current_datetime(request):
    """
    
    Arguments:
    - `request`:
    """
    now = datetime.datetime.now()
    # t = get_template('current_datetime.html')
    # html = t.render(Context({'current_date': now}))
    # return HttpResponse(html)


    return render(request, 'current_datetime.html', {'current_date':now})



def hours_ahead(request, offset):
    """
    
    Arguments:
    - `request`:
    - `offset`:
    """
    try:
        offset = int(offset)
    except:
        raise Http404()

    dt = datetime.datetime.now() + datetime.timedelta(hours=offset)

    # html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)

    # return HttpResponse(html)
    return render(request, "hours_ahead.html",{"offset":offset,"dt":dt})
