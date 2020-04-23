<h1>All Themes</h1>
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
		{% for theme in themes %}
			<tr>
				<th scope="row">{{ loop.index }}</th>
				<td>{{ theme.name }}</td>
				<td>{{ theme.extra_price }}</td>
				<td>Tombol2 edit, destroy, show</td>
			</tr>
		{% endfor %}
	</tbody>
</table>
