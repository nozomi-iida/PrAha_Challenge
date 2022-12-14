## 課題１

記事と、その編集履歴を保存できるサービス（ブログサービスのようなもの）のデータベースを設計して、UML 図を作成してください

以下の機能を備えているものとします

- 記事
  1000 文字程度の本文を記入して保存できる
- 記事の履歴
  記事を更新すると履歴が保存される
  特定の記事の履歴を一覧表示できる
  履歴を選択して過去の記事状態に戻す事が可能
- 記事の閲覧
  最新状態の記事を一覧表示できる

## 課題 2

今回のようにアプリケーションに利用（履歴を一覧表示したり、履歴を復元）されるような履歴データはデータベースとして保存する必要がありますが、例えば「後から分析したいから履歴を残しておいて」など、分析のみの用途でも履歴データをデータベースに保存しておく必要はあるのでしょうか？ペアと話し合ってみてください
履歴データの表現には様々な方法があります。ご自身が課題 1 の回答で採用した設計とは異なるアプローチでも UML 図を作成してみましょう。どのようなメリット/デメリットがあるでしょうか？
ヒント：例えば課題 1 でテーブルを複数用意するパターンで設計したのでしたら、1 つのテーブルだけで履歴を表現する方法を考えてみても面白いかもしれません
