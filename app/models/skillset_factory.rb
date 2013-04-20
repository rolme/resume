class SkillsetFactory

  def self.build args
    return build_skillsets_from_config(args[:config]) if args.has_key?(:config)

    Skillset.new
  end

  def self.build_skillsets_from_config config
    skillsets = []
    config.keys.each do |k|
      ss = build_skillset(header: k.to_s.downcase)
      config[k].each do |i|
        ss.items << Item.new(description: i)
      end
      skillsets << ss
    end
    skillsets
  end

  def self.build_skillset args
    Skillset.new header: args[:header]
  end

end
