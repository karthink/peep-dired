Feature: Looking up the contents of a file

  Scenario: Seeing contents of the files in a dired buffer
    Given I open dired buffer in the root directory
    And I place cursor on "peep-dired.el" entry
    And I run "peep-dired"
    Then the only visible windows are "peep-dired" and "peep-dired.el"
    When I run "peep-dired"
    Then the peeped buffer "peep-dired.el" should be killed

  Scenario: Seeing contents of directories in a dired buffer
    Given I open dired buffer in the root directory
    And I place cursor on "screenshots" entry
    When I run "peep-dired"
    And the only visible windows are "peep-dired" and "screenshots"
    When I run "peep-dired"
    Then the peeped buffer "screenshots" should be killed

  Scenario: Scrolling buffers in other window
    Given I open dired buffer in the root directory
    And I place cursor on "peep-dired.el" entry
    And I run "peep-dired"
    When I run "peep-dired-scroll-page-down"
    Then I should scroll down "peep-dired.el" buffer in other window
    When I run "peep-dired-scroll-page-up"
    Then I should scroll up "peep-dired.el" buffer in other window
    When I run "peep-dired"
    Then the peeped buffer "peep-dired.el" should be killed

  Scenario: Browsing dired buffer and peeping an already visited buffer
    Given I open "peep-dired.el" file
    And I open dired buffer in the root directory
    And I place cursor on "features" entry
    And I run "peep-dired"
    When I run "peep-dired-next-file"
    Then the peeped buffer "features" should be killed
    And the only visible windows are "peep-dired" and "peep-dired.el"
    When I run "peep-dired"
    Then the peeped buffer "peep-dired.el" should not be killed

