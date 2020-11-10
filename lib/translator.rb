require "yaml"

def load_library(emoticon_file)
  
  emoticons = YAML.load_file(emoticon_file)
  translator_hash = {}

  emoticons.each do |key,value|
    translator_hash[key] = {}
    translator_hash[key][:english] = value[0]
    translator_hash[key][:japanese] = value[1]
   end
  translator_hash
end


def get_japanese_emoticon(emoticon_file, emoticon)
  list = load_list(emoticon_file)
  emoticon = library.keys.find do |key|
    list[key][:english] == emoticon
  end
  emoticon ? list[emoticon][:japanese] : "Sorry, that emoticon was not found"
end



def get_english_meaning(emoticon_file, emoticon)
  list = load_list(emoticon_file)
  emoticon = list.keys.find do |key|
    list[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end