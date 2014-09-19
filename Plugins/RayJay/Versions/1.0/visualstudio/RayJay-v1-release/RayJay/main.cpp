#include "Interface.h"
#include "Methods.h"
#include "curl/include/curl/curl.h"
#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;
using namespace GarrysMod::Lua;
using namespace Methods;

string data;

size_t writeCallback(char* buf, size_t size, size_t nmemb, void* up)
{
	data = "";
	
	for (int c = 0; c<size*nmemb; c++)
    {
        data.push_back(buf[c]);
    }
    return size*nmemb;
}

std::string productToken = "3w69nhawihrkjlfed";
std::string webToken = "139hr879sdfy73";
std::string version = "1.0";

bool Secure(const char* securityToken)
{
	if (securityToken != productToken)
	{
		return false;
	}
	else
	{
		return true;
	}

	return false;
}

int AddProduct(lua_State* state)
{
	LUA->CheckType(1, Type::STRING);
	LUA->CheckType(2, Type::STRING);
	LUA->CheckType(3, Type::STRING);

	const char* securityToken = LUA->GetString(3);
	
	if (!Secure(securityToken))
	{
		print(state, "[RayJay] Security breach. Process terminated.");
		return 0;
	}

	const char* product = LUA->GetString(1);
	const char* key = LUA->GetString(2);
	
	CURL* curl;

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();

    curl_easy_setopt(curl, CURLOPT_URL, "http://rayjay.exiguous-productions.com/rayjay.php");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &writeCallback);
	std::string info = std::string("token=") + webToken + std::string("&product=") + product + std::string("&version=") + version + std::string("&key=") + key;
	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, info);

    curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    curl_global_cleanup();

	RunString(state, data.c_str());

    return 0;
}

GMOD_MODULE_OPEN(lua_State* state)
{
	int GlobalTable = GetGlobal(state);

	int RayJay = table::Create(state);
	table::PushCFunc(state, RayJay, "AddProduct", AddProduct);
	table::PushTable(state,  GlobalTable, RayJay, "RayJay");

	LUA->ReferenceFree(GlobalTable);
	LUA->ReferenceFree(RayJay);

	print(state, "[RayJay] RayJay is active. Please wait while your products are loaded.");

	return 0;
}

GMOD_MODULE_CLOSE()
{
    return 0;
}