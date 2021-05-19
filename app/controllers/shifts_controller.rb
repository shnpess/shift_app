class ShiftsController < ApplicationController
    @@staffs = []
    @@staff = {}
    def new
        # puts "#{@staff[:name]}さんの連勤数の最大値を入力してください"
        # @staff[:max_work] = gets.to_i
        # @staff[:return_max_work] = @staff[:max_work]
        # puts "#{@staff[:name]}さんの出勤数を入力してください"
        # @staff[:workday_num] = gets.to_i
        # @staff[:return_workday] = @staff[:workday_num]
        # @staff[:holiday] = []
        # @staff[:leader] = 0
        # puts @@staff[:name]
    end

    def create
        @name = params[:name]
        @max_work = params[:max_work]
        @@staff[:name] = @name
        @@staffs << @@staff
        puts @@staffs

    end

end
