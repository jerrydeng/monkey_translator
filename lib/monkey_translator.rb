require 'httparty'

class String  
  def to_chinese
    key = MKTR_CONFIG[:key]
    sr  = MKTR_CONFIG[:source_language] || "en"
    ds  = MKTR_CONFIG[:destination_language] || "zh-CN"
    query = gsub(" ", "%20")
    response = HTTParty.get('https://www.googleapis.com/language/translate/v2?key='+key+'&q='+query+'&source='+sr+'&target='+ds)
    if response["data"]
      response["data"]["translations"][0]["translatedText"]
    else
      ""
    end
  end
end
