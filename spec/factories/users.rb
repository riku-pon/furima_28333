FactoryBot.define do
  factory :user do
    nickname { 'ぽん' }
    family_name { '野村' }
    first_name { 'ぽん' }
    phonetic_family_name { 'ノムラ' }
    phonetic_first_name { 'ポン' }
    birthday { '2013-03-15' }
    email { 'pon@315' }
    password { 'pon315' }
    password_confirmation { 'pon315' }
  end
end
