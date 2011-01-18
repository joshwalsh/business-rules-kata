Feature: Physical Products
  If the payment is for a physical product, generate a packing slip for shipping.

  Scenario: Process an order for a single physical product
    When a customer orders 1 product: "violin" for $2000
    When the order is placed
    Then I should print paperwork:
    """
    CUSTOMER PACKING SLIP
    ====================
    1 x violin : $2000 => $2000
    ---------
    Total: $2000

    """

  Scenario: Process an order for a multiple physical products
    When a customer orders 1 product: "violin" for $2000
    And a customer orders 1 product: "cello" for $3000
    When the order is placed
    Then I should print paperwork:
    """
    CUSTOMER PACKING SLIP
    ====================
    1 x violin : $2000 => $2000
    1 x cello : $3000 => $3000
    ---------
    Total: $5000

    """

  Scenario: Process an order for a multiple quantities of physical products
    When a customer orders 3 products: "violin" for $2000
    And a customer orders 2 products: "cello" for $3000
    When the order is placed
    Then I should print paperwork:
    """
    CUSTOMER PACKING SLIP
    ====================
    3 x violin : $2000 => $6000
    2 x cello : $3000 => $6000
    ---------
    Total: $12000

    """
