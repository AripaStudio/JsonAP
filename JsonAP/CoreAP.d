module CoreAP;

import std.string;
import std.conv;
import std.json;
import std.stdio;
import std.array;
import std.typecons;
import PublicCodeOtherCode;


alias Optional = Nullable;


public class CL_CoreAP
{
	public static bool isValidJson(string jsonContent)
	{
		try
		{
			parseJSON(jsonContent);
			return true;
		}catch(JSONException e)
		{			
			throw new JsonOperationException("Failed to parse JSON: " ~ e.msg, __FILE__, __LINE__, e);			
		}catch(Exception e)
		{
			throw new JsonOperationException("An unexpected error occurred during JSON parsing: " ~ e.msg, __FILE__, __LINE__, e);			
		}
	}

	public static Optional!long getJsonItemCount(string jsonContent)
	{
		try
		{
			JSONValue parsedJson = parseJSON(jsonContent);
			if(parsedJson.type == JSON_TYPE.OBJECT)
			{
				return Optional!long(cast(long)parsedJson.object.length);
			}else if (parsedJson.type == JSON_TYPE.ARRAY)
			{
				return Optional!long(cast(long)parsedJson.array.length);
			}else
			{
				return Optional!long(1L);
			}
		}catch(JSONException e)
		{
			return Optional!long.init;
		}catch(Exception e)
		{
			return Optional!long.init;
		}
	}

	public static bool isJsonNumber(string jsonContent)
	{
		try
		{
			JSONValue val = parseJSON(jsonContent);
			return val.type == JSON_TYPE.INTEGER || val.type == JSON_TYPE.FLOAT;
		}catch(JSONException e)
		{
			throw new JsonOperationException("Error Message(JSONException) :" ~ e.msg, __FILE__, __LINE__, e);						
		}catch(Exception e)
		{
			throw new JsonOperationException("Error Message(Exception) :" ~ e.msg, __FILE__, __LINE__, e);						
		}
	}


	public static bool isJsonString(string jsonContent)
	{
		try {
            JSONValue val = parseJSON(jsonContent);
            return val.type == JSON_TYPE.STRING;
        } catch (JSONException e) {
			throw new JsonOperationException("Error Message(JSONException) :" ~ e.msg, __FILE__, __LINE__, e);			            
        } catch (Exception e) {
			throw new JsonOperationException("Error Message(Exception) :" ~ e.msg, __FILE__, __LINE__, e);		            
        }
	}

	public static Optional!string prettyPrintJson(string jsonContent)
	{
		try{
			
			JSONValue val = parseJSON(jsonContent);
			return Optional!string(val.toPrettyString());
		}catch (JSONException e) {
			throw new JsonOperationException("Error Message(JSONException) :" ~ e.msg, __FILE__, __LINE__, e);			            
        } catch (Exception e) {
			throw new JsonOperationException("Error Message(Exception) :" ~ e.msg, __FILE__, __LINE__, e);		            
        }
	}


	



	
}
