<h1>Studio Booking</h1>
<form method="POST" action="{{ url("/booking/add") }}">
	<div class="form-group">
		<input type="text" class="form-control" name="name" placeholder="Name">
	</div>
	<div class="form-group">
		<input type="email" class="form-control" name="email" placeholder="example@mail.com">
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
		<small>
			{{ availability }}
		</small>
	</div>
	<div class="form-group">
		<label for="start_time">Start time</label>
		<input type="time" class="form-control" name="start_time">
		<small>
			{{ availability }}
		</small>
	</div>
	<div class="form-group">
		<label for="end_time">End time</label>
		<input type="time" class="form-control" name="end_time">
		<small>
			{{ availability }}
		</small>
	</div>
	<div class="form-group">
		<label for="id_theme">Theme</label>
		<small class="form-text text-muted">If you don't choose a theme, it will automatically set to "No Theme"</small>
		<div class="btn-group-vertical btn-group-toggle w-100" data-toggle="buttons">
			{% for theme in themes %}
				<label class="btn btn-dark {% if theme.id == 0 %} active {% endif %}">
					<input type="radio" name="id_theme" id="{{ theme.id }}" autocomplete="off" {% if theme.id == 0 %} checked {% endif %}>
					<div class="row">
						<div class="col-md my-auto">
							<img src="/{{ theme.picture }}" width="60%">
						</div>
						<div class="col-md text-left">
							{{ theme.name }}<br>
							+ Rp
							{{ theme.extra_price }}<br>
							{{ theme.description|nl2br }}
						</div>
					</div>
				</label>
			{% endfor %}
		</div>
		{# <select name="id_theme" class="form-control"> #}
	{# <option value="0">Choose a theme</option> #}
		{# <option value="{{ theme.id }}">{{ theme.name }}</option> #}
		{# </select> #}
	</div>
	<input type="submit" class="btn btn-success" value="Proceed">
</form>
