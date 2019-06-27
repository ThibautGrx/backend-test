class Commission
  attr_reader :price, :duration

  def initialize(price, duration)
    @price = price
    @duration = duration
  end

  def to_h
    {
      "insurance_fee": insurance_fee,
      "assistance_fee": assistance_fee,
      "drivy_fee": drivy_fee
    }
  end

  def fee
    (price * FEE_RATE).to_i
  end

  def insurance_fee
    (fee * INSURANCE_FEE_RATE).to_i
  end

  def assistance_fee
    duration * ASSISTANCE
  end

  def drivy_fee
    fee - assistance_fee - insurance_fee
  end
end
