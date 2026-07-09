class ExportsController < ApplicationController

  def zaisan
    user = current_user
    client = Client.find(params[:id])
    deposits = client.deposits
    securities = client.securities
    insurances = client.insurances
    real_estates = client.real_estates
    claims = client.claims
    other_properties = client.other_properties
    debts = client.debts

    template_path = Rails.root.join("app", "templates", "zaisan.xlsx")
    workbook = RubyXL::Parser.parse(template_path)

    sheet1 = workbook[0]
    sheet2 = workbook[1]

    write_basic_info(sheet1, client, user)
    write_deposits(sheet1, deposits)
    write_securities(sheet1, securities)
    write_insurances(sheet2, insurances)
    write_real_estates(sheet2, real_estates)
    write_claims(sheet2, claims)
    write_other_properties(sheet2, other_properties)
    write_debts(sheet2, debts)

    send_data workbook.stream.string,
              filename: "zaisan.xlsx",
              type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  end

  private

  def set_cell(sheet, row, col, value)
    cell = sheet[row][col]
    if cell
      cell.raw_value = value
    else
      sheet.add_cell(row, col, value)
    end
  end

  def write_basic_info(sheet, client, user)
    set_cell(sheet, 1, 9, client.case_number)
    set_cell(sheet, 1, 22, client.name)
    set_cell(sheet, 3, 14, to_wareki(Date.today))
    set_cell(sheet, 5, 8, to_wareki(Date.today))
    set_cell(sheet, 5, 21, user.name)
  end

  def write_deposits(sheet, deposits)
    bank_rows = [24, 26, 28, 30, 32]
    bank_index = 0

    deposits.each do |deposit|
      case deposit.deposit_type
      when "金融機関"
        row = bank_rows[bank_index]
        write_bank(sheet, row, deposit)
        bank_index += 1
      when "現金"
        write_cash(sheet, deposit)
      when "施設等預入金"
        write_facility(sheet, deposit)
      when "支援信託"
        write_trust(sheet, deposit)
      when "支援預貯金"
        write_support(sheet, deposit)
      end
    end
  end

  def write_bank(sheet, row, deposit)
    set_cell(sheet, row, 2, deposit.bank_name)
    set_cell(sheet, row, 8, deposit.branch_name)
    set_cell(sheet, row, 12, deposit.account_type)
    set_cell(sheet, row, 16, deposit.account_number)
    set_cell(sheet, row, 20, deposit.last_checked_on)
    set_cell(sheet, row, 23, deposit.balance)
    set_cell(sheet, row, 27, deposit.manager)
    set_cell(sheet, row, 31, deposit.has_document ? "■" : "□")
  end

  def write_cash(sheet, deposit)
    set_cell(sheet, 34, 23, deposit.balance)
    set_cell(sheet, 34, 27, deposit.manager)
    set_cell(sheet, 34, 31, deposit.has_document ? "■" : "□")
  end

  def write_facility(sheet, deposit)
    set_cell(sheet, 35, 9, deposit.facility_name)
    set_cell(sheet, 35, 23, deposit.balance)
    set_cell(sheet, 35, 27, deposit.manager)
    set_cell(sheet, 35, 31, deposit.has_document ? "■" : "□")
  end

  def write_trust(sheet, deposit)
    set_cell(sheet, 37, 2, deposit.bank_name)
    set_cell(sheet, 37, 8, deposit.branch_name)
    set_cell(sheet, 37, 16, deposit.account_number)
    set_cell(sheet, 37, 20, deposit.last_checked_on)
    set_cell(sheet, 37, 23, deposit.balance)
    set_cell(sheet, 37, 27, deposit.manager)
    set_cell(sheet, 37, 31, deposit.has_document ? "■" : "□")
  end

  def write_support(sheet, deposit)
    set_cell(sheet, 38, 2, deposit.bank_name)
    set_cell(sheet, 38, 8, deposit.branch_name)
    set_cell(sheet, 38, 16, deposit.account_number)
    set_cell(sheet, 38, 20, deposit.last_checked_on)
    set_cell(sheet, 38, 23, deposit.balance)
    set_cell(sheet, 38, 27, deposit.manager)
    set_cell(sheet, 38, 31, deposit.has_document ? "■" : "□")
  end

  def write_securities(sheet, securities)
    security_rows = [46, 47, 48, 49, 50]
    index = 0

    securities.each do |security|
      row = security_rows[index]
      write_security_row(sheet, row, security)
      index += 1
    end
  end

  def write_security_row(sheet, row, security)
    set_cell(sheet, row, 2, security.security_kind)
    set_cell(sheet, row, 7, security.security_name)
    set_cell(sheet, row, 18, "#{security.quantity} #{security.unit}")
    set_cell(sheet, row, 21, security.face_value)
    set_cell(sheet, row, 23, security.amount)
    set_cell(sheet, row, 27, security.manager)
    set_cell(sheet, row, 31, security.has_document ? "■" : "□")
  end

  def write_insurances(sheet, insurances)
    insurance_rows = [6, 7, 8, 9, 10]
    index = 0

    insurances.each do |insurance|
      row = insurance_rows[index]
      write_insurance_row(sheet, row, insurance)
      index += 1
    end
  end

  def write_insurance_row(sheet, row, insurance)
    set_cell(sheet, row, 1, insurance.insurance_company)
    set_cell(sheet, row, 4, insurance.insurance_kind)
    set_cell(sheet, row, 7, insurance.policy_number)
    set_cell(sheet, row, 9, insurance.amount)
    set_cell(sheet, row, 12, insurance.contractor)
    set_cell(sheet, row, 19, insurance.beneficiary)
    set_cell(sheet, row, 21, insurance.has_document ? "■" : "□")
  end

  def write_real_estates(sheet, real_estates)
    land_rows = [16, 17, 18, 19, 20]
    building_rows = [26, 27, 28, 29, 30]
    land_index = 0
    building_index = 0

    real_estates.each do |re|
      if re.land_category.present?
        break if land_index >= land_rows.size
        row = land_rows[land_index]
        write_land(sheet, row, re)
        land_index += 1
      else
        break if building_index >= building_rows.size
        row = building_rows[building_index]
        write_building(sheet, row, re)
        building_index += 1
      end
    end
  end

  def write_land(sheet, row, re)
    set_cell(sheet, row, 1, re.address)
    set_cell(sheet, row, 7, re.lot_number)
    set_cell(sheet, row, 9, re.land_category)
    set_cell(sheet, row, 12, re.area)
    set_cell(sheet, row, 18, re.note)
    set_cell(sheet, row, 21, re.has_document ? "■" : "□")
  end

  def write_building(sheet, row, re)
    set_cell(sheet, row, 1, re.address)
    set_cell(sheet, row, 7, re.building_number)
    set_cell(sheet, row, 9, re.building_kind)
    set_cell(sheet, row, 12, re.floor_area)
    set_cell(sheet, row, 18, re.note)
    set_cell(sheet, row, 21, re.has_document ? "■" : "□")
  end

  def write_claims(sheet, claims)
    claim_rows = [36, 37, 38, 39, 40]
    index = 0

    claims.each do |claim|
      row = claim_rows[index]
      write_claim_row(sheet, row, claim)
      index += 1
    end
  end

  def write_claim_row(sheet, row, claim)
    set_cell(sheet, row, 1, claim.debtor_name)
    set_cell(sheet, row, 6, claim.content)
    set_cell(sheet, row, 9, claim.amount)
    set_cell(sheet, row, 14, claim.note)
    set_cell(sheet, row, 21, claim.has_document ? "■" : "□")
  end

  def write_other_properties(sheet, other_properties)
    other_property_rows = [48, 49, 50, 51, 52]
    index = 0

    other_properties.each do |other_property|
      row = other_property_rows[index]
      write_other_property_row(sheet, row, other_property)
      index += 1
    end
  end

  def write_other_property_row(sheet, row, other_property)
    set_cell(sheet, row, 1, other_property.kind)
    set_cell(sheet, row, 5, other_property.content)
    set_cell(sheet, row, 9, other_property.value)
    set_cell(sheet, row, 14, other_property.note)
    set_cell(sheet, row, 21, other_property.has_document ? "■" : "□")
  end

  def write_debts(sheet, debts)
    debt_rows = [58, 59, 60, 61, 62]
    index = 0

    debts.each do |debt|
      row = debt_rows[index]
      write_debt_row(sheet, row, debt)
      index += 1
    end
  end

  def write_debt_row(sheet, row, debt)
    set_cell(sheet, row, 1, debt.creditor_name)
    set_cell(sheet, row, 6, debt.content)
    set_cell(sheet, row, 10, debt.amount)
    set_cell(sheet, row, 16, debt.monthly_payment)
    set_cell(sheet, row, 21, debt.has_document ? "■" : "□")
  end

  def to_wareki(date)
    case date
    when Date.new(2019, 5, 1)..Date::Infinity.new
      year = date.year - 2018
      "令和#{year}年#{date.month}月#{date.day}日"
    when Date.new(1989, 1, 8)..Date.new(2019, 4, 30)
      year = date.year - 1988
      "平成#{year}年#{date.month}月#{date.day}日"
    when Date.new(1926, 12, 25)..Date.new(1989, 1, 7)
      year = date.year - 1925
      "昭和#{year}年#{date.month}月#{date.day}日"
    else
      date.strftime("%Y年%-m月%-d日")
    end
  end
end
