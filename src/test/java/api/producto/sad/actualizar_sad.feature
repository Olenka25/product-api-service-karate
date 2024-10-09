@actualizar
Feature: Actualizar un producto usando la API /api/v1/product/

  Background:
    * url urlBase
    Given path product_context,"/"
    And request { name: 'Iphone 99', description: 'Este es un smartphone de alta gama', price: 9999 }
    And header Accept = 'application/json'
    And header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
    When method POST
    Then status 201
    * def sku_creado = response.sku

  Scenario Outline: Actualizar un producto con un nombre inválido
    Given path product_context,"/",sku_creado,"/"
    And request <producto>
    And header Accept = 'application/json'
    When method PUT
    Then status 400
    And match responseType == 'json'
    And match $ == {"sku":'#notnull',"status":false,"message":"El nombre del producto no fue proporcionado"}
    Examples:
      | producto   |
      | { name: '', description: 'Este es un smartphone de alta gama', price: 9999 } |
      # | { name: null, description: 'Descripcion Actualizada', price: 9999 }  |
      | { description: 'Descripcion Actualizada', price: 9999 }  |

  Scenario Outline: Actualizar un producto con una descripción inválida
    Given path product_context,"/",sku_creado,"/"
    And request <producto>
    And header Accept = 'application/json'
    When method PUT
    Then status 400
    And match responseType == 'json'
    And match $ == {"sku":'#notnull',"status":false,"message":"La descripción del producto no fue proporcionada"}
    Examples:
      | producto   |
      | { name: 'Iphone 99', description: '', price: 9999 } |
      # | { name: 'Iphone 99, description: null, price: 9999 } |
      | { name: 'Iphone 99', price: 9999 } |

  Scenario Outline: Actualizar un producto con un precio inválido
    Given path product_context,"/",sku_creado,"/"
    And request <producto>
    And header Accept = 'application/json'
    When method PUT
    Then status 400
    And match responseType == 'json'
    And match $ == {"sku":'#notnull',"status":false,"message":"El precio del producto no fue proporcionado"}
    Examples:
      | producto   |
      | { name: 'Iphone 99', description: 'Este es un smartphone de alta gama', price: 0 } |
      # | { name: 'Iphone 99', description: 'Este es un smartphone de alta gama', price: -1 } |
      | { name: 'Iphone 99', description: 'Este es un smartphone de alta gama', price: '' } |
      # | { name: 'Iphone 99', description: 'Este es un smartphone de alta gama', price: 'abc' } |
      | { name: 'Iphone 99', description: 'Este es un smartphone de alta gama', price: null } |
      | { name: 'Iphone 99', description: 'Este es un smartphone de alta gama' } |

  Scenario: Actualizar un producto con un sku inválido
    Given path product_context,"/123/"
    And request { name: 'Iphone 99', description: 'Este es un smartphone de alta gama', price: 9999 }
    And header Accept = 'application/json'
    When method PUT
    Then status 404
    And match responseType == 'json'
    # And match $ == {"sku":'#null',"status":false,"message":"El producto no fue encontrado"}