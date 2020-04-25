<h1>Invoice #{{ code }}</h1>
<div>
	{{ booking.name }}
</div>
<div>
	{{ booking.email }}
</div>
<div>
	{{ booking.phone }}
</div>
<div>
	{{ booking.address }}
</div>
<div>
	{{ booking.date }}
</div>
<div>
	{{ booking.start_time }}
</div>
<div>
	{{ booking.end_time }}
</div>
<div>
	{{ hours }}
	hour/s
</div>
<div>
	{{ minutes }}
	minute/s
</div>
<div>
	{{ booking.price }}
</div>
<div>
	<a href="{{ url("/") }}" class="btn btn-dark">Home</a>
</div>
