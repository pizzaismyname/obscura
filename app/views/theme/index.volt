<h1>All Themes</h1>
<a href="{{ url(" /theme/new ") }}" class="btn btn-success">New Theme</a>
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
				<td>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
						Show details
					</button>
					<a href="/theme/change/{{ theme.id }}" class="btn btn-warning">Change</a>
					<form method="POST" action="{{ url( "/theme/delete") }}">
						<input type="hidden" name="id" value="{{ theme.id }}">
						<input type="submit" class="btn btn-danger" value="Remove">
					</form>
				</td>
			</tr>
		{% endfor %}
	</tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				...
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
