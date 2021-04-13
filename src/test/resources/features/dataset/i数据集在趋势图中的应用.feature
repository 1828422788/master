@dataset @dataseti @dataset2
Feature: 数据集-j在趋势图中的应用

  @dataseti1
  Scenario Outline: 新建父子行为无的趋势图
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "left" side
    Given I set the parameter "SearchInput" with value "<spl>"
    And I drag the element "SearchPageSvg" to the fixed side
        #选择父子行为为无的数据集
    And I click the "fatherChildNull" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "right" side
    And I click the "SaveAsOther" button
    And I click the "saveTrend" button
    And I set the parameter "trendName" with value "<trendName>"
    And I click the "EnsureCrontab" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "创建成功"

    Examples:
      | spl                                                  | trendName |
      | tag:sample04061424 \| stats count() by apache.status | 父子无       |

  @dataseti2
  Scenario Outline: RZY-4127:趋势图-父子行为无
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<trendName>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible
    And I click the "zhanKai" button
    And I wait for loading invisible
    Then I will see the "dataSetPosition" result will be "<dataSetResult>"

    Examples:
      | trendName | dataSetResult |
      | 父子无       | tag:sample*   |

##################################无耻的分割线###############################
  @dataseti3
  Scenario Outline: 新建父子行为汇聚的趋势图
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "left" side
    Given I set the parameter "SearchInput" with value "<spl>"
    And I drag the element "SearchPageSvg" to the fixed side
        #选择父子行为为汇聚的数据集
    And I click the "huiJu" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "right" side
    And I click the "SaveAsOther" button
    And I click the "saveTrend" button
    And I set the parameter "trendName" with value "<trendName>"

    And I click the "EnsureCrontab" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "创建成功"

    Examples:
      | spl                                                  | trendName |
      | tag:sample04061424 \| stats count() by apache.status | 父子汇聚      |

  @dataseti4
  Scenario Outline:  RZY-4131:趋势图-父子行为汇聚
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<trendName>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible

    And I click the "zhanKai" button
    And I wait for loading invisible
    Then I will see the "dataSetPosition" result will be "<dataSetResult>"

    Examples:
      | trendName | dataSetResult                                         |
#      | 父子汇聚      | * AND tag:sample* AND (tag:beyond4 OR appname:apache) |
      | 父子汇聚      | (*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache)) |

##################################无耻的分割线###############################
  @dataseti5
  Scenario Outline: 新建父子行为继承的趋势图
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "left" side
#    And I drag the element "SearchPageSvg" to the "right" side
    Given I set the parameter "SearchInput" with value "<spl>"
    And I drag the element "SearchPageSvg" to the fixed side
        #选择父子行为为继承的数据集
    And I click the "jiCheng" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "saveTrend" button
    And I set the parameter "trendName" with value "<trendName>"

    And I click the "EnsureCrontab" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "创建成功"

    Examples:
      | spl                                                  | trendName |
      | tag:sample04061424 \| stats count() by apache.status | 父子继承      |

  @dataseti6
  Scenario Outline: RZY-4132:趋势图-父子行为继承
    Given open the "trend.ListPage" page for uri "/trend/"
    And I will see the "trend.ListPage" page
    And I wait for loading invisible
    When the data name is "<trendName>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible

    And I click the "zhanKai" button
    And I wait for loading invisible
    Then I will see the "dataSetPosition" result will be "<dataSetResult>"

    Examples:
      | trendName | dataSetResult           |
#      | 父子继承      | * AND tag:sample* |
      | 父子继承      | (*) AND (tag:sample*) |
