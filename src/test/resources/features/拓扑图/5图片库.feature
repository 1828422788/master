@topology
Feature: 图片库


  Scenario Outline: 上传图片
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "PictureGallary" button
    And I click the "Upload" button
    And I wait for "2000" millsecond
    And I click the "ClickUpload" button
    And I upload a file with name "<source>"
    And I wait for "1500" millsecond
    #Then I will see the success message "上传完成"
    And I will see the element "UploadSuccess" value contains "上传完成"
    And I wait for "1500" millsecond
    Then I click the "ConfirmOfPicture" button
    And I wait for "2000" millsecond

    Examples:
      | source |
      | /src/test/resources/testdata/image/smallRobbot.png |
      | /src/test/resources/testdata/image/delete.png  |

  Scenario: 验证上传成功
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "PictureGallary" button
    And I wait for "2000" millsecond
    Then I will see the "PictureName" is display

  Scenario: 删除图片
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "PictureGallary" button
    And I wait for "2000" millsecond
    And I click the "Manager" button
    And I click the "PictureToDelete" button
    Then I click the "Delete" button
    And I wait for "1000" millsecond
    Then I will see the message contains "删除图片成功"

  Scenario: 验证删除图片成功
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "PictureGallary" button
    And I wait for "2000" millsecond
    Then I will see the "PictureToDelete" doesn't exist


  #V3.6
 # Scenario: 上传自定义图标1
 #   When I click the detail which name is "图标节点"
 #   And I will see the "topology.DetailPage" page
 #   And I wait for "Icon" will be visible
 #   And I click the "Icon" button
 #   And I set the parameter "IconNodeName" with value "node"
 #   And I upload a file with name "/src/test/resources/testdata/image/smallRobbot.png"
 #   And I click the "Image" button
 #   And I click the "AddNodeButton" button
 #   And I click the "Save" button
 #   And I refresh the website
 #   And I accept alert window
 #   And open the "topology.ListPage" page for uri "/topology/"

 # Scenario: 验证自定义图标保存成功
 #   When I click the detail which name is "图标节点"
 #   And I will see the "topology.DetailPage" page
 #   Then I wait for "ImgNode" will be visible
 #   And open the "topology.ListPage" page for uri "/topology/"

 # Scenario: 更新图标节点
 #   When I click the detail which name is "图标节点"
 #   And I will see the "topology.DetailPage" page
 #   And I wait for "EditNode" will be visible
 #   And I click the "EditNode" button
 #   And I wait for "ExchangeMachine" will be visible
 #   And I click the "ExchangeMachine" button
 #   And I click the "UpdateNode" button
 #   And I click the "Save" button
 #   And I refresh the website
 #   And I accept alert window
 #   And open the "topology.ListPage" page for uri "/topology/"

 # Scenario: 验证更新图标节点成功
 #   When I click the detail which name is "图标节点"
 #   And I will see the "topology.DetailPage" page
 #   And I wait for "ExchangeMachineIcon" will be visible
 #   And open the "topology.ListPage" page for uri "/topology/"

#  Scenario Outline: 删除拓扑图
#    Given the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button

#    Examples:
#      | name |
#      | 图标节点 |