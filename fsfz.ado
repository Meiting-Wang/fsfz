* Used to output the details of the rental cost in Foshan
* Author: Meiting Wang, doctor, Institute for Economic and Social Research, Jinan University
* Email: wangmeiting92@gmail.com
* Updated on July 15, 2021




program define fsfz
version 16
syntax [anything]


*程序不合规时的报错
if "`anything'" != "" {
	dis "{error:Nothing needed}"
	exit
} //不允许输入任何参数



*---------------------------创建并进入newframe(为不影响当前内存的数据)--------------------------
tempname newframe
frame create `newframe'
frame change `newframe'


*数据的导入
qui import excel "X:\家庭账单\房租细节\water and electricity meter readings.xlsx", clear sheet("Sheet1") first case(lower) cellrange(A1:D3)
qui replace date = mofd(date-21916)
format date %tmCY/N
sort date


*数据处理
local last_water1 = water1[1] //上一期水表1读数
local last_water2 = water2[1] //上一期水表2读数
local last_electric = electric[1] //上一期电表读数

local now_water1 = water1[2] //本期水表1读数
local now_water2 = water2[2] //本期水表2读数
local now_electric = electric[2] //本期电表读数

local diff_water1 = `now_water1' - `last_water1' //水表1差额
local diff_water2 = `now_water2' - `last_water2' //水表2差额
local diff_electric = `now_electric' - `last_electric' //电表差额

local total_cost = 700 + 30 + (`diff_water1'+`diff_water2')*3.5 + `diff_electric'*1.3

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
#delimit ;
dis _n in w //读数表格输出
	"{text:{bf:水电表读数}}" _n 

	"{hline 21}{c TT}"                 "{hline 8}{c TT}"               "{hline 8}{c TT}"                "{hline 10}" _n

	_col(2) "{result:{bf:读数项目}}"     _col(22) "{c |}{center 8:{result:{bf:上期}}}" _col(31) "{c |}{center 8:{result:{bf:本期}}}" _col(40) "{c |}{result:{bf:本期-上期}}"   _n

	"{hline 21}{c +}"                 "{hline 8}{c +}"               "{hline 8}{c +}"                   "{hline 10}" _n

	_col(2) "{result:厕所水表(立方米)}"   _col(22) "{c |}{center 8:{input:`last_water1'}}"       _col(31) "{c |}{center 8:{input:`now_water1'}}"      _col(40) "{c |}{center 9:{input:`diff_water1'}}"   _n

	"{hline 21}{c +}"                 "{hline 8}{c +}"               "{hline 8}{c +}"                   "{hline 10}" _n

	_col(2) "{result:洗衣机水表(立方米)}" _col(22) "{c |}{center 8:{input:`last_water2'}}"       _col(31) "{c |}{center 8:{input:`now_water2'}}"      _col(40) "{c |}{center 9:{input:`diff_water2'}}" _n

	"{hline 21}{c +}"                 "{hline 8}{c +}"               "{hline 8}{c +}"                   "{hline 10}" _n

	_col(2) "{result:电表(度)}"          _col(22) "{c |}{center 8:{input:`last_electric'}}"       _col(31) "{c |}{center 8:{input:`now_electric'}}"      _col(40) "{c |}{center 9:{input:`diff_electric'}}" _n

	"{hline 21}{c BT}"                 "{hline 8}{c BT}"               "{hline 8}{c BT}"                "{hline 10}" _n
;

dis //本期总费用输出
	"{text:{bf:本期总费用(`year1'年`month1'月15日-`year2'年`month2'月15日房租)}}：" _n
	"= 700 + 30 + (`diff_water1'+`diff_water2')×3.5 + `diff_electric'×1.3" _n
	"= 700 + 30 + `=(`diff_water1'+`diff_water2')*3.5' + `=`diff_electric'*1.3'" _n
	"= `total_cost'元" 
;
#delimit cr



*--------------------------------回归到原frame并删除前面临时创建的frame-----------------------------
frame change default
frame drop `newframe'

end
