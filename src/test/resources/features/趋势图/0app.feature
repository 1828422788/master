@createEssentialData @baseUser @dataTrendTest
Feature:新建应用

#Datasets for trend
  Scenario: upload_app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/src/test/resources/testdata/app/test_app.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    And I click the "DoneButton" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"