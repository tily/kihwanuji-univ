# MEMO

## TODO

* バリデーションエラーをちゃんと出す
* 404 error をちゃんと出す
* i18n 変なところちゃんとする
* view パーツの fragments 化 
* より細かい大学っぽい感じ
** 単位数とか
** 時間の概念
** 教官が学生を採点する
* ステータス (停学・休学等)
* ボタンに bootstrap あたってないところある
* もっと色々な箇所をリンクにする
* e-learning システムとして moodle を導入する
  * だいぶ前に moodle さわったとき UX ひどい感じしたけど、今ならうける感じになってるかもしれない
  * buildpack で heroku にデプロイしたい
  * キハヌジ大学に登録したらキハヌジ大学 moodle にもユーザー登録されるみたいな感じにしたい
* 言語選択で現在選択されている言語を表示
* シラバス作成・編集のフォーム、N 曜 M 限のところだけ inline っぽく横に並ぶようにしたい
* kaminari でページネートする
* 並び順を新しい順にする (だいたいやったけど show ページでまだできていないところがありそう)
* 時間割描画
  * 普通にテーブルで描画すると見づらい感じになった、見せ方を考える必要あり
* さみしいので学生を faker japanese で大量生産したい
* 講義のハッシュタグ
  * 教室をハッシュタグにして #kihwanuji_univ #教室名 の検索結果を表示したい
  * API だと limit があってだるいのでなんとか API 使わず search するやり方がないものか

## DONE

* お知らせを #kihwanuji-univ ハッシュタグの検索結果にしたい
* ナビゲーションバー、だいたい仕組みはできた
* i18n 英語、キハヌジ語対応、だいたい仕組みはできた
* 画像が足りない、 twitter icon 表示できるようにしたい
* 論文をマークダウンで書けるように、redcarpet を導入
* 権限管理をもう少ししっかりやる、だいたい大丈夫っぽい
* 言語選択がまともに動かない、before フィルタをグローバルにして直った
* About Us ページを作る
* is_student を false でアレできないかも
* 編集時に前の情報がうまく再現されていない、アカウント
* リンク系、ちゃんとする
* show 系ページがしょぼい、とくに course/lecture
* バリデーションエラー表示
* タイトルタグをちゃんとする
* is_student/teacher を無効にしていれば教師／生徒の一覧に出ないようにする
* /teachers, /students ページ作成
* 自分の講義には学生として参加できないようにする
* 学生・教官を有効にしていなければ一覧にでないようにしたい
