# coding: utf-8
require 'rspec'
require 'mito_natto'

describe MitoNatto do

  describe 'parse' do

    context '引数がnilの場合' do
      it do
        node_list = MitoNatto.parse nil
        expect(node_list).to eq([])
      end
    end

    context '引数が空文字の場合' do
      it do
        node_list = MitoNatto.parse ''
        expect(node_list).to eq([])
      end
    end

    context '引数が空ではない場合' do
      it do
        surface_result = %w[今日 は いい 天気 な ので 北海道 に 行き まし た 。]
        features_result = {
                            '今日' =>
                               {
                                   '品詞' => '名詞',
                                   '品詞細分類1' => '副詞可能',
                                   '品詞細分類2' => '*',
                                   '品詞細分類3' => '*',
                                   '活用形' => '*',
                                   '活用型' => '*',
                                   '原形' => '今日',
                                   '読み' => 'キョウ',
                                   '発音' => 'キョー'

                               },
                            'は' =>
                                {
                                    '品詞' => '助詞',
                                    '品詞細分類1' => '係助詞',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '*',
                                    '活用型' => '*',
                                    '原形' => 'は',
                                    '読み' => 'ハ',
                                    '発音' => 'ワ'

                                },
                            'いい' =>
                                {
                                    '品詞' => '形容詞',
                                    '品詞細分類1' => '自立',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '形容詞・イイ',
                                    '活用型' => '基本形',
                                    '原形' => 'いい',
                                    '読み' => 'イイ',
                                    '発音' => 'イイ'

                                },
                            '天気' =>
                                {
                                    '品詞' => '名詞',
                                    '品詞細分類1' => '一般',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '*',
                                    '活用型' => '*',
                                    '原形' => '天気',
                                    '読み' => 'テンキ',
                                    '発音' => 'テンキ'

                                },
                            'な' =>
                                {
                                    '品詞' => '助動詞',
                                    '品詞細分類1' => '*',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '特殊・ダ',
                                    '活用型' => '体言接続',
                                    '原形' => 'だ',
                                    '読み' => 'ナ',
                                    '発音' => 'ナ'

                                },
                            'ので' =>
                                {
                                    '品詞' => '助詞',
                                    '品詞細分類1' => '接続助詞',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '*',
                                    '活用型' => '*',
                                    '原形' => 'ので',
                                    '読み' => 'ノデ',
                                    '発音' => 'ノデ'

                                },
                            '北海道' =>
                                {
                                    '品詞' => '名詞',
                                    '品詞細分類1' => '固有名詞',
                                    '品詞細分類2' => '地域',
                                    '品詞細分類3' => '一般',
                                    '活用形' => '*',
                                    '活用型' => '*',
                                    '原形' => '北海道',
                                    '読み' => 'ホッカイドウ',
                                    '発音' => 'ホッカイドー'

                                },
                            'に' =>
                                {
                                    '品詞' => '助詞',
                                    '品詞細分類1' => '格助詞',
                                    '品詞細分類2' => '一般',
                                    '品詞細分類3' => '*',
                                    '活用形' => '*',
                                    '活用型' => '*',
                                    '原形' => 'に',
                                    '読み' => 'ニ',
                                    '発音' => 'ニ'

                                },
                            '行き' =>
                                {
                                    '品詞' => '動詞',
                                    '品詞細分類1' => '自立',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '五段・カ行促音便',
                                    '活用型' => '連用形',
                                    '原形' => '行く',
                                    '読み' => 'イキ',
                                    '発音' => 'イキ'

                                },
                            'まし' =>
                                {
                                    '品詞' => '助動詞',
                                    '品詞細分類1' => '*',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '特殊・マス',
                                    '活用型' => '連用形',
                                    '原形' => 'ます',
                                    '読み' => 'マシ',
                                    '発音' => 'マシ'

                                },
                            'た' =>
                                {
                                    '品詞' => '助動詞',
                                    '品詞細分類1' => '*',
                                    '品詞細分類2' => '*',
                                    '品詞細分類3' => '*',
                                    '活用形' => '特殊・タ',
                                    '活用型' => '基本形',
                                    '原形' => 'た',
                                    '読み' => 'タ',
                                    '発音' => 'タ'
                                }
        }
        node_list = MitoNatto.parse('今日はいい天気なので北海道に行きました')
        node_list.each_with_index do |node, index|
          expect(node.surface).to eq(surface_result[index])
          expect(node.品詞).to eq(features_result[node.surface]['品詞'])
          expect(node.品詞細分類1).to eq(features_result[node.surface]['品詞細分類1'])
          expect(node.品詞細分類2).to eq(features_result[node.surface]['品詞細分類2'])
          expect(node.品詞細分類3).to eq(features_result[node.surface]['品詞細分類3'])
          expect(node.活用形).to eq(features_result[node.surface]['活用形'])
          expect(node.活用型).to eq(features_result[node.surface]['活用型'])
          expect(node.原形).to eq(features_result[node.surface]['原形'])
          expect(node.読み).to eq(features_result[node.surface]['読み'])
          expect(node.発音).to eq(features_result[node.surface]['発音'])

          expect(node.noun).to eq(features_result[node.surface]['品詞'])
          expect(node.noun_detail1).to eq(features_result[node.surface]['品詞細分類1'])
          expect(node.noun_detail2).to eq(features_result[node.surface]['品詞細分類2'])
          expect(node.noun_detail3).to eq(features_result[node.surface]['品詞細分類3'])
          expect(node.inflected_form).to eq(features_result[node.surface]['活用形'])
          expect(node.inflected_type).to eq(features_result[node.surface]['活用型'])
          expect(node.root_form).to eq(features_result[node.surface]['原形'])
          expect(node.reading).to eq(features_result[node.surface]['読み'])
          expect(node.pronunciation).to eq(features_result[node.surface]['発音'])

          expect(node.features).to eq(features_result[node.surface].values)
          end
      end
    end
  end
end

