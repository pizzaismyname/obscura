<h1>Add a New Theme</h1>
<form method="POST" action="{{ url("/theme/add") }}" enctype="multipart/form-data">
	<div class="form-group">
		<input type="text" class="form-control" name="name" placeholder="Theme name">
	</div>
	<div class="form-group">
		<textarea type="text" class="form-control" name="description" placeholder="Write a description..."></textarea>
	</div>
	<div class="form-group">
		<input type="number" class="form-control" name="extra_price" placeholder="Extra price">
	</div>
	<div class="form-group">
		<input type="file" class="form-control" name="picture">
	</div>
	<input type="submit" class="btn btn-success" value="Save">
</form>
