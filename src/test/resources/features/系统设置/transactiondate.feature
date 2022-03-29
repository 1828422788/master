Feature: 前置_系统设置_导入交易日

#  @pre00 @trandate
#  Scenario:执行导入
#    When open the "system.CustomConfigs" page for uri "/system/"
#    And I wait for loading complete
#    When I upload a file "uploadTranDate" with name "/src/test/resources/testdata/app/trandatefiles/01tran.csv"

  @pre00 @trandate
  Scenario Outline: 创建交易日csv文件并上传
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading complete
    And I create "<dayCount>" days csv file from now
    And I wait for "5000" millsecond
    When I click the "TrandateFeature" button
    And I wait for loading complete
    When I upload a file "uploadTranDate" with name "/src/test/resources/testdata/app/trandatefiles/trandate.csv"

    Examples:
      |  dayCount   |
      |  20   |




