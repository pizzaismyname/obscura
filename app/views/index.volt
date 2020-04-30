<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta
		name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>Obscura</title>
		{{ assets.outputCss() }}
		<link rel="shortcut icon" type="image/x-icon" href="{{ url('img/obscura.png') }}"/>
	</head>

	<body>
		<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="/">
					{{ image(url('img/obscura.png'), "width":"30", "height":"30") }}
					Obscura
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						{% if session.has('auth') %}
							<li>
								{{ link_to('admin/dashboard', 'Dashboard', 'class':'nav-link') }}
							</li>
							<li>
								{{ link_to('admin/all', 'Manage Staffs', 'class':'nav-link') }}
							</li>
							<li>
								{{ link_to('theme/all', 'Manage Themes', 'class':'nav-link') }}
							</li>
							<li>
								{{ link_to('booking/all', 'Manage Bookings', 'class':'nav-link') }}
							</li>
						{% else %}
							<li>
								{{ link_to('', 'Home', 'class':'nav-link') }}
							</li>
						{% endif %}
					</ul>
					<ul class="navbar-nav ml-auto">
						{% if session.has('auth') %}
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									{{ session.get('auth')['name'] }}
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="/admin/logout">Logout</a>
								</div>
							</li>
						{% else %}
							<li>
								{{ link_to('booking/add', 'Book Now!', 'class':'btn btn-outline-light') }}
							</li>
						{% endif %}
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			{{ content() }}
		</div>
		<!-- jQuery first, then Popper.js, and then Bootstrap's JavaScript -->
		{{ assets.outputJs() }}
	</body>

</html>
