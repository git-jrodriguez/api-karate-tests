Feature: Mascotas en petstore.swagger.io

  Scenario: Agregar una mascota realizando un POST al path/v2/pet

    * def pet = read('pet.json')
    * def expectedSchema = read('petDataTypes.json')

    Given url 'https://petstore.swagger.io/v2'+"/pet"
    And request pet
    When method post
    Then status 200
    * match response == expectedSchema
    * match response == pet


  Scenario: Traer la mascota creada realizando un POST al path/v2/pet
    * def pet = read('pet.json')

    Given url 'https://petstore.swagger.io/v2'+ "/pet/" +  "12352131321233"
    When method get
    Then status 200
    And match pet == response


  Scenario: Modificar la mascota creada realizando un POST al path/v2/pet
    * def petModified = read('petSold.json')

    Given url 'https://petstore.swagger.io/v2'+ "/pet"
    And request petModified
    When method put
    Then status 200
    And match petModified == response

