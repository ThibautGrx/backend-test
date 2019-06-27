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
    @actions << Action.new('driver', 'debit', commission.price)
    @actions << Action.new('owner', 'credit', commission.price - commission.fee)
    @actions << Action.new('insurance', 'credit', commission.insurance_fee)
    @actions << Action.new('assistance', 'credit', commission.assistance_fee)
    @actions << Action.new('drivy', 'credit', commission.drivy_fee)
  end
end
