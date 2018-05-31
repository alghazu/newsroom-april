Feature: Create editor dashboard to see articles/comments to approve, decline or delete
  As an Editor
  In order to approve new articles and comments
  I would like to have a separate Editor's page where I can approve/decline/delete articles

Background:
  Given the following users exist
    | email               | password      |
    | journalist@test.com | 12345678      |
    | editor@test.com     | 12345678      |

  And we have the following articles
    | headline               | user                  | published |
    | The awesome article    | journalist@test.com   | false     |
    | A published article    | journalist@test.com   | true      |

  And we have the following comments
    | content    |  article             |
    | Fantastic  |  A published article |

  And I am signed in as "editor@test.com"

Scenario: Editor can approve an article and it will be published
  Given I am on the landing page
  And I should not see "The awsome article"
  When I visit the editor dashboard page
  And I should see "The awesome article" in "Unpublished Articles"
  And I should not see "A published article" in "Unpublished Articles"
  And I click "Approve Article"
  Then I should not see "The awesome article"
  But when I am on the landing page
  Then I should see "The awesome article"

Scenario: Editor can approve a comment and it will be published on the article
  Given I am on the "A published article" page
  And I should not see "Fantastic"
  When I visit the editor dashboard page
  And I should see "Fantastic" in "Unpublished Comments"
  And I click "Approve Comment"
  Then I should not see "Fantastic"
  But I am on the "A published article" page
  Then I should see "Fantastic"
