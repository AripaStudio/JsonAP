module JsonAP;

import CoreAP;
import fileAP;
import PublicCodeOtherCode;

import std.typecons; 

alias Optional = Nullable;

public class JsonAP
{
	export static Optional!T readJsonFile(string filePath)() {
        return CL_FileAP.readJsonFile!T(filePath);
    }

    export static bool writeJsonFile(T)(string filePath, T data) {
        return CL_FileAP.writeJsonFile!T(filePath, data);
    }

    export static Optional!long getJsonFileSize(string filePath) {
        return CL_FileAP.getJsonFileSize(filePath);
    }

    export static Optional!(T[]) readJsonArray(string filePath)() {
        return CL_FileAP.readJsonArray!T(filePath);
    }

    export static bool isValidJson(string jsonContent) {
        return CL_CoreAP.isValidJson(jsonContent);
    }

    export static Optional!long getJsonItemCount(string jsonContent) {
        return CL_CoreAP.getJsonItemCount(jsonContent);
    }

    export static bool isJsonNumber(string jsonContent) {
        return CL_CoreAP.isJsonNumber(jsonContent);
    }

    export static bool isJsonString(string jsonContent) {
        return CL_CoreAP.isJsonString(jsonContent);
    }

    export static Optional!string prettyPrintJson(string jsonContent) {
        return CL_CoreAP.prettyPrintJson(jsonContent);
    }

    export static Optional!V getJsonValue(string jsonContent, string path)() {
        return CL_CoreAP.getJsonValue!V(jsonContent, path);
    }

    export static bool isJsonObject(string jsonContent) {
        return CL_CoreAP.isJsonObject(jsonContent);
    }

    export static bool isJsonArray(string jsonContent) {
        return CL_CoreAP.isJsonArray(jsonContent);
    }

    export static bool isDigitAP(dchar c){
        return CL_PublicCodeOtherCode.isDigitAP(c);
	}

    export static bool isInteger(string s){
        return CL_PublicCodeOtherCode.isInteger(s);
	}
}