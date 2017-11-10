def shopping_list()

  @availible_items = [
    {item: "eggs", price: 1.79},
    {item: "milk", price: 2.49},
    {item: "coffee", price: 5.99}
  ]

  @shopping_list = []

  main_menu()

  while @action != 4
    case @action
      when 1
        view_availible_items()
      when 2
        view_shopping_list()
      when 3
        update_shopping_list()
      else
      puts "Error -- Please Try Again, Human!"
    end
  main_menu()
  end

  exit(0)

end

def main_menu()

  puts "===== Shopping App ====="
  puts "1) View Availible Items"
  puts "2) View Shopping List"
  puts "3) Update Shopping List"
  puts "4) Exit"
  @action = gets.chomp.to_i

end

def update_menu()
  puts "===== What Would You Like to Update? ====="
  puts "1) Add Item to Shopping List"
  puts "2) Remove Item from Shopping List"
  puts "3) Exit to Main Menu"
  @update_action = gets.chomp.to_i
end

def view_availible_items()
  puts "===== Availible Items ====="
  if @availible_items.length === 0
    puts "There are no availible items."
  else
    @availible_items.each do |hash|
      puts "Item: #{hash[:item]}"
      puts "Price: $#{hash[:price]}"
      puts "----------"
    end
  end
end

def view_shopping_list()
  puts "===== Your Current Shopping List ====="
  if @shopping_list.length === 0
    puts "Your shopping list is empty."
  else
    @shopping_list.each do |hash|
      puts "Item: #{hash[:item]}"
      puts "Price: $#{hash[:price]}"
      puts "----------"
    end
  puts "Total: $#{get_total()}"
  end
end

def update_shopping_list()
  update_menu()
  while @update_action != 3
    case @update_action
      when 1
        add_to_shopping_list()
      when 2
        remove_from_shopping_list()
      else
        puts "Error -- Please Try Again, Human"
    end
  update_menu()
  end
end

def add_to_shopping_list()
  view_availible_items()
  if @availible_items.length != 0
    puts "What item would you like to add to shopping list?"
    item = gets.chomp.downcase
    hash = @availible_items.select { |hash| item === hash[:item] }
    if hash[0] != nil
      @shopping_list << hash[0]
      @availible_items.delete(hash[0])
      puts "You have added #{item} to shopping list."
      get_current_total()
    else
      puts "No item"
    end
  else
    return
  end
end

def remove_from_shopping_list()
  view_shopping_list()
  if @shopping_list.length != 0
    puts "What item would you like to remove?"
    item = gets.chomp.downcase
    hash = @shopping_list.select { |hash| item === hash[:item] }
    if hash[0] != nil
      @availible_items << hash[0]
      @shopping_list.delete(hash[0])
      puts "You have removed #{item} from the shopping list."
      get_current_total()
    else
      puts "No item"
    end
  else
    return
  end
end

def get_total()
  total = @shopping_list.map { |val| val[:price] }
  total.reduce(&:+).round(2)
end

def get_current_total
  puts "Would you like to view current total?\n[1] Yes\n[2] No"
  action = gets.chomp.to_i
  if action === 1
    view_shopping_list()
  else
    return
  end
end

shopping_list()
