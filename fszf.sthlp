{smcl}
{right:Updated time: May 18, 2021}
{* -----------------------------title------------------------------------ *}{...}
{p 0 16 2}
{bf:[W-11] fszf} {hline 2} Used to output the details of the rental cost in Foshan. You can view source code in {browse "https://github.com/Meiting-Wang/fszf":github}.


{* -----------------------------Syntax------------------------------------ *}{...}
{title:Syntax}

{p 8 8 2}
{cmd:fszf} {it:{help numlist}}


{* -----------------------------Contents------------------------------------ *}{...}
{title:Contents}

{p 4 4 2}
{help fszf##Description:Description}{break}
{help fszf##Examples:Examples}{break}
{help fszf##Author:Author}


{* -----------------------------Description------------------------------------ *}{...}
{marker Description}{title:Description}

{p 4 4 2}{bf:fszf} means "Foshan Zhu Fang". You need to input 6 sets of numbers like {it:1027 28 25080 1030 29 25214}, from left to right: {p_end}
{p 8 8 2}. {it:last period water meter reading 1}{p_end}
{p 8 8 2}. {it:last period water meter reading 2}{p_end}
{p 8 8 2}. {it:last period electric meter reading}{p_end}
{p 8 8 2}. {it:current period water meter reading 1}{p_end}
{p 8 8 2}. {it:current period water meter reading 2}{p_end}
{p 8 8 2}. {it:current period electric meter reading}{p_end}
{p 4 4 2}Then the program will output the details of the rent for the current period that can be submitted to the landlord. It is worth noting that this command can only be used in version 16.0 or later.{p_end}


{* -----------------------------Examples------------------------------------ *}{...}
{marker Examples}{title:Examples}

{p 4 4 2}Enter the meter raw readings, and then output the rental cost details{p_end}
{p 8 8 2}. {stata fszf 1027 28 25080 1030 29 25214}{p_end}


{* -----------------------------Author------------------------------------ *}{...}
{marker Author}{title:Author}

{p 4 4 2}
Meiting Wang{break}
Institute for Economic and Social Research, Jinan University{break}
Guangzhou, China{break}
wangmeiting92@gmail.com

