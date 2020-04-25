<h1>Studio Booking</h1>
<form method="POST" action="{{ url("/booking/add") }}">
	<div class="form-group">
		<input type="text" class="form-control" name="name" placeholder="Name">
	</div>
	<div class="form-group">
		<input type="text" class="form-control" name="email" placeholder="example@mail.com">
	</div>
	<div class="form-group">
		<input type="number" class="form-control" name="phone" placeholder="Phone Number">
	</div>
	<div class="form-group">
		<input type="text" class="form-control" name="address" placeholder="Address">
	</div>
	<div class="form-group">
		<label for="date">Date</label>
		<input type="date" class="form-control" name="date">
	</div>
	<div class="form-group">
		<label for="start_time">Start time</label>
		<input type="time" class="form-control" name="start_time">
	</div>
	<div class="form-group">
		<label for="end_time">End time</label>
		<input type="time" class="form-control" name="end_time">
	</div>
	<div class="form-group">
		<select name="id_theme" class="form-control">
			<option value="0">Choose a theme</option>
			{% for theme in themes %}
				<option value="{{ theme.id }}">{{ theme.name }}</option>
			{% endfor %}
		</select>
		<small class="form-text text-muted">If you don't choose a theme, it will automatically set to "No Theme"</small>

	</div>
	<input type="submit" class="btn btn-success" value="Proceed">
</form>
