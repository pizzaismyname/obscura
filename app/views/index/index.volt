<div class="page-header">
	<h1>Congratulations!</h1>
</div>

<p>You're now flying with Phalcon. Great things are about to happen,
	{{ session.get('auth')['name'] }}!
</p>

<p>This page is located at
	<code>views/index/index.volt</code>
</p>

<div>
	Check studio availability:
	<form method="POST" action="{{ url( "/booking/check") }}">
		<label for="date">Date</label>
		<input type="date" class="form-control" name="date">
		<label for="start_time">Start time</label>
		<input type="time" class="form-control" name="start_time">
		<label for="end_time">End time</label>
		<input type="time" class="form-control" name="end_time">
		<input type="submit" class="btn btn-info" value="Check Now!">
	</form>
	<div>
		{{ availability }}
	</div>
</>

<div>
	<a href="/booking/add" class="btn btn-dark">Book Now!</a>
</div>

<div>
	Show your booking status:
	<form method="POST" action="{{ url( "/booking/show") }}">
		<input type="number" class="form-control" name="id" value="{{ booking.id }}" placeholder="Enter your booking code here">
		<input type="submit" class="btn btn-info" value="Show">
	</form>
</div>
