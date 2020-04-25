<h1>All Bookings</h1>
<table class="table">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Date</th>
			<th scope="col">Start</th>
			<th scope="col">End</th>
			<th scope="col">Name</th>
			<th scope="col">Phone Number</th>
            <th scope="col">Price</th>
			<th scope="col">Action</th>
		</tr>
	</thead>
	<tbody>
		{% for booking in bookings %}
			<tr>
				<th scope="row">{{ loop.index }}</th>
				<td>{{ booking.date }}</td>
				<td>{{ booking.start_time }}</td>
				<td>{{ booking.end_time }}</td>
				<td>{{ booking.name }}</td>
				<td>{{ booking.phone }}</td>
				<td>{{ booking.price }}</td>
				<td>
					<div class="row">
						<div class="col-md">
							<button type="button" class="btn btn-primary w-100" data-toggle="modal" data-target="#exampleModalCenter">
								Details
							</button>
						</div>
						<div class="col-md">
							<form method="POST" action="{{ url( "/booking/approve") }}">
								<input type="hidden" name="id" value="{{ booking.id }}">
								<input type="submit" class="btn btn-success w-100" value="Approve">
							</form>
						</div>
						<div class="col-md">
							<form method="POST" action="{{ url( "/booking/cancel") }}">
								<input type="hidden" name="id" value="{{ booking.id }}">
								<input type="submit" class="btn btn-danger w-100" value="Cancel">
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
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				{#
                booking.email
                booking.address
                #}
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
