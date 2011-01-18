Feature: Books
  If the payment is for a book, create a duplicate packing slip for the royalty department.

  @wip
  Scenario: Process an order for a single book
    When a customer orders 1 book: "A Walk in the Woods" for $15
    When the order is placed
    Then I should print paperwork:
    """
    CUSTOMER PACKING SLIP
    ====================
    1 x A Walk in the Woods : $15 => $15
    ---------
    Total: $15

    ROYALTY DEPT PACKING SLIP
    ====================
    1 x A Walk in the Woods : $15 => $15
    ---------
    Total: $15

    """
