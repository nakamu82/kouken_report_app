# ================================
# ゲストユーザー
# ================================
guest = User.find_or_create_by!(email: "guest@example.com") do |user|
  user.name = "ゲストユーザー"
  user.password = "password"
end

# ================================
# クライアント1（田中一郎）
# ================================
client1 = Client.create!(
  name: "田中一郎",
  birthdate: Date.new(1950,1,1),
  address: "大阪市北区梅田1-2-3",
  case_number: "令和5年（家）第101号",
  user_id: guest.id
)

# 債権
Claim.create!(
  client_id: client1.id,
  debtor_name: "山田太郎",
  content: "貸付金",
  amount: 150000,
  note: "返済予定なし",
  has_document: false,
  last_checked_on: Date.new(2024,12,1)
)

# 負債
Debt.create!(
  client_id: client1.id,
  creditor_name: "楽天カード",
  content: "クレジット支払い残高",
  amount: 120000,
  monthly_payment: 10000,
  has_document: true,
  last_checked_on: Date.new(2024,11,20)
)

# 預貯金
Deposit.create!(
  client_id: client1.id,
  deposit_type: "金融機関",
  bank_name: "三井住友銀行",
  branch_name: "梅田支店",
  account_type: "普通",
  account_number: "1234567",
  balance: 450000,
  manager: "本人",
  has_document: true,
  last_checked_on: Date.new(2024,12,1)
)

# 相続財産
InheritanceProperty.create!(
  client_id: client1.id,
  status: "調査中",
  last_checked_on: Date.new(2024,10,10)
)

# 保険
Insurance.create!(
  client_id: client1.id,
  insurance_company: "日本生命",
  insurance_kind: "終身保険",
  policy_number: "NL-123456",
  amount: 3000000,
  contractor: "本人",
  beneficiary: "母",
  has_document: true,
  last_checked_on: Date.new(2024,9,1)
)

# その他財産
OtherProperty.create!(
  client_id: client1.id,
  kind: "貴金属",
  content: "金の指輪",
  value: 50000,
  note: "形見",
  has_document: false,
  last_checked_on: Date.new(2024,8,1)
)

# 不動産（土地）
RealEstate.create!(
  client_id: client1.id,
  estate_type: "土地",
  address: "大阪市北区〇〇町1-2-3",
  lot_number: "123番45",
  land_category: "宅地",
  area: 120.5,
  note: "持分1/2",
  has_document: true,
  last_checked_on: Date.new(2024,7,1)
)

# 不動産（建物）
RealEstate.create!(
  client_id: client1.id,
  estate_type: "建物",
  address: "大阪市中央区△△1-5-10",
  building_number: "家屋番号1234",
  building_kind: "居宅",
  floor_area: 85.2,
  note: "単独所有",
  has_document: false,
  last_checked_on: Date.new(2024,7,1)
)

# 有価証券
Security.create!(
  client_id: client1.id,
  security_kind: "株式",
  security_name: "トヨタ自動車",
  quantity: 20,
  unit: "株",
  face_value: 0,
  amount: 480000,
  manager: "証券会社",
  has_document: true,
  security_last_checked_on: Date.new(2024,6,1)
)

# ================================
# クライアント2（佐藤花子）
# ================================
client2 = Client.create!(
  name: "佐藤花子",
  birthdate: Date.new(1952,3,15),
  address: "大阪市中央区難波4-5-6",
  case_number: "令和4年（家）第202号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client2.id,
  deposit_type: "金融機関",
  bank_name: "りそな銀行",
  branch_name: "難波支店",
  account_type: "定期",
  account_number: "9876543",
  balance: 900000,
  manager: "本人",
  has_document: true,
  last_checked_on: Date.new(2024,11,20)
)

Debt.create!(
  client_id: client2.id,
  creditor_name: "三菱UFJ銀行",
  content: "カードローン",
  amount: 300000,
  monthly_payment: 15000,
  has_document: true,
  last_checked_on: Date.new(2024,10,10)
)

Insurance.create!(
  client_id: client2.id,
  insurance_company: "第一生命",
  insurance_kind: "医療保険",
  policy_number: "DL-987654",
  amount: 1500000,
  contractor: "本人",
  beneficiary: "父",
  has_document: false,
  last_checked_on: Date.new(2024,9,1)
)

RealEstate.create!(
  client_id: client2.id,
  estate_type: "土地",
  address: "堺市堺区1-2-3",
  lot_number: "55番10",
  land_category: "田",
  area: 200.0,
  note: "農地",
  has_document: true,
  last_checked_on: Date.new(2024,7,1)
)

OtherProperty.create!(
  client_id: client2.id,
  kind: "美術品",
  content: "絵画",
  value: 200000,
  note: "祖父の遺品",
  has_document: true,
  last_checked_on: Date.new(2024,8,1)
)

Security.create!(
  client_id: client2.id,
  security_kind: "投資信託",
  security_name: "ひふみ投信",
  quantity: 10,
  unit: "口",
  face_value: 0,
  amount: 150000,
  manager: "証券会社",
  has_document: false,
  security_last_checked_on: Date.new(2024,6,1)
)

# ================================
# クライアント3（山本太郎）
# ================================
client3 = Client.create!(
  name: "山本太郎",
  birthdate: Date.new(1948,7,20),
  address: "大阪市淀川区西中島3-4-5",
  case_number: "令和6年（家）第303号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client3.id,
  deposit_type: "金融機関",
  bank_name: "三菱UFJ銀行",
  branch_name: "新大阪支店",
  account_type: "普通",
  account_number: "5566778",
  balance: 300000,
  manager: "支援者",
  has_document: false,
  last_checked_on: Date.new(2024,10,5)
)

Claim.create!(
  client_id: client3.id,
  debtor_name: "中村次郎",
  content: "貸付金",
  amount: 50000,
  note: "",
  has_document: false,
  last_checked_on: Date.new(2024,9,1)
)

Insurance.create!(
  client_id: client3.id,
  insurance_company: "アフラック",
  insurance_kind: "がん保険",
  policy_number: "AF-112233",
  amount: 2000000,
  contractor: "本人",
  beneficiary: "兄",
  has_document: true,
  last_checked_on: Date.new(2024,9,1)
)

RealEstate.create!(
  client_id: client3.id,
  estate_type: "建物",
  address: "豊中市〇〇1-2-3",
  building_number: "家屋番号5678",
  building_kind: "店舗",
  floor_area: 120.0,
  note: "賃貸中",
  has_document: true,
  last_checked_on: Date.new(2024,7,1)
)

OtherProperty.create!(
  client_id: client3.id,
  kind: "家具",
  content: "アンティークチェア",
  value: 30000,
  note: "",
  has_document: false,
  last_checked_on: Date.new(2024,8,1)
)

Security.create!(
  client_id: client3.id,
  security_kind: "債券",
  security_name: "国債",
  quantity: 5,
  unit: "本",
  face_value: 100000,
  amount: 500000,
  manager: "銀行",
  has_document: true,
  security_last_checked_on: Date.new(2024,6,1)
)
# ================================
# クライアント4（鈴木一郎）
# ================================
client4 = Client.create!(
  name: "鈴木一郎",
  birthdate: Date.new(1945, 11, 3),
  address: "大阪市阿倍野区天王寺町北2-1-1",
  case_number: "令和5年（家）第404号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client4.id,
  deposit_type: "金融機関",
  bank_name: "ゆうちょ銀行",
  branch_name: "四四八店",
  account_type: "普通",
  account_number: "14450-98765431",
  balance: 1200000,
  manager: "本人",
  has_document: true,
  last_checked_on: Date.new(2024, 11, 10)
)

Debt.create!(
  client_id: client4.id,
  creditor_name: "プロミス",
  content: "消費者金融借入",
  amount: 200000,
  monthly_payment: 10000,
  has_document: true,
  last_checked_on: Date.new(2024, 10, 15)
)

RealEstate.create!(
  client_id: client4.id,
  estate_type: "土地",
  address: "大阪市阿倍野区天王寺町北2-1-1",
  lot_number: "88番1",
  land_category: "宅地",
  area: 95.0,
  note: "自宅敷地",
  has_document: true,
  last_checked_on: Date.new(2024, 7, 1)
)

Insurance.create!(
  client_id: client4.id,
  insurance_company: "住友生命",
  insurance_kind: "生命保険",
  policy_number: "SM-554433",
  amount: 1000000,
  contractor: "本人",
  beneficiary: "妻",
  has_document: true,
  last_checked_on: Date.new(2024, 9, 15)
)

OtherProperty.create!(
  client_id: client4.id,
  kind: "車",
  content: "軽自動車（ダイハツ）",
  value: 150000,
  note: "平成25年式",
  has_document: true,
  last_checked_on: Date.new(2024, 8, 10)
)


# ================================
# クライアント5（高橋健二）
# ================================
client5 = Client.create!(
  name: "高橋健二",
  birthdate: Date.new(1960, 5, 12),
  address: "吹田市江坂町1-10-5",
  case_number: "令和6年（家）第505号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client5.id,
  deposit_type: "施設等預入金",
  facility_name: "有料老人ホームあすか",
  balance: 2500000,
  manager: "施設長",
  has_document: true,
  last_checked_on: Date.new(2024, 12, 5)
)

Claim.create!(
  client_id: client5.id,
  debtor_name: "株式会社高橋商会",
  content: "役員貸付金",
  amount: 1000000,
  note: "回収見込み薄い",
  has_document: true,
  last_checked_on: Date.new(2024, 11, 1)
)

Security.create!(
  client_id: client5.id,
  security_kind: "株式",
  security_name: "ソニーグループ",
  quantity: 50,
  unit: "株",
  face_value: 0,
  amount: 650000, # integerに変更
  manager: "ネット証券",
  has_document: false,
  last_checked_on: Date.new(2024, 6, 15) # カラム名を統一＆date型に変更
)

Insurance.create!(
  client_id: client5.id,
  insurance_company: "明治安田生命",
  insurance_kind: "生命保険",
  policy_number: "MY-778899",
  amount: 5000000,
  contractor: "本人",
  beneficiary: "長男",
  has_document: true,
  last_checked_on: Date.new(2024, 9, 10)
)


# ================================
# クライアント6（渡辺由美子）
# ================================
client6 = Client.create!(
  name: "渡辺由美子",
  birthdate: Date.new(1938, 9, 30),
  address: "枚方市岡東町5-1",
  case_number: "令和3年（家）第606号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client6.id,
  deposit_type: "現金",
  balance: 80000,
  manager: "支援者",
  has_document: false,
  last_checked_on: Date.new(2024, 12, 10)
)

Deposit.create!(
  client_id: client6.id,
  deposit_type: "金融機関",
  bank_name: "京都銀行",
  branch_name: "枚方支店",
  account_type: "普通",
  account_number: "7711223",
  balance: 620000,
  manager: "支援者",
  has_document: true,
  last_checked_on: Date.new(2024, 11, 25)
)

Debt.create!(
  client_id: client6.id,
  creditor_name: "特別養護老人ホーム陽光苑",
  content: "施設利用料未払い",
  amount: 85000,
  monthly_payment: 85000,
  has_document: true,
  last_checked_on: Date.new(2024, 12, 1)
)

InheritanceProperty.create!(
  client_id: client6.id,
  status: "協議中",
  last_checked_on: Date.new(2024, 10, 1)
)


# ================================
# クライアント7（伊藤正樹）
# ================================
client7 = Client.create!(
  name: "伊藤正樹",
  birthdate: Date.new(1955, 4, 18),
  address: "東大阪市足代2-3-1",
  case_number: "令和5年（家）第707号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client7.id,
  deposit_type: "支援預貯金",
  bank_name: "大阪信用金庫",
  branch_name: "布施支店",
  account_number: "4455667",
  balance: 1800000,
  manager: "本人",
  has_document: true,
  last_checked_on: Date.new(2024, 11, 30)
)

Debt.create!(
  client_id: client7.id,
  creditor_name: "住宅金融支援機構",
  content: "住宅ローン残高",
  amount: 2400000,
  monthly_payment: 45000,
  has_document: true,
  last_checked_on: Date.new(2024, 11, 15)
)

RealEstate.create!(
  client_id: client7.id,
  estate_type: "建物",
  address: "東大阪市足代2-3-1 402号室",
  building_number: "家屋番号9988",
  building_kind: "居宅",
  floor_area: 65.0,
  note: "区分所有",
  has_document: true,
  last_checked_on: Date.new(2024, 7, 15)
)

OtherProperty.create!(
  client_id: client7.id,
  kind: "会員権",
  content: "ゴルフ会員権",
  value: 300000,
  note: "〇〇カントリークラブ",
  has_document: true,
  last_checked_on: Date.new(2024, 8, 20)
)


# ================================
# クライアント8（小林サダ）
# ================================
client8 = Client.create!(
  name: "小林サダ",
  birthdate: Date.new(1932, 1, 5),
  address: "堺市北区中百舌鳥町3-12",
  case_number: "令和2年（家）第808号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client8.id,
  deposit_type: "支援信託",
  bank_name: "三井住友信託銀行",
  branch_name: "難波支店",
  account_number: "1122334",
  balance: 4200000,
  manager: "支援者",
  has_document: true,
  last_checked_on: Date.new(2024, 12, 1)
)

Insurance.create!(
  client_id: client8.id,
  insurance_company: "かんぽ生命",
  insurance_kind: "生命保険",
  policy_number: "KP-990011",
  amount: 2000000,
  contractor: "本人",
  beneficiary: "長女",
  has_document: true,
  last_checked_on: Date.new(2024, 9, 5)
)

OtherProperty.create!(
  client_id: client8.id,
  kind: "着物",
  content: "和服一式",
  value: 100000,
  note: "桐タンス保管",
  has_document: false,
  last_checked_on: Date.new(2024, 8, 15)
)


# ================================
# クライアント9（吉田和夫）
# ================================
client9 = Client.create!(
  name: "吉田和夫",
  birthdate: Date.new(1963, 12, 25),
  address: "八尾市光町1-8-2",
  case_number: "令和6年（家）第909号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client9.id,
  deposit_type: "金融機関",
  bank_name: "三井住友銀行",
  branch_name: "八尾支店",
  account_type: "普通",
  account_number: "8899001",
  balance: 150000,
  manager: "本人",
  has_document: true,
  last_checked_on: Date.new(2024, 11, 10)
)

Debt.create!(
  client_id: client9.id,
  creditor_name: "三井住友カード",
  content: "キャッシング",
  amount: 500000,
  monthly_payment: 20000,
  has_document: true,
  last_checked_on: Date.new(2024, 10, 20)
)

Debt.create!(
  client_id: client9.id,
  creditor_name: "アコム",
  content: "カードローン",
  amount: 400000,
  monthly_payment: 15000,
  has_document: false,
  last_checked_on: Date.new(2024, 10, 20)
)

Insurance.create!(
  client_id: client9.id,
  insurance_company: "損保ジャパン",
  insurance_kind: "損害保険",
  policy_number: "SJ-112233",
  amount: 500000,
  contractor: "本人",
  beneficiary: "本人",
  has_document: true,
  last_checked_on: Date.new(2024, 9, 1)
)


# ================================
# クライアント10（加藤美咲）
# ================================
client10 = Client.create!(
  name: "加藤美咲",
  birthdate: Date.new(1958, 8, 8),
  address: "豊中市玉井町1-4-3",
  case_number: "令和5年（家）第1010号",
  user_id: guest.id
)

Deposit.create!(
  client_id: client10.id,
  deposit_type: "金融機関",
  bank_name: "池田泉州銀行",
  branch_name: "豊中支店",
  account_type: "普通",
  account_number: "2233445",
  balance: 3100000,
  manager: "本人",
  has_document: true,
  last_checked_on: Date.new(2024, 12, 10)
)

RealEstate.create!(
  client_id: client10.id,
  estate_type: "土地",
  address: "豊中市玉井町1-4-3",
  lot_number: "205番",
  land_category: "宅地",
  area: 150.0,
  note: "単独所有",
  has_document: true,
  last_checked_on: Date.new(2024, 7, 20)
)

Security.create!(
  client_id: client10.id,
  security_kind: "株式",
  security_name: "関西電力",
  quantity: 100,
  unit: "株",
  face_value: 0,
  amount: 180000, # integerに変更
  manager: "証券会社",
  has_document: true,
  last_checked_on: Date.new(2024, 6, 10) # カラム名を統一＆date型に変更
)

Insurance.create!(
  client_id: client10.id,
  insurance_company: "東京海上日動",
  insurance_kind: "火災保険",
  policy_number: "TK-445566",
  amount: 15000000,
  contractor: "本人",
  beneficiary: "本人",
  has_document: true,
  last_checked_on: Date.new(2024, 9, 1)
)