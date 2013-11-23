# coding: utf-8
require "mito_natto/version"

require 'natto'

class MitoNattoNode

  attr_accessor :mecab_node

  def surface
    mecab_node.surface
  end

  def features
    @features ||= mecab_node.feature.split(',')
  end

  def method_missing(method_name)
    [ELEMENTS_JA, ELEMENTS_EN].each do |elements|
      if elements.include?(method_name.to_s)
        return features[elements.find_index(method_name.to_s)]
      end
    end
    super
  end

  def respond_to?(method_name)
    [ELEMENTS_JA, ELEMENTS_EN].each do |elements|
      if elements.include?(method_name.to_s)
        return true
      end
    end
    super
  end

  private

  ELEMENTS_JA = %w(品詞 品詞細分類1 品詞細分類2 品詞細分類3 活用形 活用型 原形 読み 発音).freeze
  ELEMENTS_EN = %w(noun noun_detail1 noun_detail2 noun_detail3 inflected_form inflected_type root_form reading pronunciation).freeze
end