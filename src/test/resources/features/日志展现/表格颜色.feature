Feature: 日志展现表格颜色设置

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait element "SearchStatus" change text to "搜索完成!"

  Scenario: RZY-827:颜色-梯度-连续
    When I set the parameter "SearchInput" with value "tag:sample04061424 | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Edit" button
    And I choose the "梯度" from the "ColourDropdown"
    And I click the "Orange" button
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/827"

  Scenario: RZY-828:颜色-梯度-离散
    When I set the parameter "SearchInput" with value "tag:sample04061424 | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Edit" button
    And I choose the "梯度" from the "ColourDropdown"
    And I click the "Red" button
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/828"

  Scenario: RZY-828:改变颜色范围
    When I set the parameter "SearchInput" with value "tag:sample04061424 | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Edit" button
    And I choose the "梯度" from the "ColourDropdown"
    And I click the "Red" button
    And I set the parameter "LowerLimit" with value "1"
    And I set the parameter "MiddleLimit" with value "22"
    And I set the parameter "TopLimit" with value "27"
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/828改色"

  Scenario: RZY-829:颜色-范围
    When I set the parameter "SearchInput" with value "tag:sample04061424 | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Edit" button
    And I choose the "范围" from the "ColourDropdown"
    And I click the "AddRangeColour" button
    And I set the parameter "MaxInput" with value "5"
    And I click the "AddRangeColour" button
    And I set the parameter "MaxInput" with value "15"
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/829"
    And I click the "Edit" button
    And I click the "Delete" button
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/829删除第二行颜色"
    And I click the "Edit" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorInput" with value "#D322FF"
    And I click the "SaveColor" button
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/829修改颜色"

  Scenario: RZY-830:颜色-数值
    When I set the parameter "SearchInput" with value "tag:sample04061424 | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Edit" button
    And I choose the "值" from the "ColourDropdown"
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/830"
    And I click the "Edit" button
    And I click the "Customize" button
    And I click the "AddColor" button
    And I set the parameter "ColorValue" with value "1"
    And I click the "AddColor" button
    And I set the parameter "ColorValue" with value "2"
    And I click the "AddColor" button
    And I set the parameter "ColorValue" with value "4"
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/830修改值"
    And I click the "Edit" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorInput" with value "#D322FF"
    And I click the "SaveColor" button
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/830修改颜色"
    And I click the "Edit" button
    And I click the "Delete" button
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/830删除颜色"

  Scenario: RZY-2764:颜色-梯度-连续_校验
    When I set the parameter "SearchInput" with value "tag:sample04061424 | eval res_mul=apache.resp_len*apache.status*0 - apache.resp_len*apache.status/apache.status%1000 | eval r_add=apache.resp_len+apache.status*10-apache.resp_len-9*apache.status | eval res_concat = appname + apache.clientip + apache.geo.city | table res_mul, r_add, res_concat"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "FirstEdit" button
    And I choose the "梯度" from the "ColourDropdown"
    And I set the parameter "LowerLimit" with value "-1000"
    And I set the parameter "MiddleLimit" with value "-500"
    And I set the parameter "TopLimit" with value "-1"
    And I click the "SaveButton" button
    Then take part of "TableChart" with name "event/2764"

