package com.ecomerce.helper;

public class Helper {
	
	public static String getTenWords(String desc)
	
	{
		String[] str=desc.split(" ");
		if(str.length>15)
		{
			String result="";
			for(int i=0;i<15;i++)
			{
				result=result+str[i]+" ";
			}
			return result+"...";
			
			
		}
		else
		{
			return( desc+"...");
		}
		
	}

}
