@dataset
Feature: 数据集-修改标签

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario Outline: 修改标签
    Given the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "<Type>"
    And I choose the "<Type>" from the "TagDropdown"
    And I click the "Ensure" button
#    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'5','name':'auto_package'}"

    Examples:
      |name    |Type        |
      |JNDTest|auto_package|