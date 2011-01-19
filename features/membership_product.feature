Feature: Membership Product
  If the payment is for a membership, activate that membership.

  @wip
  Scenario: Process an order for a membership
    Given a customer orders 1 membership: "Mentorship Course" for $100
    When the order is placed
    Then I should print paperwork:
    """
    CUSTOMER PACKING SLIP
    ====================
    1 x Mentorship Course : $100 => $100 (activated)
    ---------
    Total: $100

    """
