class Actions
  attr_reader :actions

  def initialize(commission)
    @actions = []
    generate_actions(commission)
  end

  def all
    actions
  end

  private

  def generate_actions(commission)
    actions << Action.new('driver', 'debit', commission.price_with_options)
    actions << Action.new('owner', 'credit', owner_credit(commission))
    actions << Action.new('insurance', 'credit', commission.insurance_fee)
    actions << Action.new('assistance', 'credit', commission.assistance_fee)
    actions << Action.new('drivy', 'credit', commission.drivy_fee)
  end

  def owner_credit(commission)
    commission.price_with_options - commission.fee - commission.insurance_option_price.to_i
  end
end
