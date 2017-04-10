function OptionsClear( obj,all )
{
	while (obj.options.length > 1)
	{
		obj.remove(1);
	}
	if (all==1)
	{
		obj.remove(0);
	}
}

function OptionsAdd( obj, sText, sValue )
{
	var myOption;
	myOption = parent.document.createElement("OPTION");
	myOption.text=sText;
	myOption.value=sValue;
	obj.add( myOption );
}

function OptionsAddPY( obj,sValue)
{
	var myOption;
	myOption = parent.document.createElement("OPTION");
	myOption.value=sValue;
	myOption.text=sValue;
	obj.add( myOption);
}