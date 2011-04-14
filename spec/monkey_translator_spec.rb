# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

dir = Pathname(__FILE__).dirname.expand_path

require dir + 'mktr_config'

describe "MonkeyTranslator" do
  it "turns a regular string into Chinese by calling .to_chinese" do
    "what".to_chinese.should == "什么"
  end

  it "fails to translate string to Chinese if no Google API key is set" do
    MKTR_CONFIG[:key] = "bad-key"
    "what".to_chinese.should_not == "什么"
  end
  
end
