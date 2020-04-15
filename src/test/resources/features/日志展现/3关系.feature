@all @logDisplay @logDisplayConnection
Feature: 日志展现_关系
#5

  # tag:sample04061424_chart, auto_sankey should be uploaded for Today
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: connection(RZY-834,2783,2784)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/3关系/<caseNum>_<chartType>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/3关系/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/3关系/<caseNum>_<chartType>.png"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Chord      |    834     |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path  |
      |    Sankey     |    2783    |  tag:sample04061424_chart AND NOT apache.clientip:221.226.97.92 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 10 |
      |    Force      |    2784    |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path \|limit 10      |

  Scenario Outline: Force(RZY-4223)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "<repValue>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/3关系/<chartType>_repulsion"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/3关系/<chartType>_repulsion.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/3关系/<chartType>_repulsion.png"

    Examples:
      |   chartType   |repValue  |   spl   |
      |    Force      |    20    |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path \|limit 10      |


  Scenario Outline: multistage(RZY-4224)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "<button>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/3关系/<chartType>_<button>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/3关系/<chartType>_<button>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/3关系/<chartType>_<button>.png"


    Examples:
      |   chartType   |  button    |   spl   |
      |    Sankey     | Multistage |  tag:auto_sankey \| stats count() by json.fromstate,json.tostate \| limit 3      |