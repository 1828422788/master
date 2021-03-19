Feature: 导入交易日

#  @pre00 @trandate
#  Scenario:执行导入
#    When open the "system.CustomConfigs" page for uri "/system/"
#    And I wait for loading complete
#    When I upload a file "uploadTranDate" with name "/src/test/resources/testdata/app/trandatefiles/01tran.csv"

  @pre00 @trandate
  Scenario Outline: 创建交易日csv文件并上传
#    Given open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading complete
    And I create "<dayCount>" days csv file from now
    And I wait for "5000" millsecond
    When I click the "TrandateFeature" button
    And I wait for loading complete
    When I upload a file "uploadTranDate" with name "/src/test/resources/testdata/app/trandatefiles/trandate.csv"
#    When I upload a file "Upload" with name "/src/test/resources/testdata/app/v35资源包监控60个.tar"
#    yotta-message-manager
#    Then I will see the success message "更新成功"

    Examples:
      |  dayCount   |
      |  20   |




