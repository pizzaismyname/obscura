<h1>All Staffs</h1>
<a href="{{ url("/admin/add") }}" class="btn btn-success">New Staff</a>
<table class="table">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Name</th>
			<th scope="col">Email</th>
			<th scope="col">Phone</th>
			<th scope="col">Action</th>
		</tr>
	</thead>
	<tbody>
		{% for admin in admins %}
			<tr>
				<th scope="row">{{ loop.index }}</th>
				<td>{{ admin.name }}</td>
				<td>{{ admin.email }}</td>
				<td>{{ admin.phone }}</td>
				<td>
					<div class="row">
						<div class="col-md">
							<a href="/admin/edit/{{ admin.id }}" class="btn btn-warning w-100">Edit</a>
						</div>
						<div class="col-md">
							<form method="POST" action="{{ url( "/admin/delete") }}">
								<input type="hidden" name="id" value="{{ admin.id }}">
								<input type="submit" class="btn btn-danger w-100" value="Delete">
							</form>
						</div>
					</div>
				</td>
			</tr>
		{% endfor %}
	</tbody>
</table>