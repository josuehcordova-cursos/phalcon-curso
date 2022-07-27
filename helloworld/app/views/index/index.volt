<div class="page-header">
    <h1>Congratulations!</h1>
</div>

<p>You're now flying with Phalcon. Great things are about to happen!</p>

<p>This page is located at <code>views/index/index.phtml</code></p>

<h2> Variables </h2>
<p> {{ msg }} </p>

{% for curso in  cursos %}
    <p> {{ curso }}</p>
{% endfor %}

<h2>Usuarios</h2>
{% for user in  users %}
    <p> Username: {{ user.username }}, email: {{ user.email }}</p>
{% endfor %}

{{ tag_html("h2", ["class":"text-center text-muted"]) }}
Clase Tags de Volt
{{ tag_html_close("h2") }}

{{ stylesheet_link("css/index.css") }}