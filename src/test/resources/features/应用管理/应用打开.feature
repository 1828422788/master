@all @smoke @app
Feature: 打开应用

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario:
    When the data name is "AutoTest" then i click the "打开" button