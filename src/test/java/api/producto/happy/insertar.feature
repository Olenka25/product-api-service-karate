@insertar 
Feature: Crear un nuevo producto usando como fuente un archivo CSV
	Background:
    * url urlBase
    * header Authorization = token
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'
    * def ruta_crear = '/api/v1/product/'
    
	Scenario Outline: Crear un producto de forma exitosa, path, response usando examples con csv
    Given path ruta_crear,"/"
    And request { name: <name>, description: <description>, price: <price> }
    When method post
    Then status 201
    And match responseType == 'json'
    And match $ == {"sku":'#notnull',"status":true,"message":"El producto fue creado con éxito!"} 
	Examples:
	| read("productos.csv")   |
	
	Scenario Outline: Crear un producto de forma exitosa, path, response usando examples con json
    Given path ruta_crear,"/"
    And request { name: <name>, description: <description>, price: <price> }
    And header Accept = 'application/json'
    And header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
    When method post
    Then status 201
    And match responseType == 'json'
    And match $ == {"sku":'#string',"status":'#boolean',"message":"El producto fue creado con éxito!"} 
	Examples:
	| read("productos.json")   |