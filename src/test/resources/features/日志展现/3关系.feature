@all @logDisplay @logDisplayConnection
Feature: 日志展现_3关系

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  @logDisplaySmoke
  Scenario Outline: 和弦图_桑基图(RZY-834,2783)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And I will see the "Type" is display
    And take part of "Chart" with name "actual/高级搜索视图/3关系_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/3关系_<caseNum>_<chartType>" with target image "expect/高级搜索视图/3关系_<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Chord      |    834     |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path  |
      |    Sankey     |    2783    |  tag:sample04061424_chart AND  apache.clientip:183.14.126.214  OR ( apache.clientip:1.207.60.51 AND apache.resp_len:87) \| stats count() by apache.clientip,apache.resp_len,apache.method \| sort by apache.resp_len |

  @logDisplaySmoke
  Scenario Outline: 力图(RZY-2784)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And I will see the "Type" is display
    And take part of "Chart" with name "actual/高级搜索视图/3关系_<caseNum>_<chartType>"
#    Then I compare source image "actual/高级搜索视图/3关系_<caseNum>_<chartType>" with target image "expect/高级搜索视图/3关系_<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Force      |    2784    |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path \|limit 10      |

  Scenario Outline: 力图_斥力因子(RZY-4223)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "<repValue>"
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And I will see the "Type" is display
    And take part of "Chart" with name "actual/高级搜索视图/3关系_<chartType>_repulsion"
#    Then I compare source image "actual/高级搜索视图/3关系/<chartType>_repulsion" with target image "expect/高级搜索视图/3关系/<chartType>_repulsion"

    Examples:
      |   chartType   |repValue  |   spl   |
      |    Force      |    20    |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path \|limit 10      |


  Scenario Outline: 桑基图_多级(RZY-4224)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I wait for "1000" millsecond
    And I click the "<button>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And I will see the "Type" is display
    And take part of "Chart" with name "actual/高级搜索视图/3关系_<chartType>_<button>"
    Then I compare source image "actual/高级搜索视图/3关系_<chartType>_<button>" with target image "expect/高级搜索视图/3关系_<chartType>_<button>"


    Examples:
      |   chartType   |  button    |   spl   |
      |    Sankey     | Multistage |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:t_with \|transaction json.sid keepevicted=true with states a,b,c in json.module results by flow \| stats count() by fromstate,tostate \| limit 3      |

  Scenario Outline: 分面1
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And I will see the "Type" is display
    And take part of "Chart" with name "actual/高级搜索视图/3关系_分面_<chartType>"
    Then I compare source image "actual/高级搜索视图/3关系_分面_<chartType>" with target image "expect/高级搜索视图/3关系_分面_<chartType>"

    Examples:
      |   chartType   |   spl   |
      |    Chord      |  tag:sample04061424_chart AND NOT apache.geo.city:黔东南苗族侗族自治州 \| stats count() as cnt by apache.geo.city, apache.status, apache.method \| limit 10 \| sort by apache.method, cnt, +apache.status, apache.geo.city|
      |    Sankey     |  tag:sample04061424_chart AND  apache.clientip:183.14.126.214  OR ( apache.clientip:1.207.60.51 AND (apache.resp_len:87 OR apache.resp_len:1935)) \| stats count() by apache.clientip,apache.resp_len,apache.method \| sort by apache.resp_len |

  Scenario Outline: 分面2
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And I will see the "Type" is display
    And take part of "Chart" with name "actual/高级搜索视图/3关系_分面_<chartType>"
#    Then I compare source image "actual/高级搜索视图/3关系_分面_<chartType>" with target image "expect/高级搜索视图/3关系_分面_<chartType>"

    Examples:
      |   chartType   |   spl   |
      |    Force      |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path, apache.method \|limit 10 |