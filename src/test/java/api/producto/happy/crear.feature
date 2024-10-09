@crear
Feature: Crear un nuevo producto usando la API /api/v1/product/

	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
    * def nuevo_producto =
      """
      {
        "name": "Iphone 15",
        "description": "Este es un smartphone de alta gama",
        "price": 1500,
      }
      """
		* header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

	Scenario: Crear un producto de forma exitosa con json como texto
    * def producto =
      """
      {
        "name": "Iphone 14",
        "description": "Este es un smartphone de alta gama",
        "price": 1400,
      }
      """
    Given url 'http://localhost:8081/api/v1/product/'
    And request producto
    And header Accept = 'application/json'
    And header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
    When method post
    Then status 201

	Scenario: Crear un producto de forma exitosa usando json 
    Given url 'http://localhost:8081/api/v1/product/'
    And request { name: 'Iphone 12', description: 'Este es un smartphone de alta gama', price: 1200 }
    And header Accept = 'application/json'
    And header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
    When method post
    Then status 201
        
	Scenario: Crear un producto de forma exitosa, usando path y validando el response
    Given path "/api/v1/product/","/"
    And request nuevo_producto
    And header Accept = 'application/json'
    And header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
    When method post
    Then status 201
    And match $ == {"sku":'#notnull',"status":true,"message":"El producto fue creado con éxito!"} 
    
	Scenario: Crear un producto de forma exitosa, path, response and headers
    Given path ruta_crear,"/"
    And request nuevo_producto
    When method post
    Then status 201
    And match responseType == 'json'
    And match $ == {"sku":'#notnull',"status":true,"message":"El producto fue creado con éxito!"} 
    
	Scenario Outline: Crear un producto de forma exitosa, path, response usando examples
    Given path ruta_crear,"/"
    And request <producto>
    And header Accept = 'application/json'
    And header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
    When method post
    Then status 201
    And match responseType == 'json'
    And match $ == {"sku":'#notnull',"status":true,"message":"El producto fue creado con éxito!"} 
	Examples:
	| producto   |
	| { name: 'Iphone 16', description: 'Telefono de alta gama', price: 1600 }  |
	| { name: 'Iphone 17', description: 'Telefono de alta gama', price: 1700 }  |
	| { name: 'Iphone 18', description: 'Telefono de alta gama', price: 1800 }  |
	| { name: 'Iphone 19', description: 'Telefono de alta gama', price: 1900 }  |