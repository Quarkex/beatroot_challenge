class Model

  def initialize(model)
    model.keys.each do |attr, value|
      first, *rest = attr.split('_')
      rest = rest.collect(&:capitalize)
      key = first + rest.join

      model[attr] = Model.new(model[attr]) if model[attr].is_a?(Hash)

      model[attr].map!{|val|
        if val.is_a?(Hash) then Model.new(val) else val end
      } if model[attr].is_a?(Array)# TODO add support for multidimensional arrays

      define_singleton_method("#{key}=") { |val|

        val.map!{|v|
          if v.is_a?(Hash) then Model.new(v) else v end
        } if val.is_a?(Array)# TODO add support for multidimensional arrays

        model[attr] = val.is_a?(Hash) ? Model.new(val) : val
      }
      define_singleton_method(key) { model[attr] }
    end
  end

end
