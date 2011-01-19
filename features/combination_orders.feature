Feature: Combination Orders
  Accept orders with different types of products

  @wip
  Scenario: Process an order for a book and a physical product
    When a customer orders 1 book: "A Walk in the Woods" for $15
    When a customer orders 1 product: "Back Scratcher" for $5
    When the order is placed
    Then I should print paperwork:
    """
    CUSTOMER PACKING SLIP
    ====================
    1 x A Walk in the Woods : $15 => $15
    1 x Back Scratcher : $5 => $5
    ---------
    Total: $20

    ROYALTY DEPT PACKING SLIP
    ====================
    1 x A Walk in the Woods : $15 => $15
    1 x Back Scratcher : $5 => $5
    ---------
    Total: $20

    """
