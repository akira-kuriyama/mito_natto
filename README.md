# MitoNatto

Natto( https://bitbucket.org/buruzaemon/natto )をラップして少し使いやすくしたライブラリです。

## Installation

Add this line to your application's Gemfile:

    gem 'mito_natto'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mito_natto

## Usage

```
# parseメソッドをよぶと、MitoNattoNodeクラスの配列が返ります
node_list = MitoNatto.parse('今日はいい天気なので北海道に行きました')

node_list.each_with_index do |node|

  #MitoNattoNodeクラスには以下の様なメソッドがあります

  p node.surface
  p node.features
  
  p node.品詞
  p node.品詞細分類1
  p node.品詞細分類2
  p node.品詞細分類3
  p node.活用形
  p node.活用型
  p node.原形
  p node.読み
  p node.発音

  #日本語メソッド以外にも英語メソッドもあります
  p node.noun
  p node.noun_detail1
  p node.noun_detail2
  p node.noun_detail3
  p node.inflected_form
  p node.inflected_type
  p node.root_form
  p node.reading
  p node.pronunciation

end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
