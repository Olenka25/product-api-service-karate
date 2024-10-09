@web
Feature: Buscar en google
 Background:
    # * configure driver = { type: 'chrome' }
		# * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
		 * configure driver = { type: 'geckodriver', showDriverLog: true, executable: './src/test/java/drivers/geckodriver' }
  
  @ignore
  Scenario: Buscar la palabra karate en google
    Given driver 'https://google.com'
    And input("textarea[name=q]", 'karate dsl')
    When submit().click("input[name=btnI]")
    Then waitForUrl('https://github.com/karatelabs/karate')
    And match driver.url == 'https://github.com/karatelabs/karate'
  
  @wiki
  Scenario: Buscar la palabra arequipa en wikitravel
    Given driver 'https://wikitravel.org/en/Peru'
    When input("input[id=searchInput]", ['Arequipa',Key.ENTER])
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
		* sleep(5000)
    * def query_results = locateAll(".mw-search-result-heading > a")
    And query_results[0].click()
    Then waitForUrl("https://wikitravel.org/en/Arequipa")
    And match text('#mf-pagebanner > div.topbanner > div.name') contains 'Arequipa'