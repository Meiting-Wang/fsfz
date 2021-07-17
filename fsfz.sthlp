{smcl}
{right:Updated time: July 15, 2021}
{* -----------------------------title------------------------------------ *}{...}
{p 0 16 2}
{bf:[W-11] fsfz} {hline 2} Output the details of the rent in Foshan. You can view source code in {browse "https://github.com/Meiting-Wang/fsfz":github}.


{* -----------------------------Syntax------------------------------------ *}{...}
{title:Syntax}

{p 8 8 2}
{cmd:fsfz}


{* -----------------------------Contents------------------------------------ *}{...}
{title:Contents}

{p 4 4 2}
{help fsfz##Description:Description}{break}
{help fsfz##Examples:Examples}{break}
{help fsfz##Author:Author}


{* -----------------------------Description------------------------------------ *}{...}
{marker Description}{title:Description}

{p 4 4 2}{bf:fsfz} means "Foshan Fang Zu". It will show the details of the rent for the current period that should be submitted to the landlord. It is worth noting that this command can only be used in version 16.0 or later.{p_end}

{p 4 4 2}There is no need to enter any parameters when using this command, but you should update the "{stata `"!start "explorer" "X:\家庭账单\房租细节\water and electricity meter readings.xlsx""':water and electricity meter readings.xlsx}" file first before using this command.{p_end}


{* -----------------------------Examples------------------------------------ *}{...}
{marker Examples}{title:Examples}

{p 4 4 2}After updating the .xlsx file mentioned above, run the following command to get the rent details of the current period.{p_end}
{p 8 8 2}. {stata fsfz}{p_end}


{* -----------------------------Author------------------------------------ *}{...}
{marker Author}{title:Author}

{p 4 4 2}
Meiting Wang{break}
Institute for Economic and Social Research, Jinan University{break}
Guangzhou, China{break}
wangmeiting92@gmail.com

