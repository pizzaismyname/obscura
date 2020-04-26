<div class="page-header row">
	<div class="col-md">
		<h1>Welcome to Obscura!</h1>
	</div>
	<div class="col-md text-right">
		<p>
			👆 Click 👆
		</p>
	</div>
</div>

<p>Great things are about to happen!
</p>

<div class="row">
	<div class="col-md">
		<div class="card text-white text-center bg-dark mb-3">
			<div class="card-header">Check studio availability</div>
			<div class="card-body">
				<form method="POST" action="{{ url( "/booking/check") }}">
					<div class="form-group">
						<label for="date">Date</label>
						<input type="date" class="form-control w-50 mx-auto" name="date">
					</div>
					<div class="form-group">
						<label for="start_time">Start time</label>
						<input type="time" class="form-control w-50 mx-auto" name="start_time">
					</div>
					<div class="form-group">
						<label for="end_time">End time</label>
						<input type="time" class="form-control w-50 mx-auto" name="end_time">
					</div>
					<input type="submit" class="btn btn-info" value="Check">
				</form>
				<div>
					{{ availability }}
				</div>
			</div>
		</div>
	</div>
	<div class="col-md">
		<div class="card text-white text-center bg-dark mb-3">
			<div class="card-header">Show your booking status</div>
			<div class="card-body">
				<form method="POST" action="{{ url( "/booking/show") }}">
					<div class="form-group">
						<input type="number" class="form-control  w-50 mx-auto" name="id" value="{{ booking.id }}" placeholder="Enter your booking code here">
					</div>
					<input type="submit" class="btn btn-info" value="Show">
				</form>
				<div>
					{{ status }}
				</div>
			</div>
		</div>
	</div>
</div>
