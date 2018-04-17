module FormattedCurrency
    # def method_missing(m, *args, &block)
    #   p "Method missing 2"
    # end
  module ClassMethods
    def method_missing(m, *args, &block)
      p "Method missing"
    end
  end

  def self.included(base)
    p "Including base class #{base}"
    base.extend(ClassMethods)
  end

end