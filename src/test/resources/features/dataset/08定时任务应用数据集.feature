@dataset @datasetTimedTaskPage
Feature: 数据集_08在定时任务应用-编辑页面&详情页

  Scenario Outline: 新建数据集定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "right" side
    Given I set the parameter "SearchInput" with value "tag:sample04061424 | stats count() by apache.status"
    When the dataset is "<tree>" then I "expand" the item
    And I click the Element with text "<node>"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "SaveAsOther" button
    When I click the "TimedTask" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "<describe>"
    And I set the parameter "CrontabInput" with value "0 */57 * * * ?"
    And I click the "Submit" button
    Then I will see the success message "保存成功"

    Examples:
      | taskName      | describe                    | tree    |  node   |
      | 父子行为无    | 选择了父子行为为无的数据集  | 无tree  | 无1     |
      | 父子行为汇聚  | 选择了父子行为为汇聚的数据集| 汇聚tree| 汇聚tree|
      | 父子行为继承  | 选择了父子行为为继承的数据集| 继承tree| 继承1   |

  Scenario Outline: RZY-4126:定时任务-编辑页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<taskName>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<taskName>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    When I click the "DatasetLink" button
    And I wait for "<dataset>" will be visible
    Then I will see the element "<dataset>" attribute "class" is "selected"

    Examples:
      | taskName      | dataset              |
      | 父子行为无    | fatherChildNull1Task |
      | 父子行为汇聚  | HuiJuTask            |
      | 父子行为继承  | JiCheng1Task         |

  Scenario Outline: RZY-4126,4129,4130:定时任务-详情页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Given I click the which name is "<name>"
    And I will see the "timedTask.DetailPage" page
    And I will see the element "detailDataSet" contains "<dataSetResult>"

    Examples:
      |   name        | dataSetResult |
      | 父子行为无    | (tag:sample*) |
      | 父子行为汇聚  | (*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))|
      | 父子行为继承  | (*) AND (tag:sample*)                                        |