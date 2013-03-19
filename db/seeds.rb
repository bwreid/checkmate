Bank.delete_all
Transaction.delete_all


b1 = Bank.create(name:"BofA")


10.times do |i|
  t = Transaction.create(amount:i+100, tdate:"2013-03-#{i}", is_deposit:true)
  d = Transaction.create(amount:i+200, tdate:"2013-03-#{i}", is_deposit:false)
  b1.transactions << t << d
end


