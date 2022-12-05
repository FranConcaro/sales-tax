class TaxCalculator
  Basic_sales_tax = 0.1
  Import_duty_tax = 0.05

  def calculate_taxes(product)
    product.tax_amount = tax(product).round(2)
    product.total = total(product).round(2)

    product
  end

  private

  def tax(product)
    tax_amount = 0
    tax_amount += product.exempt? ? 0 : apply_tax(product, Basic_sales_tax)
    tax_amount += product.imported? ? apply_tax(product, Import_duty_tax) : 0
    tax_amount
  end

  def apply_tax(product, tax)
    amount = product.price * tax
    if tax == Basic_sales_tax
      round(2, amount)
    else
      round(1, amount)
    end
  end

  def total(product)
    total = (product.price + product.tax_amount) * product.quantity
    round(2, total)
  end

  def round(decimals, amount)
    amount.round(decimals, half: :even)
  end
end
