class XML_View

  attr_accessor :root, :dictionary

  def initialize(root="root", dictionary = {})
    @root = root
    @dictionary = dictionary
  end

  def generate(node, root=@root)
    output = nil

    case true
    when node.nil?
      output = ''
    when node.is_a?(Array)
      item_tag = (@dictionary.key? root.to_sym) ? @dictionary[root.to_sym] : 'item'
      node.map!{|v| generate(v, item_tag)}
      output = node.join ''
    when node.is_a?(Hash)
      output = []
      node.keys.each do | key |
        output.push(generate(node[key], key))
      end
      output = output.join ''
    else
      output = node
    end

    if not output.nil? then
      output = root.nil? ? "#{output}" : "<#{root}>#{output}</#{root}>"
    end

    output

  end

end
