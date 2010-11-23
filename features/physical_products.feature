Feature: Physical Products
  If the payment is for a physical product, generate a packing slip for shipping.

  @wip
  Scenario: Process an order for a single physical product
    When a customer orders 1 "violin" for $2000
    When the order is placed
    Then I should print a packing slip:
    """
    1 x violin: $2000
    ----------
    Total: $2000
    """
