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
