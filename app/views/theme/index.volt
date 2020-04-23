<h1>All Themes</h1>
{% for theme in themes %}
<li>
    {{ theme.name }}
</li>
{% endfor %}
<table class="table">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Extra Price</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1,2,3</th>
            <td>{{ theme.name }}</td>
            <td>{{ theme.extra_price }}</td>
            <td>Tombol2 edit, destroy, show</td>
        </tr>
    </tbody>
</table>