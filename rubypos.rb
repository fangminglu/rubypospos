$newInput = []
$save_money=0
$total
$maxtotal=0
$inputs = [
    'ITEM000001',
    'ITEM000001',
    'ITEM000001',
    'ITEM000001',
    'ITEM000001',
    'ITEM000003-2',
    'ITEM000005',
    'ITEM000005',
    'ITEM000005'
]
#$inputs.push(count:1)
puts "******没钱赚商店******"
$items = [
    {
        barcode: 'ITEM000000',
        name: '可口可乐',
        unit: '瓶',
        price: 3.00
    },
    {
        barcode: 'ITEM000001',
        name: '雪碧',
        unit: '瓶',
        price: 3.00
    },
    {
        barcode: 'ITEM000002',
        name: '苹果',
        unit: '斤',
        price: 5.50
    },
    {
        barcode: 'ITEM000003',
        name: '荔枝',
        unit: '斤',
        price: 15.00
    },
    {
        barcode: 'ITEM000004',
        name: '电池',
        unit: '个',
        price: 2.00
    },
    {
        barcode: 'ITEM000005',
        name: '方便面',
        unit: '袋',
        price: 4.50
    }
]
$newItem = [
    'ITEM000000',
    'ITEM000001',
    'ITEM000005'
]

for item in $items
  for int in $inputs

    #puts item
    if item[:barcode] ==int && int.length==10
      $newInput.push(item)
      item.merge!(count:0)
    elsif int.length > 10 &&int[0...10] ==item[:barcode]
      $newInput.push(item)
      item.merge!(count:int[11].to_i)
    end
  end
end
#puts $newInput
$newInput.uniq!
#puts $newInput
for news in $newInput
  for input in $inputs
    if input.length ==10&&input ==news[:barcode]
       news[:count] = news[:count]+1
    end
  end
end
#puts $newInput
for newput in $newInput

  if newput[:count].to_i >2
    $total =newput[:count] * newput[:price] - newput[:count]/3*newput[:price]
  end
  if newput[:count].to_i <=2
    $total =newput[:count] * newput[:price]
  end
  $maxtotal +=$total
  puts '名称:'+newput[:name].to_s+' 数量:'+newput[:count].to_s+newput[:unit].to_s+' 单价:'+newput[:price].to_s+' 小计:'+$total.to_s
  end
puts '----------------------'
puts '挥泪赠送商品:'
  for newn in $newInput
    for itemss in  $newItem
      if newn[:count].to_i >2 && newn[:barcode]==itemss
    numbers =newn[:count]/3
    puts '名称:'+newn[:name].to_s+' 数量:'+numbers.to_s+newn[:unit].to_s
        $save_money +=numbers*newn[:price]
      end
    end
end
puts'---------------------'
puts '总计:'+$maxtotal.to_s+'元'
puts '节省:'+$save_money.to_s+'元'
