# Provides a way to throw many different dice, and many different times.
class Dice
  # Throws a die, perhaps many times, and reports its result.
  def self.throw_one(count, sides)
    if sides < 2 || count.zero?
      raise ArgumentError, 'Invalid die spec: ' + spec
    end

    { count: count, sides: sides,
      values: count.times.map { Random.rand(sides) + 1 } }
  end

  # Parses a single dice spec, throws the die, and reports its details and result.
  def self.parse_one(spec)
    if match = /^(?<sides>\d+)$/.match(spec)
      throw_one(1, match[:sides].to_i)
    elsif match = /^(?<count>\d+)d(?<sides>\d+)$/.match(spec)
      throw_one(match[:count].to_i, match[:sides].to_i)
    else
      raise ArgumentError, 'Invalid die spec: ' + spec
    end
  end

  private_class_method(:throw_one)
  private_class_method(:parse_one)

  # Parses an incoming array of dice spec, and one by one
  # reports their results and also the overall aggregate.
  def self.parse(specs)
    details = []
    total = 0
    specs.each do |spec|
      result = parse_one(spec)
      total += result[:values].sum
      details << result
    end
    { details: details, total: total }
  end
end
