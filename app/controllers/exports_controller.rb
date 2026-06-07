class ExportsController < ApplicationController

  def zaisan
    user = current_user
    client = Client.find(params[:id])
    deposits =client.deposits

    template_path = Rails.root.join("app", "templates", "zaisan.xlsx" )
    workbook = RubyXL::Parser.parse(template_path)
    sheet = workbook[0]

    write_basic_info(sheet, client, user)
    write_deposits(sheet, deposits)

    send_data workbook.stream.string, filename: "zaisan.xlsx", type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

  end 

  private

  def write_basic_info(sheet, client, user)
    sheet.add_cell(1, 9, client.case_number)
    sheet.add_cell(1, 22, client.name)
    sheet.add_cell(3, 14, to_wareki(Date.today))
    sheet.add_cell(5, 8, to_wareki(Date.today))
    sheet.add_cell(5, 21, user.name)
  end

  def write_deposits(sheet, deposits)
    bank_rows = [24,26,28,30,32]
    bank_index = 0

    deposits.each_with_index do |deposit|
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
    sheet.add_cell(row, 2, deposit.bank_name)
    sheet.add_cell(row, 8, deposit.branch_name)
    sheet.add_cell(row, 12, deposit.account_type)
    sheet.add_cell(row, 16, deposit.account_number)
    sheet.add_cell(row, 20, deposit.last_checked_on)
    sheet.add_cell(row, 23, deposit.balance)
    sheet.add_cell(row, 27, deposit.manager)
  end

  def write_cash(sheet, deposit)
    sheet.add_cell(34, 23, deposit.balance)
    sheet.add_cell(34, 27, deposit.manager)
  end

  def write_facility(sheet, deposit)
    sheet.add_cell(35, 9, deposit.facility_name)
    sheet.add_cell(35, 23, deposit.balance)
    sheet.add_cell(35, 27, deposit.manager)
  end

  def write_trust(sheet, deposit)
    sheet.add_cell(37, 2, deposit.bank_name)
    sheet.add_cell(37, 8, deposit.branch_name)
    sheet.add_cell(37, 16, deposit.account_number)
    sheet.add_cell(37, 20, deposit.last_checked_on)
    sheet.add_cell(37, 23, deposit.balance)
    sheet.add_cell(37, 27, deposit.manager)
  end

  def write_support(sheet, deoposit)
    sheet.add_cell(38, 2, deposit.bank_name)
    sheet.add_cell(38, 8, deposit.branch_name)
    sheet.add_cell(38, 16, deposit.account_number)
    sheet.add_cell(38, 20, deposit.last_checked_on)
    sheet.add_cell(38, 23, deposit.balance)
    sheet.add_cell(38, 27, deposit.manager)
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
