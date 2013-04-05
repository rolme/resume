class SkillsetFactory

  def self.build args
    s = args.has_key?(:config) ? build_skillsets_from_config(args[:config]) : Skillset.new
  end

  def self.build_skillsets_from_config config
    skillsets = []
    config[:SKILLSET].keys.each do |k|
      ss = build_skillset(header: k.to_s.downcase)
      config[:SKILLSET][k].each do |i|
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
