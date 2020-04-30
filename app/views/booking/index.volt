<h1>All Bookings</h1>
<table class="table">
	<thead>
		<tr>
			<th scope="col">Invoice Code</th>
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
				<td>{{ booking.start_time|slice(0,4) }}
					-
					{{ booking.end_time|slice(0,4) }}</td>
				<td>{{ booking.name }}</td>
				<td>{{ booking.phone }}</td>
				<td>{{ booking.price }}</td>
				<td>
					<div class="row">
						<div class="col-md">
							<button type="button" class="booking-details btn btn-primary w-100" data-toggle="modal" data-target="#exampleModalCenter" data-id="{{ booking.id }}" data-name="{{ booking.name }}" data-phone="{{ booking.phone }}" data-email="{{ booking.email }}" data-address="{{ booking.address }}" data-date="{{ booking.date }}" data-start="{{ booking.start_time|slice(0,4) }}" data-end="{{ booking.end_time|slice(0,4) }}" data-theme="{{ booking.themes.name }}" data-price="{{ booking.price }}" data-status="{% if booking.status == 1 %}Approved{% else %}Pending{% endif %}" data-admin="{{ booking.admins.name }}">
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
					Invoice #<span id="details-id"></span>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md text-left">Status</div>
					<div class="col-md text-left">
						<span id="details-status"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Approved by</div>
					<div class="col-md text-left">
						<span id="details-admin"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Name</div>
					<div class="col-md text-left">
						<span id="details-name"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Phone Number</div>
					<div class="col-md text-left">
						<span id="details-phone"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Email</div>
					<div class="col-md text-left">
						<span id="details-email"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Address</div>
					<div class="col-md text-left">
						<span id="details-address"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Date</div>
					<div class="col-md text-left">
						<span id="details-date"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Time</div>
					<div class="col-md text-left">
						<span id="details-start"></span>
						-
						<span id="details-end"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Theme</div>
					<div class="col-md text-left">
						<span id="details-theme"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md text-left">Price</div>
					<div class="col-md text-left">
						<span id="details-price"></span>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
