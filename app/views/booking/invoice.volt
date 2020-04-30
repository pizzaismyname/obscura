<h1>
	Booking succeed!
</h1>
<small class="text-muted">Please screenshot this page to save your booking details.</small>
<h2>
	<small class="text-muted">
		Invoice code: #{{ booking.id }}
	</small>
</h2>
<div class="row">
	<div class="col-md">
		<h3>
			Bill To
		</h3>
		<div class="row">
			<div class="col-md text-left">Name</div>
			<div class="col-md text-left">{{ booking.name }}</div>
		</div>
		<div class="row">
			<div class="col-md text-left">Phone Number</div>
			<div class="col-md text-left">{{ booking.phone }}</div>
		</div>
		<div class="row">
			<div class="col-md text-left">Email</div>
			<div class="col-md text-left">{{ booking.email }}</div>
		</div>
		<div class="row">
			<div class="col-md text-left">Address</div>
			<div class="col-md text-left">{{ booking.address }}</div>
		</div>
	</div>
	<div class="col-md">
		<h3>
			Booking Details
		</h3>
		<div class="row">
			<div class="col-md-2 text-left">Date</div>
			<div class="col-md text-left">{{ booking.date }}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-left">Time</div>
			<div class="col-md text-left">
				{{ booking.start_time }}
				-
				{{ booking.end_time }}
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Description</th>
					<th scope="col" class="text-right">Amount</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">
						For
						{{ hours }}
						hour/s
						{{ minutes }}
						minute/s
					</th>
					<td class="text-right">
						Rp
						{{ booking.price - booking.themes.extra_price}}.0
					</td>
				</tr>
				<tr>
					<th scope="row">Theme ({{ booking.themes.name }})</th>
					<td class="text-right">
						Rp
						{{ booking.themes.extra_price }}
					</td>
				</tr>
				<tr class="table-info">
					<th scope="row">
						Total
					</th>
					<th class="text-right">
						Rp
						{{ booking.price }}.0
					</th>
				</tr>
			</tbody>
		</table>
	</div>
</div>
