<h1>Edit a Theme</h1>
<form method="POST" action="{{ url("/theme/edit") }}" enctype="multipart/form-data">
	<div class="form-group">
		<input type="text" class="form-control" name="name" value="{{ theme.name }}" placeholder="Theme name">
	</div>
	<div class="form-group">
		<textarea type="text" class="form-control" name="description" placeholder="Write a description...">{{ theme.description }}</textarea>
	</div>
	<div class="form-group">
		<input type="number" class="form-control" name="extra_price" value="{{ theme.extra_price }}" placeholder="Extra price">
	</div>
	<div class="form-group">
		<input type="file" class="form-control" name="picture" value="{{ theme.picture }}">
	</div>
	<input type="hidden" name="id" value="{{ theme.id }}">
	<input type="submit" class="btn btn-success" value="Save">
</form>
