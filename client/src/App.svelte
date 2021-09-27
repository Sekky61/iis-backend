<script>
	export let name;

	let resp = "Loading...";

	let backend_url =
		process.env.NODE_ENV === "production"
			? "https://xmajer21-iis.herokuapp.com"
			: "http://localhost:3000";

	fetch(backend_url + "/api")
		.then((res) => res.text())
		.then((text) => {
			resp = text;
		})
		.catch((err) => {
			console.log(err);
			resp = "Error loading server response";
		});
</script>

<main>
	<h1 class="bg-red-500">Hello {name}!</h1>
	<p class="px-4 border border-indigo-500">
		Visit the <a href="https://svelte.dev/tutorial">Svelte tutorial</a> to learn
		how to build Svelte apps.
	</p>

	<h2>Response from server</h2>
	<p>{resp}</p>
</main>

<style>
</style>
