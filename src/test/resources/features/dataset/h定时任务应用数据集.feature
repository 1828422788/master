@dataset @dataseth @dataset2
Feature: 数据集-h在定时任务应用-编辑页面&详情页，前置-数据集-f构建树形结构

  #前置条件的tag是：fatherson，--创建3个数据集：父子行为无，父子行为汇聚，父子行为继承
  @dataseth1
  Scenario Outline: 新建数据集父子行为无的定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "left" side
    And I drag the element "SearchPageSvg" to the fixed side
    And I wait for loading invisible
    Given I set the parameter "SearchInput" with value "<spl>"
    #选择父子行为为无的数据集
    When I click the "fatherChildNull" button
    When I click the "DateEditor" button
    #And I click the "RecentSevenDay" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading invisible
#    And I drag the element "SearchPageSvg" to the "right" side

    When I click the "SaveAsOther" button
    When I click the "TimedTask" button

    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username

    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "<describe>"

#    When I click the "Crontab" button
#    And I wait for loading invisible
#    And I wait for "CrontabInput" will be visible
    And I set the parameter "CrontabInput" with value "<crontab>"

##    此处再次输入名称的原因是：之前输入的名称可能会消失，出现提示输入名称的情况，为了保险起见，再次输入名称
#    And I set the parameter "TaskName" with value "<taskName>"

#    When I click the "EnsureButton" button
    And I click the "Submit" button

    And I wait for "1500" millsecond
    And I wait for "SuccessMessage" will be visible
#    Then I will see the success message "创建成功"
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                  | taskName | describe      | crontab        |
      | tag:sample04061424 \| stats count() by apache.status | 父子行为无    | 选择了父子行为为无的数据集 | 0 */57 * * * ? |

  @dataseth2
  Scenario Outline: RZY-4126:定时任务-父子行为无-编辑页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
        #验证数据集在定时任务中的显示
    When the data name is "{'column':'1','name':'<taskName>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    Given I wait for loading complete
    And I wait for "5000" millsecond

#    When I wait for "DataSetLink" will be visible
    When I click the "DatasetLink" button
    When I wait for "FatherChildNull1Task" will be visible
#    Then I will see the "dataSet" result will be "<dataSetResult>"

    Examples:
      | taskName | dataSetResult |
      | 父子行为无    | (tag:sample*) |

  @dataseth3
  Scenario Outline: RZY-4126:定时任务-父子行为无-详情页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Given I wait for loading complete

    And I set the parameter "SearchNameInput" with value "父子行为无"
    Given I wait for loading complete
    And I wait for "2000" millsecond

#    Given I click the detail which name is "{'column':'1','name':'父子行为无'}"
    Given I click the which name is "父子行为无"

    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"

    Examples:
      | dataSetResult |
      | (tag:sample*) |

  ##################################无耻的分割线###############################
  @dataseth4
  Scenario Outline: 新建数据集父子行为汇聚的定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading invisible
    And I drag the element "SearchPageSvg" to the fixed side

    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为汇聚的数据集
    When I click the "huiJu" button
    When I click the "DateEditor" button
    #And I click the "RecentSevenDay" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading invisible

    When I click the "SaveAsOther" button
    When I click the "TimedTask" button

    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username

    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "<describe>"
    And I set the parameter "CrontabInput" with value "<crontab>"

    And I click the "Submit" button
    And I wait for "3000" millsecond
#    Then I will see the success message "创建成功"
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                  | taskName | describe       | crontab        |
      | tag:sample04061424 \| stats count() by apache.status | 父子行为汇聚   | 选择了父子行为为汇聚的数据集 | 0 */57 * * * ? |


  @dataseth5
  Scenario Outline:  RZY-4129:定时任务-父子行为汇聚-编辑页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
        #验证数据集在定时任务中的显示
    When the data name is "{'column':'1','name':'<taskName>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    Given I wait for loading complete
    And I wait for "5000" millsecond

    When I click the "DatasetLink" button
    When I wait for "HuiJuTask" will be visible

    Examples:
      | taskName | dataSetResult                                           |
#      | 父子行为汇聚   | (* AND tag:sample* AND (tag:beyond4 OR appname:apache)) |
      | 父子行为汇聚   | ((*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))) |

  @dataseth6
  Scenario Outline: RZY-4129:定时任务-父子行为汇聚-详情页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Given I wait for loading complete
    And I wait for "2000" millsecond

#    Given I click the detail which name is "{'column':'1','name':'父子行为汇聚'}"
    Given I click the which name is "父子行为汇聚"
    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"

    Examples:
      | dataSetResult                                           |
#      | (* AND tag:sample* AND (tag:beyond4 OR appname:apache)) |
      | ((*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))) |

##################################无耻的分割线###############################
  @dataseth7
  Scenario Outline: 新建数据集父子行为继承的定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading invisible
#    And I drag the element "SearchPageSvg" to the "left" side
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为继承的数据集
    When I click the "jiCheng" button
    When I click the "DateEditor" button
    #And I click the "RecentSevenDay" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading invisible

    When I click the "SaveAsOther" button
    When I click the "TimedTask" button

    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username

    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "<describe>"
    And I set the parameter "CrontabInput" with value "<crontab>"

    And I click the "Submit" button
    And I wait for "1500" millsecond
    And I wait for "SuccessMessage" will be visible
#    Then I will see the success message "创建成功"
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                  | taskName | describe       | crontab        |
      | tag:sample04061424 \| stats count() by apache.status | 父子行为继承   | 选择了父子行为为继承的数据集 | 0 */57 * * * ? |

  @dataseth8
  Scenario Outline: RZY-4130:定时任务-父子行为继承-编辑页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    #验证数据集在定时任务中的显示
    When the data name is "{'column':'1','name':'<taskName>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    Given I wait for loading complete
    And I wait for "5000" millsecond

    When I click the "DatasetLink" button
    When I wait for "JiCheng1Task" will be visible

    Examples:
      | taskName | dataSetResult       |
#      | 父子行为继承   | (* AND tag:sample*) |
      | 父子行为继承   | ((*) AND (tag:sample*)) |

  @dataseth9
  Scenario Outline: RZY-4130:定时任务-父子行为继承-详情页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Given I wait for loading complete
    And I wait for "2000" millsecond

#    Given I click the detail which name is "{'column':'1','name':'父子行为继承'}"
    Given I click the which name is "父子行为继承"

    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"

    Examples:
      | dataSetResult       |
#      | (* AND tag:sample*) |
      |((*) AND (tag:sample*))|