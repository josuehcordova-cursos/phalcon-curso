{# templates/sidebar.volt #}
<!DOCTYPE html>
<html>
<head>
    {% block head %}
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    {% endblock %}
    <title>{% block title %}{% endblock %} - My Webpage</title>
</head>
<body>
<div id="container">
    <div class="col-md-3">{% block sidebar %}{% endblock %}</div>
    <div class="col-md-9">{% block content %}{% endblock %}</div>
</div>

<div id="footer">
    {% block footer %}
        &copy; Copyright 2016, All rights reserved.
    {% endblock %}
</div>
</body>
</html>