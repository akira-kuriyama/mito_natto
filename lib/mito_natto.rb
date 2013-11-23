# coding: utf-8
require "mito_natto/version"

require 'natto'
require 'mito_natto_node'

module MitoNatto

  def self.parse(text)
    node_list = []
    if text == nil || text == ''
      return node_list
    end

    natto_mecab.parse(text) do |node|
      next if node.surface == nil
      mito_natto_node = MitoNattoNode.new
      mito_natto_node.mecab_node = node
      node_list.push(mito_natto_node)
    end
    node_list
  end

  private
  def self.natto_mecab
    natto_mecab ||= Natto::MeCab.new
  end

end
