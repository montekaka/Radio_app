xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @show.name
    xml.description @show.description
    xml.link show_audioposts_url(@show)  
    xml.pubDate @audioposts.last.created_at.to_s(:rfc822)
    xml.lastBuildDate @audioposts.last.created_at.to_s(:rfc822)  
    xml.itunes :category, :text => 'News &amp; Politics'    
    xml.itunes :author, @show.djname
    
    for audiopost in @audioposts
      xml.item do
        if @show.name == "早晨LA" #hack for 早晨LA to add date for title
       		xml.title audiopost.short_note + audiopost.title.gsub(/\s+/, "") 
		else
			xml.title audiopost.title.gsub(/\s+/, "")
		end	
        xml.description audiopost.short_note
        xml.pubDate audiopost.created_at.to_s(:rfc822)
        xml.enclosure :url=>audiopost.audio, :type=>"audio/mp3"
        xml.link show_audiopost_url(@show, audiopost)
        xml.guid audiopost.audio 
      end
    end
  end
end