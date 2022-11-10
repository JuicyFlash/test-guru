class AbstractRuleSpecification
  def initialize(value:, processed_test:)
     @value = value
     @processed_test = processed_test
  end

  def self.description
    raise "#{__method__} undefined"
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end

