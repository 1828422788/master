#@cleanGalaxee
#Feature: 数据大屏-删除
#
#  Background:
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#
#  Scenario Outline: 删除大屏
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#
#    Examples:
#      | name   |
#
#          | 中国地图II数据之搜索   |
