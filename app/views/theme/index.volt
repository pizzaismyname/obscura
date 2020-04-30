<h1>All Themes</h1>
{{ link_to('theme/add', 'New Theme', 'class':'btn btn-success') }}
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
					<div class="row">
						<div class="col-md">
							<button type="button" class="theme-details btn btn-primary w-100" data-toggle="modal" data-target="#exampleModalCenter" data-name="{{ theme.name }}" data-description="{{ theme.description|nl2br }}" data-price="{{ theme.extra_price }}" data-picture="{{ theme.picture }}">
								Details
							</button>
						</div>
						<div class="col-md">
							{{ link_to('theme/edit/' ~ theme.id, 'Edit', 'class':'btn btn-warning w-100') }}
						</div>
						<div class="col-md">
							<form method="POST" action="{{ url( "/theme/delete") }}">
								<input type="hidden" name="id" value="{{ theme.id }}">
								<input type="submit" class="btn btn-danger w-100" value="Delete">
							</form>
						</div>
					</div>
				</td>
			</tr>
		{% endfor %}
	</tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">
					<div id="details-name"></div>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md">
						{{ image("id":"details-picture", "width":"100%") }}
					</div>
					<div class="col-md">
						<div id="details-description"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="mr-auto">
					Rp
					<span id="details-price"></span>
				</div>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
