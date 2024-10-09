function karateConfig() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    product_context: '/api/v1/product/',
	urlBase: 'http://localhost:8081',
	token: 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}