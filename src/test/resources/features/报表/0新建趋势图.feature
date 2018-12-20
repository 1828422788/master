@smoke @reportSmoke @report @all
Feature: 报表所需趋势图

  Scenario Outline: 新建曲线图类型趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I choose the "<group>" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<xAxis>" from the "SettingSelect"
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I choose the "<yAxis>" from the "SettingSelect"
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button
    And I click the "<connectEmptyData>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Group" button
    And I click the "<settingSwitch>" button
    And I choose the "<fieldValue>" from the "SettingSelect"
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name | describe | group         | spl                                  | chart | xAxis   | tag        | order        | yAxis   | unit | smooth | connectEmptyData | min | max   | settingSwitch | fieldValue | position | colour |
      | 曲线图  | test     | default_Trend | * \|stats count() by appname,logtype | Line  | appname | Horizontal | DefaultOrder | count() |      | Smooth | ConnectEmptyData | 10  | 30000 |               | logtype    |          | Purple |
