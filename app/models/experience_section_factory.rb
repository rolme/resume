class ExperienceSectionFactory

  def self.build args
    es = args.has_key?(:config) ? build_experience_sections_from_config(args[:config]) : ExperienceSection.new
  end

  def self.build_experience_sections_from_config config
    experience_sections = []
    config.each do |es|
      es.keys.each do |k|
        es[k.downcase.to_sym] = es[k]
        es.delete(k)
      end
      experience_sections << build_experience_section(es)
    end
    experience_sections
  end

  def self.build_experience_section params
    es = ExperienceSection.new
    items = []

    if params.has_key?(:items)
      params[:items].each do |d|
        items << Item.new(section: es, description: d)
      end
      es.items = items
      params.delete(:items)
    end
    es.experience = Experience.new(params)
    es
  end

end