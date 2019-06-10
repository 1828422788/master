Feature: 日志展现

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait element "SearchStatus" change text to "搜索完成!"

  @logDisplay
  Scenario Outline: 内置字段不可移除（取消内置字段的星号）（RZY-207）
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "AllFields" button
    And make element "<name>" change to "<className>"
    Then I will see the error message "此字段不可从选定字段中移除"

    Examples:
      | splQuery                                  | name     | className     |
#      | *                                         | ip       | icon-shoucang |
      | index=yott* ERROR AND tag:sample04061424* | tag      | icon-shoucang |
      | index=yott* ERROR AND tag:sample04061424* | appname  | icon-shoucang |
      | index=yott* ERROR AND tag:sample04061424* | logtype  | icon-shoucang |
      | index=yott* ERROR AND tag:sample04061424* | hostname | icon-shoucang |

  @logDisplay
  Scenario Outline: 选中字段（标记星号）（RZY-207）
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "AllFields" button
    And make element "<name>" change to "<className>"
    And I click the "CloseAllFields" button
    And I click the "<java>" button
    And I will see the tree "<element>" contains "<data>"

    Examples:
      | splQuery                                  | name         | className       | java      | element       | data          |
      | index=yott* ERROR AND tag:sample04061424* | java.message | icon-yishoucang |           | SavedFields   | ajava.message |
      | index=yott* ERROR AND tag:sample04061424* | java.message | icon-shoucang   | JavaField | UnsavedFields | amessage      |

  @logDisplay
  Scenario Outline: 字段列表快捷过滤（RZY-171）
    Given I set the parameter "SearchInput" with value "index=yott* ERROR AND tag:sample04061424* "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "<fieldName>" button
    And I check "<fieldValue>" from the "FieldCheckbox"
    And I click the "<optional>" button
    And I wait for "1000" millsecond
    Then I will see the input element "SearchInput" value will be "<spl>"

    Examples:
      | fieldName | optional        | fieldValue | spl                                                                    |
      | AppName   | TopTen          |            | index=yott* ERROR AND tag:sample04061424* \|top 10 'appname'           |
      | AppName   | RemoveDuplicate |            | index=yott* ERROR AND tag:sample04061424* \|stats dc('appname')        |
      | AppName   | TotalSequence   |            | index=yott* ERROR AND tag:sample04061424* \|timechart count('appname') |
      | AppName   | FileterField    | java       | index=yott* (ERROR AND tag:sample04061424*) AND 'appname':java         |
      | AppName   | ShieldField     | java       | index=yott* (ERROR AND tag:sample04061424*) AND NOT 'appname':java     | 
#      | Timestamp | MaxValue      | all        | index=yott* ERROR AND tag:sample04061424* \|stats max('apache.resp_len')     |
#      | Timestamp | MinValue      | all        | index=yott* ERROR AND tag:sample04061424* \|stats min('apache.resp_len')     |
#      | Timestamp | AvgStats      | all        | index=yott* ERROR AND tag:sample04061424* \|stats avg('apache.resp_len')     |
#      | Timestamp | AvgSequential | all        | index=yott* ERROR AND tag:sample04061424* \|timechart avg('apache.resp_len') |

  @second @logDisplay
  Scenario: RZY-2900：过滤字段apache.request_query
    Given I set the parameter "SearchInput" with value "tag:\"sample04061424\" AND apache.request_query:gw_address*610*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "AllFields" button
    And make element "apache.request_query" change to "icon-yishoucang"
    And I click the "CloseAllField" button under some element
    And I click the "RequestQuery" button under some element
    And I wait for "LoadingSpinner" will be invisible
    And I "checked" the checkbox which name is "gw_address=192.168.11.1&gw_port=2060&gw_id=02801020000235&mac=ac:e2:15:ec:e8:0e&url=http%3A//app.video.baidu.com/adapp_static/clientconfig/img/610/navi_chase.png"
    And I click the "FileterField" button
    And I wait element "SearchStatus" change text to "正在搜索..."
    And I wait element "SearchStatus" change text to "搜索完成!"
