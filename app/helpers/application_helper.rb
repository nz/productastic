module ApplicationHelper

  def phrases_for_hit(search_hit, field)
    search_hit.highlights(field).map do |highlight|
      highlight.instance_eval { @highlight }.scan(/@@@hl@@@([^@]+)@@@endhl@@@/)
    end.flatten
  end
  

  HL_BEG = '@@@HL_BEG@@@'
  HL_END = '@@@HL_END@@@'

  # highlight the phrase with special markers,
  # collapse multiple adjacent highlights
  # and insert tags safely and sanitarily
  def smart_highlight(search_hit, field, tag=:em)
    # mark the string to be highlighted
    marked = search_hit.highlight(field).format do |phrase|
      "#{HL_BEG}#{phrase}#{HL_END}"
    end
    
    # collapse adjacent
    marked.gsub("#{HL_END} #{HL_BEG}", ' ')
    
    # interpolate highlighting tags with sanitization
    highlighted = safe_join(marked.split(HL_BEG), "<#{tag} class='highlight'>".html_safe)
    highlighted = safe_join(highlighted.split(HL_END), "</#{tag}>".html_safe)
  end
  
  # Center truncation around an HTML tag, so we can focus on highlights
  def smart_truncate(str, options={})
    str[/[^ ]* ?.{,20}<em[^>]*>.*em>.{,20}[^ ]* ?[^ ]*/]
  end
  
end
