Feature: 机器学习模型管理导入

  Background:
    Given open the "machineLearning.ModelManagerPage" page for uri "/app/machine_learning/model_manager/"
    And I wait for loading invisible

  Scenario:
    When I click the "ImportAndExportButton" button
    And I click the "ImportButton" button
    And I upload a file with name "/src/test/resources/testdata/machineLearning/test.tar"
    Then I will see the element "VerifyText" name is "上传完成"
    And I click the "NextButton" button
    And I click the "Line1" button
    And I click the "Edit" button
    And I set the parameter "NameInput" with value "AutoTest1"
    And I click the "Confirm" button

    And I click the "Line2" button
    And I click the "Edit" button
    And I set the parameter "NameInput" with value "AutoTest2"
    And I click the "Confirm" button

    And I click the "Line1" button
    And I click the "Edit" button
    And I set the parameter "NameInput" with value "AutoTest3"
    And I click the "Confirm" button

    And I click the "Line2" button
    And I click the "Edit" button
    And I set the parameter "NameInput" with value "AutoTest4"
    And I click the "Confirm" button
    And I wait for "2000" millsecond

    And I click the "Line1" button
    And I click the "Edit" button
    And I set the parameter "NameInput" with value "AutoTest5"
    And I click the "Confirm" button
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    Then I will see the element "ImportSuccess" name is "导入成功"
    And I click the "Complete" button
    And open the "machineLearning.ModelManagerPage" page for uri "/app/machine_learning/model_manager/"
    Then I will see the search result contains "{'column':'1','name':'AutoTest1'}"
    Then I will see the search result contains "{'column':'1','name':'AutoTest2'}"
    Then I will see the search result contains "{'column':'1','name':'AutoTest3'}"
    Then I will see the search result contains "{'column':'1','name':'AutoTest4'}"
    Then I will see the search result contains "{'column':'1','name':'AutoTest5'}"
