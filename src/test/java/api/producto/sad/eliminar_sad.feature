@eliminar
Feature: Eliminar un producto usando la API /api/v1/product/

  Scenario: Eliminar un producto inexistente
    Given url urlBase
    And path product_context,"/123/"
    And header Accept = 'application/json'
    When method DELETE
    Then status 404
    And match responseType == 'json'
    # And match $ == {"sku":'#null',"status":false,"message":"El producto no fue encontrado"}