<h1>Change a Theme</h1>
<form method="PUT" action="{{ url("/theme/edit") }}" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" class="form-control" name="name" placeholder="Theme name">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="description" placeholder="Write a description...">
    </div>
    <div class="form-group">
        <input type="number" class="form-control" name="extra_price" placeholder="Extra price">
    </div>
    <div class="form-group">
        <input type="file" class="form-control" name="picture">
    </div>
    <input type="submit" class="btn btn-success" value="Save">
</form>
