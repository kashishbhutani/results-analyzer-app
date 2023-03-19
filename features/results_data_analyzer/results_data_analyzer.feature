Feature: Results Data Analyzer

  Scenario: Store Results Data To Result Analyzer App With Valid Data
    Given 1 student submitted the online test
    When MSM service submits the test result data to result analyzer app
    Then the test result should get stored

  Scenario: Store Results Data To Result Analyzer App With Invalid Data
    Given 1 student submitted the online test
    When MSM service submits the incomplete test result data to result analyzer app
    Then the test result should not get stored
