

/////*Analysis bivariate- high*///
Fit Group(
	Bivariate(
		Y( :total_return ),
		X( :Past_Overall_PCT ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Hig" )
	),
	Bivariate(
		Y( :total_return ),
		X( :Article_Search_Overall ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Hig" )
	),
	Bivariate(
		Y( :total_return ),
		X( :Afternoon ),
		Fit Mean( {Line of Fit( 0 ), Line Color( {213, 72, 87} )} ),
		Fit Line( {Line Color( {57, 177, 67} )} ),
		Where( :section_lmh == "Hig" )
	),
	<<{Arrange in Rows( 3 )},
	Where( :section_lmh == "Hig" )
)



/////*Analysis bivariate- Med*///

Fit Group(
	Bivariate(
		Y( :total_return ),
		X( :Past_Overall_PCT ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Med" )
	),
	Bivariate(
		Y( :total_return ),
		X( :Article_Search_Overall ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Med" )
	),
	Bivariate(
		Y( :total_return ),
		X( :Afternoon ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Med" )
	),
	<<{Arrange in Rows( 3 )},
	Where( :section_lmh == "Med" ),
	SendToReport(
		Dispatch( {}, "Fit Group section_lmh=Med", OutlineBox, {Close( 1 )} )
	)
)
/////*Analysis bivariate- Low*///

Fit Group(
	Bivariate(
		Y( :total_return ),
		X( :Past_Overall_PCT ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Low" )
	),
	Bivariate(
		Y( :total_return ),
		X( :Article_Search_Overall ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Low" )
	),
	Bivariate(
		Y( :total_return ),
		X( :Afternoon ),
		Fit Line( {Line Color( {213, 72, 87} )} ),
		Where( :section_lmh == "Low" )
	),
	<<{Arrange in Rows( 3 )},
	Where( :section_lmh == "Low" ),
	SendToReport(
		Dispatch( {}, "Fit Group section_lmh=Low", OutlineBox, {Close( 1 )} )
	)
)

///*Visualization graphs and reports in SAS or JMP*///
///purpose is to show the variance of the prices is higher at the bgining. Also, the sensetivity of scores*//

Bubble Plot(
	X( :ScorTot ),
	Y( :daily_return ),
	Time( :days_out ),
	Coloring( :Away_Team ),
	ID( :event_id ),
	Speed( 72.96 ),
	Time Index( 42.4048000000002 ),
	Title Position( 2.38, 91.6955017301038 ),
	SendToReport(
		Dispatch(
			{},
			"1",
			ScaleBox,
			{Min( 0 ), Max( 14 ), Inc( 2 ), Minor Ticks( 0 )}
		),
		Dispatch(
			{},
			"2",
			ScaleBox,
			{Min( -50 ), Max( 100 ), Inc( 500 ), Minor Ticks( 1 )}
		),
		Dispatch( {}, "Bubble Plot", FrameBox, {Frame Size( 1319, 578 )} )
	)
)