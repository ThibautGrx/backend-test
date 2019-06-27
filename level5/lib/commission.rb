class Commission
  attr_reader :price, :duration, :options

  def initialize(price, duration, options)
    @price = price
    @duration = duration
    @options = options
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
    fee - assistance_fee - insurance_fee + insurance_option_price.to_i
  end

  def price_with_options
    price + options_price.to_i
  end

  def insurance_option_price
    OPTIONS_PRICE[:additional_insurance] * duration if options.include?('additional_insurance')
  end

  private

  def options_price
    options.map { |option| OPTIONS_PRICE[option.to_sym] }.sum * duration if options.any?
  end
end
