crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :Personal do
  link "本人情報", new_user_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", users_path
  parent :mypage
end

