@dataset @datasetTrendPage
Feature: 数据集_09在趋势图中的应用

  Scenario Outline: 新建父子行为无的趋势图
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "right" side
    Given I set the parameter "SearchInput" with value "tag:sample04061424 | stats count() by apache.status"
    And I drag the element "SearchPageSvg" to the fixed side
    When the dataset is "<tree>" then I "expand" the item
    And I click the Element with text "<node>"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "SaveTrend" button
    And I set the parameter "TrendName" with value "<trendName>"
    And I click the Element with text "确定"
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "创建成功"

    Examples:
      | trendName     | tree    |  node   |
      | 父子行为无    | 无tree  | 无1     |
      | 父子行为汇聚  | 汇聚tree| 汇聚tree|
      | 父子行为继承  | 继承tree| 继承1   |

  Scenario Outline: RZY-4127:趋势图-父子行为无
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<trendName>"
    And I wait for loading invisible
    When the data name is "<trendName>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "ZhanKai" button
    Then I will see the element "DataSetPosition" contains "<dataSetResult>"

    Examples:
      | trendName     | dataSetResult |
      | 父子行为无    | tag:sample*   |
      | 父子行为汇聚  | (*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))|
      | 父子行为继承  | (*) AND (tag:sample*)                                        |