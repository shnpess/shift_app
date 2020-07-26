@staffs = []
@staffs = [{:name=>"店長", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"副店長", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"門畑", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"森山", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"小松", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"小谷", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"藤田", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"松下", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0},
            {:name=>"ぷん", :max_work=>3, :return_max_work=>3,  :workday_num=>21, :return_workday=>21, :holiday=>[],:leader=>0}]
@shift = []
@staff = {}
@staff[:holiday] = []
@staff[:leader] = 0
@reset_shift = []
def name_registor
    puts "何名登録しますか??"
    staff_count = gets.to_i

    count = 1
    staff_count.times do
        @staff = {}
        puts "#{count}人目の名前を入力してください"
        @staff[:name] = gets.chomp
        puts "#{@staff[:name]}さんの連勤数の最大値を入力してください"
        @staff[:max_work] = gets.to_i
        @staff[:return_max_work] = @staff[:max_work]
        puts "#{@staff[:name]}さんの出勤数を入力してください"
        @staff[:workday_num] = gets.to_i
        @staff[:return_workday] = @staff[:workday_num]
        @staff[:holiday] = []
        @staff[:leader] = 0
        @staffs << @staff


    count += 1
    end

    puts "------スタッフ一覧------"
    @staffs.each do |s|
        puts "#{s[:name]}"
    end
    puts "------スタッフ一覧------"
end

# -----------------------------------------------------------------


def setting
    puts "最低出社人数を登録してください"
    @min_human = gets.to_i
    puts "店休日を設定してください"
    @store_rest = gets.to_i
    puts "全員出勤日を設定してください"
    @all_member = gets.to_i
end

# -----------------------------------------------------------------

def leader
    l_count = 1
    puts "責任者は何人いますか?"
    @leader_num = gets.to_i
    puts "責任者は必ず何人以上出社する必要がありますか"
    @leader_count = gets.to_i
    @leader_num.times do
        puts "#{l_count}人目の責任者を選んでください"
        count = 1
        @staffs.each do |s|
            puts "#{count}:#{s[:name]}"
            count += 1
        end
        leader_choose = gets.to_i
        @staffs[leader_choose - 1][:leader] = 1
        l_count += 1
        p @staffs
    end
end




# ---------------------------------------------------------------

def holiday
    puts "どなたの希望休を登録しますか??該当の番号を入力して下さい"
    count = 1
    @staffs.each do |s|
        puts "#{count}:#{s[:name]}"
        count += 1
    end
    staff_num = gets.to_i
    puts "#{@staffs[staff_num - 1][:name]}さんの希望休を登録します"
    puts "希望休は何日ありますか"
    holiday_count = gets.to_i

    count = 1

    holiday_count.times do
        puts "#{count}日目の希望休を入力してください"
        holiday_num = gets.to_i
        @staffs[staff_num - 1][:holiday] << holiday_num
        count += 1
    end

    puts "#{@staffs[staff_num - 1][:name]}さんのが希望休はこちらです"
    @staffs[staff_num - 1][:holiday].each do |s|
        puts "#{s}日"
    end


end

# -------------------------------------------------------

def shift_registor
    count = 1
    30.times do
        www = []
        @staffs.each do |s|
            if  count == @store_rest
                break
            end

            if s[:max_work] > 0 && s[:workday_num] > 0
                unless s[:holiday].include?(count)
                www << s
                end
            end
            # if s[:max_work] == 0
            #     s[:max_work] = s[:return_max_work]
            # end
        end

        if @all_member == count
            shift_staff = @staffs
            p shift_staff
        else
            shift_staff = www.sample(6)
        end

        rest_staff = @staffs - shift_staff

        rest_staff.each do |r|
            r[:max_work] = r[:return_max_work]
        end

        shift_staff.each do |s|
            s[:max_work] -= 1
            s[:workday_num] -= 1
        end
        @shift << shift_staff
        count += 1
    end


    count = 1
    @shift.each do |s|
        s = s.map { |ss| ss[:name]}
        puts  "#{count}日:#{s}"
        count += 1
    end

    @staffs.each do |s|
        puts "#{s[:name]}さんの残りの出勤数は#{s[:workday_num]}日です"
    end
end


# ------------------------------------------------------------

def reset
    @shift = []
    @staffs.each do |s|
        s[:max_work] = s[:return_max_work]
        s[:workday_num] = s[:return_workday]
    end
end

# ----------------------------------------------------------------

while true do


    puts "何を行いますか？？該当の番号を入力して下さい"
    puts "1：スタッフの登録"
    puts "2：設定"
    puts "3：責任者の設定"
    puts "4：希望休の登録"
    puts "5：シフトの登録"
    puts "6：シフトのリセット"
    puts "7：終了"

    input_num = gets.to_i

    if input_num == 1
        name_registor
    elsif input_num == 2
        setting
    elsif input_num == 3
        leader
    elsif input_num == 4
        holiday
    elsif input_num == 5
        shift_registor
    elsif input_num == 6
         reset
    elsif input_num == 7
        break
    end
end








