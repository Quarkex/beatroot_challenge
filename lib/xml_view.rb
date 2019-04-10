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

      # We use a dictionary to determine how to generate the subnodes
      # The subnodes will be “item” bu default, but if they are defined
      # we'll use that value instead. In the case that it is defined as nil
      # we asume this array to be an array of nodes with the same tag, instead
      # of an array of subnodes. This makes possible to represent this structure
      # in JSON, as it is impossible to have the same key repeated in the same
      # level in a JSON. If this is the case, we set “root” to nil to get ride
      # of the external tags at the end of the function.
      item_tag = 'item'
      if @dictionary.key? root.to_sym then
        if @dictionary[root.to_sym].nil? then
          item_tag = root
          root = nil
        else
          item_tag = @dictionary[root.to_sym]
        end
      end

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
