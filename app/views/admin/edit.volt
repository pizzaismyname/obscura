<h1>Edit a Staff</h1>
{% if messages is defined %}
	{% for message in messages %}
		<div class="alert alert-danger" role="alert">
			{{ message }}
		</div>
	{% endfor %}
{% endif %}
{% if flashSession.has('error') %}
	<div class="alert alert-danger" role="alert">
		{{ flashSession.output() }}
	</div>
{% endif %}
<form method="POST" action="{{ url("/admin/edit") }}">
	<div class="form-group">
		<input type="text" class="form-control" name="name" value="{{ admin.name }}" placeholder="Name">
	</div>
	<div class="form-group">
		<input type="email" class="form-control" name="email" value="{{ admin.email }}" placeholder="example@mail.com">
	</div>
	<div class="form-group">
		<input type="number" class="form-control" name="phone" value="{{ admin.phone }}" placeholder="Phone Number">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" name="password" placeholder="Password">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" name="cpassword" placeholder="Confirm Password">
	</div>
	<input type="hidden" name="id" value="{{ admin.id }}">
	<input type="submit" class="btn btn-success" value="Save">
</form>
