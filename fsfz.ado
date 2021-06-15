* Used to output the details of the rental cost in Foshan
* Author: Meiting Wang, doctor, Institute for Economic and Social Research, Jinan University
* Email: wangmeiting92@gmail.com
* Created on May 18, 2021




program define fsfz
version 16
syntax anything(id="Water and electricity meter readings")


*程序不合规时的报错
if ~ustrregexm("`anything'","^(\b[1-9]\d*\b\s+){5}(\b[1-9]\d*\b\s*)$") {
	dis "{error:If and only if six numbers required}"
	exit
}



*预处理
tokenize `anything'

local water_meter_1_pre = `1'           //上期厕所水表读数
local water_meter_2_pre = `2'           //上期洗衣机水表读数
local electric_meter_pre = `3'          //上期电表读数

local water_meter_1 = `4'               //本期厕所水表读数
local water_meter_2 = `5'               //本期洗衣机水表读数
local electric_meter = `6'              //本期电表读数

local water_meter_pre = `water_meter_1_pre' + `water_meter_2_pre' //上期水表总读数
local water_meter = `water_meter_1' + `water_meter_2' //本期水表总读数

local total_cost = 700 + 30 + (`water_meter'-`water_meter_pre')*3.5 + (`electric_meter'-`electric_meter_pre')*1.3

local year1 = year(date("`c(current_date)'","DMY"))
local month1 = month(date("`c(current_date)'","DMY"))
if `month1' == 12 {
	local year2 = `year1' + 1
	local month2 = 1
}
else {
	local year2 = `year1'
	local month2 = `month1' + 1
}



*将结果输出至Stata界面上
dis in y _n(5) ///
	_col(5) "上期厕所水表读数：`water_meter_1_pre'立方米" _n ///
	_col(5) "上期洗衣机水表读数：`water_meter_2_pre'立方米" _n ///
	_col(5) "上期水表总读数：`water_meter_pre'立方米" _n ///
	_col(5) "上期电表读数：`electric_meter_pre'度" _n(2) ///
	///
	_col(5) "本期厕所水表读数：`water_meter_1'立方米" _n ///
	_col(5) "本期洗衣机水表读数：`water_meter_2'立方米" _n ///
	_col(5) "本期水表总读数：`water_meter'立方米" _n ///
	_col(5) "本期电表读数：`electric_meter'度" _n(2) ///
	///
	_col(5) "本期总费用(`year1'年`month1'月15日-`year2'年`month2'月15日房租)：" _n ///
	_col(5) "= 700 + 30 + (`water_meter'-`water_meter_pre')×3.5 + (`electric_meter'-`electric_meter_pre')×1.3" _n ///
	_col(5) "= 700 + 30 + `=`water_meter'-`water_meter_pre''×3.5 + `=`electric_meter'-`electric_meter_pre''×1.3" _n ///
	_col(5) "= 700 + 30 + `=(`water_meter'-`water_meter_pre')*3.5' + `=(`electric_meter'-`electric_meter_pre')*1.3'" _n ///
	_col(5) "= `total_cost'元" _n(3)


end
