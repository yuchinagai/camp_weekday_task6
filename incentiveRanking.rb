# 問題：
#     VERTEXグループは勉強熱心なエンジニアに奨励金を出すために
#     各メンバーが学習に費やした金額を可視化しようとしています。

#     メンバーそれぞれの学習費用を計算し
#     値が高い人から順に名前と金額を出力するプログラムを作成してください。
#
#     入力は、data00*.txt(* = 1~3)ファイルから与えられます。
#     ・1 行目に、人数 N が文字列型の整数で与えられます。
#     ・2 行目に、半角英文字で構成される文字列が N 個スペース区切りで与えられます。
#     ・3 行目に、全メンバーが学習した回数 M が文字列型の整数で与えられます。
#     ・4 行目から続く M 行には、 学習した人の名前を表す半角英文字で構成される文字列 と
#     　学習コストを表す文字列型の整数 がこの順にスペース区切りで与えられます。
#     ・入力は合計で M + 3 行となり、入力値最終行の末尾に改行が１つ入ります。

# 解答：
1.upto 3 do |t|
  puts "例#{t}の答え"
  File.open("data00#{t}.txt", "r"){ |f|
  # 1行目呼び出し
  member_num = f.gets.to_i
  # 2行目呼び出し
  member_name = f.gets.split
  # 3行目をsplitしてvalueが0のhashに変換
  hash = {}
  member_name.each do |value|
  hash.store(value, 0)
  end
  # 4行目呼び出し
  study_times = f.gets.to_i
  # 4行目の数だけ5行目以降を呼び出して、hashを更新。
  study_times.times do |study|
  studycost = f.gets.split
  hash[studycost[0]] += studycost[1].to_i
  end
  # hashの並び替え
  p hash.sort_by { |key, value| -value }.to_h
  }
end


# data001で期待する出力
# {"yamaguchi"=>1500, "maeda"=>1000}
# data002で期待する出力
# {"A"=>3000, "C"=>2000, "B"=>1000}
# data003で期待する出力
# {"yamaguchi"=>13500, "asano"=>13000, "maeda"=>10000, "fujita"=>8000, "nishino"=>7000, "takahashi"=>6000, "harada"=>5500, "kobira"=>5000, "nakayashiki"=>2000, "ishikawa"=>1500, "sugimoto"=>1000}
