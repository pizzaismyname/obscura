<h1>Admin Login Page</h1>
<form method="POST" action="{{ url("/admin/login") }}">
	<div class="form-group">
		<input type="email" class="form-control" name="email" placeholder="example@mail.com">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" name="password" placeholder="password">
	</div>
	<input type="submit" class="btn btn-primary" value="Login">
</form>
