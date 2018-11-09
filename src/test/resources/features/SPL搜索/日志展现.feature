@spl @all @smoke
Feature: 日志展现

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 内置字段不可移除
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "AllFields" button
    Then the data name is "<name>" then i click the button which className is "<className>"
    Then I will see the error message "此字段不可从选定字段中移除"

    Examples:
      | splQuery                                  | name     | className                            |
      | index=yott* ERROR AND tag:sample04061424* | tag      | iconfont icon-yishoucang pointer-btn |
      | index=yott* ERROR AND tag:sample04061424* | appname  | iconfont icon-yishoucang pointer-btn |
      | index=yott* ERROR AND tag:sample04061424* | logtype  | iconfont icon-yishoucang pointer-btn |
      | index=yott* ERROR AND tag:sample04061424* | hostname | iconfont icon-yishoucang pointer-btn |

  Scenario Outline: 选中字段
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "AllFields" button
    Then the data name is "<name>" then i click the button which className is "<className>"
    Then I click the "CloseAllFields" button
    Then I click the "JavaField" button
    Then I will see the tree "<element>" contains "<data>"

    Examples:
      | splQuery                                  | name         | className                            | element       | data          |
      | index=yott* ERROR AND tag:sample04061424* | java.message | iconfont icon-shoucang pointer-btn   | SavedFields   | ajava.message |
      | index=yott* ERROR AND tag:sample04061424* | java.message | iconfont icon-yishoucang pointer-btn | UnsavedFields | amessage      |

  Scenario Outline: 字段列表快捷过滤  异常
    Given I set the parameter "SearchInput" with value "index=yott* ERROR AND tag:sample04061424* "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "AppName" button
    And I check "<fieldValue>" from the "FieldCheckbox"
    Then I click the "<optional>" button
    Then I will see the input element "SearchInput" value will be "<spl>"

    Examples:
      | optional        | fieldValue | spl                                                                  |
      | TopTen          |            | index=yott* ERROR AND tag:sample04061424* \|top 10 'appname'           |
      | RemoveDuplicate |            | index=yott* ERROR AND tag:sample04061424* \|stats dc('appname')        |
      | TotalSequence   |            | index=yott* ERROR AND tag:sample04061424* \|timechart count('appname') |
      | FileterField    | java       | index=yott* (ERROR AND tag:sample04061424*) AND appname:java         |
      | ShieldField     | java       | index=yott* (ERROR AND tag:sample04061424*) AND NOT appname:java     |