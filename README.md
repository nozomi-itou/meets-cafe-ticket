========== ========== ==========

# Meets Cafe Ticket

========== ========== ==========

【 アプリケーション名 】 Meets Cafe Ticket



【 テスト用アカウント 】
- Basic認証  ユーザー名：admin  パスワード：2222
- user  アドレス：text@example.com  パスワード：1111a
- owner  アドレス：pink@example.com  パスワード：1111a
- 購入用カード情報
番号：4242424242424242
期限：Fri Dec 24 2021 00:00:00 GMT+0900 (日本標準時)
セキュリティコード：123

---------- ----------
## ◇ 概要 ◇
	
  このアプリケーションでは、月額500円でカフェ巡りを楽しむことができます。

## ◇ 利用方法 ◇
	
  ユーザーは、ログインをしてカフェチケットを購入します。
  購入後に画面に表示されるチケットを店頭で提示することで、ワンドリンク無料のサービスを受けることができます。
  またオーナーとしてログインすることで、加盟店としてSHOPを掲載することができます。
  
## ◇ 目指した課題解決 ◇

  現在のコロナ禍で厳しい状況にある飲食店業界を応援したいと考えました。
  ユーザーはお得にカフェを楽しむことができ、お店側は集客の増加が見込めます。


## ◇ 要件定義 ◇


### [ログイン機能]

ユーザー側と加盟店側でログインが分かれます。ユーザーは購入することができ、加盟店はSHOPを登録することができます。

### [購入機能]

PAY.JPを利用した購入機能の実装。購入ボタンをクリックするとDB及びPAY.JPサイトに購入情報が更新されます。


### [加盟店登録機能]

必要な情報を入力すると、加盟店として一覧表示させることができます。
登録者は加盟店情報を編集・削除することができます。

### [加盟店検索機能]

キーワードを入力すると、加盟店を検索することができます。

### [コメント機能]

ユーザーはログインすると、加盟店に対してコメントすることができます。
全ての人がコメントを閲覧できます。

----------
