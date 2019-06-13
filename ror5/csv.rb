#!/usr/bin/ruby -w
require 'mysql2'
require 'rubygems'
require 'csv'

client = Mysql2::Client.new(
    :host     => '127.0.0.1', # 主机
    :username => 'test',      # 用户名
    :password => '1234',    # 密码
    :port     => '3306',    #端口
    :database => 'test',      # 数据库
    :encoding => 'utf8'       # 编码
    )

rows = client.query("select * from unit")

CSV.open("file.csv","wb") do |csv|
	rows.each do |row|
      csv << row.values
    end
end
=begin
CSV.open("ss.csv", "wb") do rows.write(rows.inject([]) {
	|csv, row|  csv << CSV.generate_line(row) }.join(""))
end