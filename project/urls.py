from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
    url(r'^$', 'project.views.home', name='home'),
)
