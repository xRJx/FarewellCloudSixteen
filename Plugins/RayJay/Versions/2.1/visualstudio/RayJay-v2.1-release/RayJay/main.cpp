#include "Interface.h"
#include "Methods.h"
#include "curl/include/curl/curl.h"
#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;
using namespace GarrysMod::Lua;
using namespace Methods;

std::string productToken = "AISDFid89a3nmjkBAF89";
std::string webToken = "gb4w8o9HWILgrf3Tfg";
std::string version = "2.1";

bool fileExists(const char* filename)
{
	ifstream test(filename);
	return test.good();
}

bool Authorized(const char* securityToken)
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

static size_t WriteCallback(void *contents, size_t size, size_t nmemb, void *userp)
{
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

static void log(lua_State* state, const char* product, const char* key)
{
	const char* host = getHost(state);
	const char* ip = getIP(state);
	const char* port = getPort(state);
	
	CURL* curl;
	CURLcode res;
	std::string readBuffer;

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();

    curl_easy_setopt(curl, CURLOPT_URL, "http://rayjay.exiguous-productions.com/rayjay_log.php");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
	std::string info = std::string("host=") + host + std::string("&ip=") + ip + std::string("&port=") + port + std::string("&product=") + product + std::string("&key=") + key;
	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, info);

    curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    curl_global_cleanup();
}

int AddProduct(lua_State* state)
{
	LUA->CheckType(1, Type::STRING);
	LUA->CheckType(2, Type::STRING);
	LUA->CheckType(3, Type::STRING);

	const char* securityToken = LUA->GetString(3);
	
	if (!Authorized(securityToken))
	{
		print(state, "[RayJay] Security breach. Process terminated.");
		return 0;
	}

	const char* product = LUA->GetString(1);
	const char* key = LUA->GetString(2);

	CURL* curl;
	CURLcode res;
	std::string readBuffer;

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();

    curl_easy_setopt(curl, CURLOPT_URL, "http://rayjay.exiguous-productions.com/rayjay.php");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
	curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);
	std::string info = std::string("token=") + webToken + std::string("&product=") + product + std::string("&version=") + version + std::string("&key=") + key;
	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, info);

    curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    curl_global_cleanup();

	const char* cDirectory = "garrysmod/lua/autorun/server/";
	std::string cFile = product + std::string(".lua");
	std::string cFileDirectory = cDirectory + cFile;
	const char* creationFD = cFileDirectory.c_str();
	
	if (GetFileAttributes(cDirectory) == INVALID_FILE_ATTRIBUTES)
	{
		CreateDirectory(cDirectory, NULL);
	}

	if (fileExists(creationFD))
	{
		remove(creationFD);
	}

	std::ofstream o(creationFD);
	o << readBuffer << std::endl;
	o.close();

	std::string cFD = std::string("autorun/server/") + product + std::string(".lua");
	const char* compileFD = cFD.c_str();

	CompileFile(state, compileFD);
	remove(creationFD);

	log(state, product, key);

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