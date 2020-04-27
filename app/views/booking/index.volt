<h1>All Bookings</h1>
<table class="table">
	<thead>
		<tr>
			<th scope="col">Booking Code</th>
			<th scope="col">Date</th>
			<th scope="col">Time</th>
			<th scope="col">Name</th>
			<th scope="col">Phone Number</th>
			<th scope="col">Price</th>
			<th scope="col">Action</th>
		</tr>
	</thead>
	<tbody>
		{% for booking in bookings %}
			<tr>
				<th scope="row">{{ booking.id }}</th>
				<td>{{ booking.date }}</td>
				<td>{{ booking.start_time }}
					-
					{{ booking.end_time }}</td>
				<td>{{ booking.name }}</td>
				<td>{{ booking.phone }}</td>
				<td>{{ booking.price }}</td>
				<td>
					<div class="row">
						<div class="col-md">
							<button type="button" class="booking-details btn btn-primary w-100" data-toggle="modal" data-target="#exampleModalCenter" data-id="{{ booking.id }}" data-name="{{ booking.name }}" data-phone="{{ booking.phone }}" data-email="{{ booking.email }}" data-address="{{ booking.address }}" data-date="{{ booking.date }}" data-start="{{ booking.start_time }}" data-end="{{ booking.end_time }}" data-theme="{{ booking.themes.name }}" data-price="{{ booking.price }}" data-status="{{ booking.status }}" data-admin="{{ booking.admins.name }}">
								Details
							</button>
						</div>
						{% if booking.status == 1 %}
							<div class="col-md">
								Approved by<br>
								{{ booking.admins.name }}
							</div>
						{% else %}
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
						{% endif %}
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
					Booking #<span id="details-id"></span>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="details-name"></div>
				<div id="details-phone"></div>
				<div id="details-email"></div>
				<div id="details-address"></div>
				<div id="details-date"></div>
				<div id="details-start"></div>
				<div id="details-end"></div>
				<div id="details-theme"></div>
				<div id="details-price"></div>
				<div id="details-status"></div>
				<div id="details-admin"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
