@dataset @dataseta @dataset1
Feature: 数据集-a新建
  And I zoom the screen up to the maximum

  @tc4082
  Scenario Outline: RZY-4082:新建数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button

    Given I wait for loading complete
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<Spl>"

    And I choose the "app之api全部用例" from the "appList"
    And I wait for "2000" millsecond
    And I choose the "auto_ui" from the "ResourceGroupList"
    And I click the "Save" button

    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
   #返回列表页验证
    And I click the "backList" button

    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'2','name':'jnd'}"
    And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'3','name':'无'}"
    And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'4','name':'app之api全部用例'}"
#    And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'6','name':'auto_package'}"
#   And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'6','name':'admin'}"

    Examples: 新建成功
      | name    | alias | Spl |
      | JNDTest | jnd   | *   |

# # ################################## 插播几条查询的case，依赖与上一条case的新建
  @tc4075
  Scenario Outline: RZY-4075:按资源查询
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When I choose the "<GroupList>" from the "ResourceDropdown"
    And I wait for loading invisible

#    Then I will see the data "{'column':'0','name':'<name>'}" values "{'column':'6','name':'auto_package'}"

    Examples:
      | GroupList    | name    |
      | auto_package | JNDTest |

  Scenario Outline: RZY-4076:按名称查询
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When I set the parameter "SearchInput" with value "<name>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name    |
      | JNDTest |

  Scenario: RZY-4074:按应用查询
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    And I choose the "app之api全部用例" from the "appSearch"
    And I wait for loading invisible
#    Then I will see the search result contains "{'column':'0','name':'分组和应用'}"
    Then I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'4','name':'app之api全部用例'}"

  @tc4078
  Scenario Outline: RZY-4078:标签
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
#    Given the data name is "<name>" then i click the "标签" button
    When the data name is "{'column':'0','name':'<name>'}" then i click the "标签" button in more menu
    And I click the "TagDropdown" button
    And I set the parameter "TagInput" with value "<Type>"
    And I wait for "2000" millsecond
    And I choose the "<Type>" from the "TagDropdown"
    And I click the "Ensure" button
   #Then I will see the success message "修改成功"
    And I wait for loading invisible
#    Then I will see the data "{'column':'0','name':'<name>'}" values "{'column':'6','name':'1pre_package'}"
    #And I will see the data "{'column':'0','name':'JNDTest'}" values1 "{'column':'6','name':'1pre_package,auto_package'}" values2 "{'column':'6','name':'auto_package,1pre_package'}"

    Examples:
      | name    | Type         |
      | JNDTest | 1pre_package |

 ####################插播完毕#######继续新建

  @tc4086
  Scenario: 新建数据集失败-RZY-4086:3个提示
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I wait for loading invisible
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the element "tipsName" name is "请输入数据集名称"
    Then I will see the element "tipsAlias" name is "请输入别名"
    Then I will see the element "tipsYuJu" name is "请输入约束语句"

  @tc4087
  Scenario: 新建数据集失败-RZY-4087:2个提示
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I wait for loading invisible
    And I set the parameter "Name" with value "failOne"

    And I click the "Save" button
#    Then I will see the element "tipsAlias" name is "请输入别名"    Then I will see the data "{'column':'0','name':'<name>'}" values "{'column':'6','name':'auto_package'}"
    Then I will see the element "tipsYuJu" name is "请输入约束语句"

  @tc4088
  Scenario: 新建数据集失败-RZY-4088:1个提示
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I wait for loading invisible

    And I set the parameter "Name" with value "failTwo"
    And I set the parameter "Alias" with value "failAlias"

    And I click the "Save" button
    Then I will see the element "tipsYuJu" name is "请输入约束语句"