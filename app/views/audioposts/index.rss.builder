xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @show.name
    xml.description @show.description
    xml.link show_audioposts_url(@show)

    for audiopost in @audioposts
      xml.item do
        xml.title audiopost.title
        xml.description audiopost.short_note
        xml.pubDate audiopost.created_at.to_s(:rfc822)
        xml.enclosure :url=>audiopost.audio, :type=>"audio/mp3"
        xml.link show_audiopost_url(@show, audiopost)
        xml.guid audiopost.audio 
      end
    end
  end
end