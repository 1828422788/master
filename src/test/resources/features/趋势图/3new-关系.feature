@trend @createTrendConnection @createTrend
Feature: 趋势图新建_关系

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 和弦图_桑基图(RZY-2505,2507)
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Chord      |    2505    |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |
      |    Sankey     |    2507    |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND  apache.clientip:183.14.126.214  OR ( apache.clientip:1.207.60.51 AND apache.resp_len:87) \| stats count() by apache.clientip,apache.resp_len,apache.method \| sort by apache.resp_len |

  @trendSmoke
  Scenario Outline: 力图(RZY-2511)
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
#    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Force      |    2511    |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path \|limit 10      |

  Scenario Outline: connection_force_repulsion
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I wait for "1000" millsecond
    And I set the parameter "Repulsion" with value "20"
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_repulsion"
#    And I compare source image "actual/<chartType>_repulsion" with target image "expect/<chartType>_repulsion"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_repulsion"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Force      |    2505    |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |

  Scenario Outline: connection_sankey_multistage
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
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
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<button>"
    And I compare source image "actual/<chartType>_<button>" with target image "expect/<chartType>_<button>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<button>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  button    |   spl   |
      |    Sankey     | Multistage |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:t_with \|transaction json.sid keepevicted=true with states a,b,c in json.module results by flow \| stats count() by fromstate,tostate \| limit 3      |

  Scenario Outline: connection_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_分面"
    And I compare source image "actual/<chartType>_分面" with target image "expect/<chartType>_分面"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  spl   |
      |    Chord      |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:黔东南苗族侗族自治州 \| stats count() as cnt by apache.geo.city, apache.status, apache.method \| limit 10 \| sort by apache.method, cnt, +apache.status, apache.geo.city|
      |    Sankey     |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND  apache.clientip:183.14.126.214  OR ( apache.clientip:1.207.60.51 AND (apache.resp_len:87 OR apache.resp_len:1935)) \| stats count() by apache.clientip,apache.resp_len,apache.method \| sort by apache.resp_len |

  Scenario Outline: connection_facet_force
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_分面"
#    And I compare source image "actual/<chartType>_分面" with target image "expect/<chartType>_分面"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  spl   |
      |    Force      |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path, apache.method \|limit 10 |
